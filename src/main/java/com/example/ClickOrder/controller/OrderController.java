package com.example.ClickOrder.controller;

import com.example.ClickOrder.model.Drink;
import com.example.ClickOrder.model.Order;
import com.example.ClickOrder.repository.OrderRepository;
import com.example.ClickOrder.repository.DrinkRepository; // nếu cần danh sách Drink để hiển thị
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderRepository orderRepo;

    @Autowired
    private DrinkRepository drinkRepo;

    // Hiển thị danh sách order
    @GetMapping
    public String listOrders(Model model, HttpSession session) {
        String username = (String) session.getAttribute("username");
        model.addAttribute("orders", orderRepo.findByCustomerName(username));
        return "orders";
    }

    // Hiển thị form chỉnh sửa
    @GetMapping("/edit/{id}")
    public String editOrderForm(@PathVariable String id, Model model) {
        Optional<Order> orderOpt = orderRepo.findById(id);
        if (orderOpt.isPresent()) {
            model.addAttribute("order", orderOpt.get());
            model.addAttribute("drinks", drinkRepo.findAll());
            return "editOrder";
        } else {
            return "redirect:/orders";
        }
    }

    // Xử lý lưu sau khi chỉnh sửa
    @PostMapping("/edit")
    public String updateOrder(@ModelAttribute Order order) {
        Drink drink = drinkRepo.findById(order.getDrink().getId()).orElse(null);
        if (drink == null) return "redirect:/";
        order.setDrink(drink);
        double total = drink.getPrice() * order.getQuantity();
        order.setTotal(total);
        orderRepo.save(order);
        return "redirect:/orders";
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable String id) {
        orderRepo.deleteById(id);
        return "redirect:/orders";
    }
}
