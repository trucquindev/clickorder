<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý đồ uống</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 40px;
            color: #4e342e;
        }

        h1 {
            color: #4e342e;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
        }

        /* Thanh điều hướng */
        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 50px;
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

        /* Bảng đồ uống */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        th, td {
            padding: 12px 20px;
            text-align: left;
            font-size: 1em;
        }

        th {
            background-color: #6d4c41;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #eee;
            cursor: pointer;
        }

        /* Cột hành động */
        .td-action {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        /* Nút */
        button {
            padding: 8px 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #6d4c41;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #4e342e;
            transform: translateY(-2px);
        }

        /* Thêm mới đồ uống */
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 15px 30px;
            background-color: #4e342e;
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 10px;
            transition: background 0.3s ease;
        }

        a:hover {
            background-color: #6d4c41;
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

<h2>Danh sách đồ uống</h2>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="drink" items="${drinks}">
        <tr>
            <td>${drink.id}</td>
            <td>${drink.name}</td>
            <td>${drink.price}</td>
            <td>${drink.description}</td>
            <td class="td-action">
                <form method="post" action="/admin/drinks/delete/${drink.id}">
                    <button type="submit">Xóa</button>
                </form>
                <form method="get" action="/admin/drinks/edit/${drink.id}">
                    <button type="submit">Chỉnh sửa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/admin/drinks/add">Thêm đồ uống mới</a>

</body>
</html>
