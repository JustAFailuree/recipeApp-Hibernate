package com.example.recipeApp.controller;

import com.example.recipeApp.model.Comment;
import com.example.recipeApp.model.Rating;
import com.example.recipeApp.repository.CommentRepository;
import com.example.recipeApp.repository.RatingRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.recipeApp.model.Recipe;
import com.example.recipeApp.model.User;
import com.example.recipeApp.repository.RecipeRepository;
import com.example.recipeApp.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class RecipeController {

    private final RecipeRepository recipeRepository;
    private final CommentRepository commentRepository;
    private final UserRepository userRepository;
    private final RatingRepository ratingRepository;

    public RecipeController(RecipeRepository recipeRepository, CommentRepository commentRepository,
                            UserRepository userRepository, RatingRepository ratingRepository) {
        this.recipeRepository = recipeRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
        this.ratingRepository = ratingRepository;
    }

    @GetMapping("/recipes")
    public String listRecipes(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        int pageSize = 9;
        Pageable pageable = PageRequest.of(page, pageSize, Sort.by("id").descending());

        Page<Recipe> recipePage = recipeRepository.findAll(pageable);
        List<Recipe> recipes = recipePage.getContent();

        Map<Long, Double> ratings = new HashMap<>();
        for (Recipe recipe : recipes) {
            double averageScore = ratingRepository.findAverageScoreByRecipeId(recipe.getId());
            ratings.put(recipe.getId(), averageScore);
        }

        model.addAttribute("recipes", recipes);
        model.addAttribute("ratings", ratings);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", recipePage.getTotalPages());
        model.addAttribute("totalItems", recipePage.getTotalElements());

        return "recipes";
    }

    @GetMapping("/add_recipe")
    public String add_recipe(){
        return "add_recipe";
    }

@GetMapping("/recipes/{id}")
public String getRecipeDetails(@PathVariable Long id, Model model, HttpSession session) {
    Optional<Recipe> recipeOpt = recipeRepository.findById(id);
    if (recipeOpt.isEmpty()) {
        return "redirect:/recipes";
    }

    Recipe recipe = recipeOpt.get();
    model.addAttribute("recipe", recipe);

    boolean isOwner = false;
    Object userIdObj = session.getAttribute("loggedUserId");

    if (userIdObj != null) {
        Long loggedUserId = (Long) userIdObj;
        if (recipe.getUser() != null && recipe.getUser().getId().equals(loggedUserId)) {
            isOwner = true;
        }
    }

    model.addAttribute("isOwner", isOwner);
    return "recipe-details";
}

    @PostMapping("/recipes/{id}/add-comment")
    public String addComment(@PathVariable Long id, @ModelAttribute("newComment") Comment newComment, HttpSession session) {
        Optional<Recipe> recipeOpt = recipeRepository.findById(id);

        Long userId = (Long) session.getAttribute("loggedUserId");
        Optional<User> userOpt = userRepository.findById(userId);

        if (recipeOpt.isPresent() && userOpt.isPresent()) {
            newComment.setRecipe(recipeOpt.get());
            newComment.setUser(userOpt.get());
            newComment.setCreatedAt(LocalDateTime.now());
            commentRepository.save(newComment);
        }

        return "redirect:/recipes/" + id;
    }


    @PostMapping("/add")
    public ResponseEntity<String> addRecipe(@RequestBody Recipe recipe) {
        return ResponseEntity.ok("Recipe added successfully");
    }

    private static final String UPLOAD_DIR = "uploads/";

    private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);

    @GetMapping("/recipe/add")
    public String showAddRecipeForm(Model model) {
        List<String> categories = List.of("Desery", "Dania główne", "Wegetariańskie", "Przekąski", "Zupy");

        logger.debug("Dostępne kategorie: {}", categories);

        model.addAttribute("categories", categories);
        model.addAttribute("recipe", new Recipe());
        return "add_recipe";
    }

    @PostMapping("/recipe/add")
    public String addRecipe(@ModelAttribute Recipe recipe,
                            @RequestParam MultipartFile image,
                            @RequestParam String category,
                            HttpSession session,
                            Model model) {

        Long userId = (Long) session.getAttribute("loggedUserId");
        if (userId == null) {
            model.addAttribute("error", "Musisz być zalogowany, aby dodać przepis!");
            return "login";
        }

        User user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            model.addAttribute("error", "Nie znaleziono użytkownika.");
            return "login";
        }

        if (category == null || category.isEmpty()) {
            model.addAttribute("error", "Wybierz kategorię.");
            return "add_recipe";
        }

        String imagePath = null;
        if (!image.isEmpty()) {
            imagePath = saveImage(image);
        }

        recipe.setUser(user);
        recipe.setCategory(category);
        recipe.setImagePath(imagePath);

        recipeRepository.save(recipe);

        return "redirect:/index";
    }

private String saveImage(MultipartFile image) {
    if (image.isEmpty()) {
        return null;
    }

    try {
        File uploadDir = new File(UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
        Path path = Path.of(UPLOAD_DIR + fileName);
        Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

        return "/uploads/" + fileName;
    } catch (IOException e) {
        logger.error("Błąd podczas zapisywania pliku.", e);
        return null;
    }
}

    @PostMapping("/recipes/{id}/rate")
    public String rateRecipe(@PathVariable Long id,
                             @RequestParam int score,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        Long userId = (Long) session.getAttribute("loggedUserId");
        if (userId == null) {
            redirectAttributes.addFlashAttribute("error", "Musisz być zalogowany, aby ocenić przepis!");
            return "redirect:/login";
        }

        Optional<User> userOpt = userRepository.findById(userId);
        Optional<Recipe> recipeOpt = recipeRepository.findById(id);

        if (userOpt.isPresent() && recipeOpt.isPresent()) {
            User user = userOpt.get();
            Recipe recipe = recipeOpt.get();

            Optional<Rating> existingRating = ratingRepository.findByUserIdAndRecipeId(userId, id);
            if (existingRating.isPresent()) {
                redirectAttributes.addFlashAttribute("error", "Już oceniłeś ten przepis!");
                return "redirect:/recipes";
            }

            Rating newRating = new Rating();
            newRating.setUser(user);
            newRating.setRecipe(recipe);
            newRating.setScore(score);
            newRating.setCreatedAt(LocalDateTime.now());

            ratingRepository.save(newRating);

            redirectAttributes.addFlashAttribute("success", "Dziękujemy za ocenę!");
        }

        return "redirect:/recipes";
    }

    @GetMapping("/recipes/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model, HttpSession session) {
        Object userIdObj = session.getAttribute("loggedUserId");

        if (userIdObj == null) {
            return "redirect:/login";
        }

        Long loggedUserId = (Long) userIdObj;

        Optional<Recipe> recipeOpt = recipeRepository.findById(id);
        if (recipeOpt.isEmpty()) {
            return "redirect:/recipes";
        }

        Recipe recipe = recipeOpt.get();

        if (!recipe.getUser().getId().equals(loggedUserId)) {
            return "redirect:/403";
        }

        model.addAttribute("recipe", recipe);
        return "edit-recipe";
    }

    @PostMapping("/recipes/{id}/edit")
    public String updateRecipe(@PathVariable Long id,
                               @ModelAttribute Recipe updatedRecipe,
                               @RequestParam("imageFile") MultipartFile imageFile,
                               BindingResult result,
                               HttpSession session) {
        Object userIdObj = session.getAttribute("loggedUserId");

        if (userIdObj == null) {
            return "redirect:/login";
        }

        Long loggedUserId = (Long) userIdObj;

        if (result.hasErrors()) {
            return "edit-recipe";
        }

        Optional<Recipe> existingRecipeOpt = recipeRepository.findById(id);
        if (existingRecipeOpt.isEmpty()) {
            return "redirect:/recipes";
        }

        Recipe recipe = existingRecipeOpt.get();

        if (!recipe.getUser().getId().equals(loggedUserId)) {
            return "redirect:/403";
        }

        recipe.setTitle(updatedRecipe.getTitle());
        recipe.setIngredients(updatedRecipe.getIngredients());
        recipe.setSteps(updatedRecipe.getSteps());
        recipe.setTime(updatedRecipe.getTime());
        recipe.setDifficulty(updatedRecipe.getDifficulty());
        recipe.setCategory(updatedRecipe.getCategory());

        if (!imageFile.isEmpty()) {
            try {
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                String filename = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Path imagePath = Paths.get(uploadDir.getAbsolutePath(), filename);
                Files.copy(imageFile.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

                recipe.setImagePath("/uploads/" + filename);
            } catch (IOException e) {
                logger.error("Błąd podczas zapisywania nowego zdjęcia.", e);
            }
        }

        recipeRepository.save(recipe);
        return "redirect:/recipes/" + id;
    }

    @PostMapping("/recipes/{id}/delete")
    public String deleteRecipe(@PathVariable Long id, HttpSession session) {
        Object userIdObj = session.getAttribute("loggedUserId");
        if (userIdObj == null) {
            return "redirect:/login";
        }

        Long loggedUserId = (Long) userIdObj;
        Optional<Recipe> recipeOpt = recipeRepository.findById(id);

        if (recipeOpt.isEmpty()) {
            return "redirect:/recipes";
        }

        Recipe recipe = recipeOpt.get();

        if (!recipe.getUser().getId().equals(loggedUserId)) {
            return "redirect:/403";
        }

        recipeRepository.delete(recipe);

        return "redirect:/recipes";
    }
}
