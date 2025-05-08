<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thanh toán</title>
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
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }
        .bill {
            background: white;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 50%;
            max-width: 600px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .bill h2 {
            margin-bottom: 20px;
        }
        .bill p {
            font-size: 16px;
            margin: 8px 0;
        }
        .total {
            font-size: 20px;
            font-weight: bold;
            color: #e91e63;
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
<div class="container">
    <div class="bill">
        <h2>Hóa đơn thanh toán</h2>
        <p><strong>Khách hàng:</strong> ${order.customerName}</p>
        <p><strong>Địa chỉ:</strong> ${order.address}</p>
        <p><strong>Sản phẩm:</strong> ${drink.name}</p>
        <p><strong>Số lượng:</strong> ${order.quantity}</p>
        <p class="total">Tổng tiền: ${order.total}₫</p>
        <form action="/checkout" method="post">
            <button type="submit">Xác nhận thanh toán</button>
        </form>

    </div>
</div>
</body>
</html>
