package com.example.ClickOrder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.ClickOrder", "com.example.ClickOrder.security"})
public class ClickOrderApplication {
	public static void main(String[] args) {
		SpringApplication.run(ClickOrderApplication.class, args);
	}
}
