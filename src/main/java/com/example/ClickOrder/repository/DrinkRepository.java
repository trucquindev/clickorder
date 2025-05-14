package com.example.ClickOrder.repository;

import com.example.ClickOrder.model.Drink;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface DrinkRepository extends MongoRepository<Drink, String> {
    List<Drink> findByNameContainingIgnoreCase(String name);

}
