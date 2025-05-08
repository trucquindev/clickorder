package com.example.ClickOrder.repository;

import com.example.ClickOrder.model.Drink;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface DrinkRepository extends MongoRepository<Drink, String> {

}
