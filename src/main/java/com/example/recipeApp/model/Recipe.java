package com.example.recipeApp.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "recipe")
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    @Column(name = "ingredients", columnDefinition = "TEXT")
    private String ingredients;
    @Column(name = "steps", columnDefinition = "TEXT")
    private String steps;
    private int time;
    private String difficulty;
    private String imagePath;
    private String category;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "recipe", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Rating> ratings = new ArrayList<>();

    @OneToMany(mappedBy = "recipe", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    public List<Comment> getComments() {
        return comments;
    }

    public Recipe() {
    }

    public Recipe(String title, String ingredients, String steps, int time, String difficulty, String imagePath, User user, String category) {
        this.title = title;
        this.ingredients = ingredients;
        this.steps = steps;
        this.time = time;
        this.difficulty = difficulty;
        this.imagePath = imagePath;
        this.user = user;
        this.category = category;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getIngredients() { return ingredients; }
    public void setIngredients(String ingredients) { this.ingredients = ingredients; }
    public String getSteps() { return steps; }
    public void setSteps(String steps) { this.steps = steps; }
    public int getTime() { return time; }
    public void setTime(int time) { this.time = time; }
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}
