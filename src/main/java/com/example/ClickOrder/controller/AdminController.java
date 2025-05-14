package com.example.ClickOrder.controller;

import com.example.ClickOrder.model.Drink;
import com.example.ClickOrder.model.Order;
import com.example.ClickOrder.repository.DrinkRepository;
import com.example.ClickOrder.repository.OrderRepository;
import com.example.ClickOrder.repository.UserRepository;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.data.mongodb.core.aggregation.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.time.ZoneId;
import java.util.*;
import java.util.List;
import java.util.stream.Stream;

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
    public String drinks(@RequestParam(required = false) String keyword, Model model) {
        List<Drink> drinks;

        if (keyword != null && !keyword.isEmpty()) {
            drinks = drinkRepo.findAll()
                    .stream()
                    .filter(d -> d.getName().toLowerCase().contains(keyword.toLowerCase()))
                    .toList();
        } else {
            drinks = drinkRepo.findAll();
        }

        model.addAttribute("drinks", drinks);
        model.addAttribute("keyword", keyword);
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
    public String orders(@RequestParam(required = false) String keyword,
                         @RequestParam(required = false) String status,
                         Model model) {
        List<Order> orders = orderRepo.findAll();

        if (keyword != null && !keyword.isEmpty()) {
            orders = orders.stream()
                    .filter(o -> o.getCustomerName().toLowerCase().contains(keyword.toLowerCase()))
                    .toList();
        }

        if (status != null && !status.isEmpty()) {
            orders = orders.stream()
                    .filter(o -> o.getStatus().equalsIgnoreCase(status))
                    .toList();
        }
        model.addAttribute("orders", orders);
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);
        return "manageOrders";
    }
    @GetMapping("/orders/export")
    public void exportOrdersToPDF(HttpServletResponse response) throws Exception {
        List<Order> orders = orderRepo.findAll();

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=orders.pdf");

        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Tiêu đề
        Font titleFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 18, BaseColor.DARK_GRAY);
        Paragraph title = new Paragraph("ORDER LIST", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingAfter(20f);
        document.add(title);

        // Bảng
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);
        table.setWidths(new int[]{2, 3, 3, 2, 2, 3});

        Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

        // Header
        Stream.of("Guest name", "Product", "Quanlity", "Total", "Status", "Time")
                .forEach(column -> {
                    PdfPCell header = new PdfPCell();
                    header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                    header.setPhrase(new Phrase(column, headFont));
                    header.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(header);
                });

        // Nội dung
        for (Order order : orders) {
            table.addCell(order.getCustomerName());
            table.addCell(order.getDrink().getName());
            table.addCell(String.valueOf(order.getQuantity()));
            table.addCell(String.format("%.2f", order.getTotal()));
            table.addCell(order.getStatus());
            table.addCell(order.getCreatedAt().toString());
        }

        document.add(table);
        document.close();
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
    @GetMapping("/stats/export")
    public void exportStatsToPDF(HttpServletResponse response) throws Exception {
        List<Order> orders = orderRepo.findAll();

        // Tổng doanh thu
        Double totalRevenue = orders.stream().mapToDouble(Order::getTotal).sum();
        long totalOrders = orders.size();
        long totalUsers = userRepo.count();

        // Trạng thái
        Map<String, Long> orderStatusCounts = new HashMap<>();
        orders.forEach(order -> {
            orderStatusCounts.merge(order.getStatus(), 1L, Long::sum);
        });

        // Top user
        Aggregation agg = Aggregation.newAggregation(
                Aggregation.group("customerName")
                        .count().as("orderCount")
                        .sum("total").as("totalSpent"),
                Aggregation.sort(Sort.Direction.DESC, "orderCount"),
                Aggregation.limit(3)
        );
        AggregationResults<Map> results = mongoTemplate.aggregate(agg, "orders", Map.class);
        List<Map> topUsers = results.getMappedResults();

        // Doanh thu theo tháng
        List<Order> allOrders = orderRepo.findAll();
        Calendar cal = Calendar.getInstance();
        double[] monthlyRevenue = new double[12];
        for (Order o : allOrders) {
            if (o.getCreatedAt() != null) {
                cal.setTime(Date.from(o.getCreatedAt().toInstant()));
                int month = cal.get(Calendar.MONTH);
                monthlyRevenue[month] += o.getTotal();
            }
        }

        // Export PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=stats.pdf");

        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
        Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

        document.add(new Paragraph("SYSTEM STATISTICS", titleFont));
        document.add(new Paragraph("Creation date: " + new Date(), normalFont));
        document.add(new Paragraph(" ")); // dòng trắng

        // Tổng quan
        document.add(new Paragraph("Total revenue: $" + totalRevenue, normalFont));
        document.add(new Paragraph("Total order: " + totalOrders, normalFont));
        document.add(new Paragraph("Total users: " + totalUsers, normalFont));
        document.add(new Paragraph(" "));

        // Trạng thái
        document.add(new Paragraph("Order by status:", normalFont));
        for (Map.Entry<String, Long> entry : orderStatusCounts.entrySet()) {
            document.add(new Paragraph("- " + entry.getKey() + ": " + entry.getValue(), normalFont));
        }
        document.add(new Paragraph(" "));

        // Top người dùng
        document.add(new Paragraph("Top users:", normalFont));
        for (Map user : topUsers) {
            document.add(new Paragraph("- " + user.get("_id") + " | Order: " + user.get("orderCount") + " | Spend: $" + user.get("totalSpent"), normalFont));
        }
        document.add(new Paragraph(" "));

        // Doanh thu theo tháng
        document.add(new Paragraph("Monthly Revenue:", normalFont));
        for (int i = 0; i < 12; i++) {
            document.add(new Paragraph("Month " + (i + 1) + ": $" + String.format("%.2f", monthlyRevenue[i]), normalFont));
        }

        document.close();
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
