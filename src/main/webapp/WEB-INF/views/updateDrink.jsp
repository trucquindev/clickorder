<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update Drink</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #4e342e;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #6d4c41;
            text-align: center;
            margin-top: 30px;
            font-size: 2em;
        }

        /* Thanh điều hướng */
        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .nav a {
            padding: 15px 30px;
            background: #6d4c41;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .nav a:hover {
            background: #4e342e;
            transform: translateY(-5px);
        }

        /* Form nhập liệu */
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            outline: none;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #6d4c41;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #6d4c41;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4e342e;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<h1>Quản trị hệ thống CafeChill</h1>

<div class="nav">
    <a href="/admin/drinks">Quản lý đồ uống</a>
    <a href="/admin/orders">Đơn hàng</a>
    <a href="/admin/users">Người dùng</a>
    <a href="/admin/stats">Thống kê</a>
</div>

<h2>Cập nhật đồ uống</h2>

<form action="/admin/drinks/savedDrink" method="post">
    <input type="hidden" name="id" value="${drink.id}" />
    <div>
        <label for="name">Tên đồ uống:</label>
        <input type="text" name="name" id="name" value="${drink.name}" required />
    </div>
    <div>
        <label for="description">Mô tả:</label>
        <input type="text" name="description" id="description" value="${drink.description}" required />
    </div>
    <div>
        <label for="price">Giá (VND):</label>
        <input type="text" name="price" id="price" value="${drink.price}" required />
    </div>
    <input type="submit" value="Cập nhật"/>
</form>

</body>
</html>
