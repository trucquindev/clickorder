<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách người dùng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #4e342e;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
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

        /* Bảng danh sách người dùng */
        table {
            width: 80%;
            margin-top: 30px;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #6d4c41;
            color: white;
        }

        td {
            background-color: #f1f1f1;
        }

        button {
            padding: 5px 10px;
            background-color: #e53935;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #c62828;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<h1>Danh sách người dùng</h1>

<div class="nav">
    <a href="/admin/drinks">Quản lý đồ uống</a>
    <a href="/admin/orders">Đơn hàng</a>
    <a href="/admin/users">Người dùng</a>
    <a href="/admin/stats">Thống kê</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Tên đăng nhập</th>
        <th>Vai trò</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.role}</td>
            <td>
                <form method="post" action="/admin/users/delete/${user.id}">
                    <button type="submit">Xóa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
