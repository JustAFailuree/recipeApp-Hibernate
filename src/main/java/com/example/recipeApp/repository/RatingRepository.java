package com.example.recipeApp.repository;

import com.example.recipeApp.model.Rating;
import com.example.recipeApp.model.Recipe;
import com.example.recipeApp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RatingRepository extends JpaRepository<Rating, Long> {
    @Query("SELECT r FROM Rating r WHERE r.user.id = :userId AND r.recipe.id = :recipeId")
    Optional<Rating> findByUserIdAndRecipeId(@Param("userId") Long userId, @Param("recipeId") Long recipeId);

    @Query("SELECT COALESCE(AVG(r.score), 0) FROM Rating r WHERE r.recipe.id = :recipeId")
    double findAverageScoreByRecipeId(@Param("recipeId") Long recipeId);

}
