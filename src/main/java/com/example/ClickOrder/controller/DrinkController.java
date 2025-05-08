package com.example.ClickOrder.controller;

import com.example.ClickOrder.model.Drink;
import com.example.ClickOrder.model.Order;
import com.example.ClickOrder.repository.DrinkRepository;
import com.example.ClickOrder.repository.OrderRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class DrinkController {

    @Autowired
    private DrinkRepository drinkRepo;
    @Autowired
    private OrderRepository orderRepo;
    private Order currentOrder;
    @GetMapping("/")
    public String viewHomePage(HttpSession secction, Model model) {

        if (secction.getAttribute("username")==null){
            return "redirect:/login";
        }
//        model.addAttribute("listDrinks", drinkRepo.findAll());
        if (secction.getAttribute("role").equals("ADMIN")) {
            return "dashboard";
        }
        return "index";
    }
    @GetMapping("/drinks")
    public String viewDrinksPage(Model model) {
        model.addAttribute("listDrinks", drinkRepo.findAll());
        return "listDrinks";
    }
    @GetMapping("drinks/{id}")
    public String drinkDetail(@PathVariable(value = "id") String id, Model model) {
        Drink drink = drinkRepo.findById(id).orElse(null);
        model.addAttribute("drink", drink);
        return "drinkDetail";
    }

    @GetMapping("/order/{id}")
    public String orderForm(@PathVariable("id") String id, Model model) {
        Drink drink = drinkRepo.findById(id).orElse(null);
        String username = (String) model.getAttribute("username");
        model.addAttribute("username", username);
        model.addAttribute("drink", drink);
        return "orderDrink";
    }
    @GetMapping("/contact")
    public String Contact() {
        return "contact";
    }
    @PostMapping("/submitOrder")
    public String submitOrder(@RequestParam String drinkId,
                              @RequestParam int quantity,
                              @RequestParam String customerName,
                              @RequestParam String address,
                              Model model) {
        Drink drink = drinkRepo.findById(drinkId).orElse(null);
        if (drink == null) return "redirect:/";

        double total = quantity * drink.getPrice();
        Order order = new Order();
        order.setId(String.valueOf(Math.random()*10));
        order.setDrink(drink);
        order.setQuantity(quantity);
        order.setCustomerName(customerName);
        order.setAddress(address);
        order.setTotal(total);

        currentOrder = order; // tạm lưu
        model.addAttribute("order", order);
        model.addAttribute("drink", drink);

        return "checkout";
    }
    @PostMapping("/checkout")
    public String confirmOrder(Model model) {
        // TODO: Nếu muốn lưu DB thì lưu currentOrder ở đây
        System.out.println(currentOrder);
        orderRepo.save(currentOrder);
        model.addAttribute("order", currentOrder);
        return "success";
    }

    @PostMapping("/submitContact")
    public String submitContact(@RequestParam String name,
                                @RequestParam String email,
                                @RequestParam String message,
                                Model model) {
        // TODO: xử lý lưu hoặc gửi mail
        model.addAttribute("message", "Cảm ơn bạn đã liên hệ!");
        return "contactSuccess"; // tạo thêm trang cảm ơn
    }
    @PostMapping("/saveDrink")
    public String saveDrink(@ModelAttribute("drink") Drink drink) {
        drinkRepo.save(drink);
        return "redirect:/";
    }
}
