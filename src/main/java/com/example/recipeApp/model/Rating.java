package com.example.recipeApp.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "rating")
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "recipe_id", nullable = false)
    private Recipe recipe;

    private int score;

    @Column(nullable = false)
    private LocalDateTime createdAt;

    public Rating() {}

    public Rating(User user, Recipe recipe, int score) {
        this.user = user;
        this.recipe = recipe;
        this.score = score;
        this.createdAt = LocalDateTime.now();
    }

    public Long getId() { return id; }
    public User getUser() { return user; }
    public Recipe getRecipe() { return recipe; }
    public int getScore() { return score; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setUser(User user) { this.user = user; }
    public void setRecipe(Recipe recipe) { this.recipe = recipe; }
    public void setScore(int score) { this.score = score; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
