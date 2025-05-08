<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách đơn hàng</title>
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
        h2 {
            text-align: center;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #2980b9;
            text-decoration: none;
        }
        .btn-edit{
            text-decoration: none;
            padding: 5px;
            border: 1px solid forestgreen;
            border-radius: 5px;
            background-color: darkseagreen;
            color: white;
        }
        .btn-delete{
            text-decoration: none;
            padding: 5px;
            border: 1px solid red;
            background-color: red;
            border-radius: 5px;
            color: white;
        }
        .btn-edit:hover{
            background-color: forestgreen;
            text-decoration: none;
        }
        .btn-delete:hover{
            background-color: darkred;
            text-decoration: none;
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
<h2>Danh sách đơn hàng</h2>
<table class="table">
    <tr>
        <th>Tên khách hàng</th>
        <th>Địa chỉ</th>
        <th>Thức uống</th>
        <th>Số lượng</th>
        <th>Tổng tiền</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="order" items="${orders}">
        <tr class="tr-item">
            <td>${order.customerName}</td>
            <td>${order.address}</td>
            <td>${order.drink.name}</td>
            <td>${order.quantity}</td>
            <td>${order.total}</td>
            <td>
                <a class="btn-edit" href="/orders/edit/${order.id}">Chỉnh sửa</a> |
                <a class="btn-delete" href="/orders/delete/${order.id}" onclick="return confirm('Xóa đơn hàng này?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
