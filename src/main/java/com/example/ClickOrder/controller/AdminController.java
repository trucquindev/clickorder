package com.example.ClickOrder.controller;

import com.example.ClickOrder.model.Drink;
import com.example.ClickOrder.model.Order;
import com.example.ClickOrder.repository.DrinkRepository;
import com.example.ClickOrder.repository.OrderRepository;
import com.example.ClickOrder.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.data.mongodb.core.aggregation.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.ZoneId;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    DrinkRepository drinkRepo;
    @Autowired
    OrderRepository orderRepo;
    @Autowired
    UserRepository userRepo;
    @Autowired
    private MongoTemplate mongoTemplate;
    @GetMapping("/drinks")
    public String drinks(Model model) {
        model.addAttribute("drinks", drinkRepo.findAll());
        return "manageDrinks";
    }
    @GetMapping("/drinks/add")
    public String AddDrinksForm(Model model) {
        model.addAttribute("drinks", new Drink());
        return "addDrink";
    }
    @PostMapping("/drinks/savedDrink")
    public String addDrink(@ModelAttribute Drink drink, Model model) {
        drinkRepo.save(drink);
        return "redirect:/admin/drinks";
    }

    @PostMapping("/drinks/delete/{id}")
    public String deleteDrink(@PathVariable String id) {
        drinkRepo.deleteById(id);
        return "redirect:/admin/drinks";
    }
    @GetMapping("/drinks/edit/{id}")
    public String showFormForUpdate(@PathVariable(value = "id") String id, Model model) {
        Drink drink = drinkRepo.findById(id).orElse(null);
        model.addAttribute("drink", drink);
        return "updateDrink";
    }
    @GetMapping("/orders")
    public String orders(Model model) {
        model.addAttribute("orders", orderRepo.findAll());
        return "manageOrders";
    }
    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", userRepo.findByRole("USER"));
        return "manageUser";
    }
    @GetMapping("/stats")
    public String stats(Model model) {
        // Tổng doanh thu
        Double totalRevenue = orderRepo.findAll()
                .stream()
                .mapToDouble(Order::getTotal)
                .sum();

        // Tổng số đơn hàng
        long totalOrders = orderRepo.count();

        // Tổng số người dùng
        long totalUsers = userRepo.count();

        // Đếm theo trạng thái
        Map<String, Long> orderStatusCounts = new HashMap<>();
        orderRepo.findAll().forEach(order -> {
            orderStatusCounts.merge(order.getStatus(), 1L, Long::sum);
        });

        // Top người dùng đặt hàng nhiều nhất
        Aggregation agg = Aggregation.newAggregation(
                Aggregation.group("customerName")
                        .count().as("orderCount")
                        .sum("total").as("totalSpent"),
                Aggregation.sort(Sort.Direction.DESC, "orderCount"),
                Aggregation.limit(1)
        );

        AggregationResults<Map> results = mongoTemplate.aggregate(agg, "orders", Map.class);
        List<Map> topUsers = results.getMappedResults();

        // Doanh thu theo tháng
        List<Integer> months = new ArrayList<>();
        List<Double> monthRevenue = new ArrayList<>();
        Calendar cal = Calendar.getInstance();

        for (int month = 0; month < 12; month++) {
            double monthSum = 0.0;
            for (Order o : orderRepo.findAll()) {
                cal.setTime(o.getCreatedAt());
                if (cal.get(Calendar.MONTH) == month) {
                    monthSum += o.getTotal();
                }
            }
            months.add(month + 1);
            monthRevenue.add(monthSum);
        }

        // Truyền sang view
        model.addAttribute("totalRevenue", totalRevenue);
        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("statusCounts", orderStatusCounts);
        model.addAttribute("topUsers", topUsers);
        System.out.println(topUsers);
        model.addAttribute("labels", months);
        model.addAttribute("data", monthRevenue);

        return "stats";
    }
    @PostMapping("/orders/updateStatus")
    public String updateStatus(@RequestParam String id, @RequestParam String status) {
        Order order = orderRepo.findById(id).orElse(null);
        if (order != null) {
            order.setStatus(status);
            orderRepo.save(order);
        }
        return "redirect:/admin/orders";
    }

}
