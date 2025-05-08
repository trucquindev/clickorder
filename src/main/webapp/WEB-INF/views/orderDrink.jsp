<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đặt món</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #fffdf7;
        }
        .navbar {
            background-color: #AABBCC;
            padding: 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        .navbar a:hover {
            color: #4e342e;
        }
        .wraper{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }
        .order-form {
            background: white;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .order-form h2 {
            text-align: center;
        }
        .order-form input[type="text"],
        .order-form input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 12px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .order-form button {
            background-color: #2196f3;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
        }
        .order-form button:hover {
            background-color: #1976d2;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div><strong>CafeChill</strong></div>
    <div>
        <a href="/">Trang chủ</a>
        <a href="/drinks">Thực đơn</a>
        <a href="/orders">Đặt hàng</a>
        <a href="/contact">Liên hệ</a>
    </div>
</div>
<div class="wraper">
    <div class="order-form">
        <h2>Đặt món: ${drink.name}</h2>
        <form action="/submitOrder" method="post">
            <input type="hidden" name="drinkId" value="${drink.id}" />
            <label>Số lượng:</label>
            <input type="number" name="quantity" min="1" required />

            <label>Tên khách hàng:</label>
            <input type="text" name="customerName" value="${username}" />

            <label>Địa chỉ giao hàng:</label>
            <input type="text" name="address" required />

            <button type="submit">Xác nhận đặt hàng</button>
        </form>
    </div>
</div>
</body>
</html>
