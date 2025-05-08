<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách đơn hàng</title>
    <style>
        /* Tổng thể */
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

        /* Bảng đơn hàng */
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

        /* Form Thao tác */
        select, button {
            padding: 8px 12px;
            border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #fff;
            font-size: 1em;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        select:focus, button:focus {
            outline: none;
            border-color: #6d4c41;
        }

        button {
            background-color: #6d4c41;
            color: white;
            font-weight: bold;
            margin-left: 10px;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #4e342e;
        }

        select {
            background-color: #f9f9f9;
        }

        select:hover {
            background-color: #f1f1f1;
        }

        /* Thêm không gian cho nội dung */
        td {
            vertical-align: middle;
        }

        /* Footer */
        footer {
            margin-top: 50px;
            text-align: center;
            color: #6d4c41;
        }
    </style>
</head>
<body>
<h1>Danh sách đơn hàng</h1>
<div class="nav">
    <a href="/admin/drinks">Quản lý đồ uống</a>
    <a href="/admin/orders">Đơn hàng</a>
    <a href="/admin/users">Người dùng</a>
    <a href="/admin/stats">Thống kê</a>
</div>

<h2>Danh sách đơn hàng</h2>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Người đặt</th>
        <th>Sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Trạng thái</th>
        <th>Thời gian</th>
        <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.id}</td>
            <td>${order.customerName}</td>
            <td>${order.drink.name}</td>
            <td>${order.total}</td>
            <td>${order.status}</td>
            <td>${order.createdAt}</td>
            <td>
                <form method="post" action="/admin/orders/updateStatus">
                    <input type="hidden" name="id" value="${order.id}" />
                    <select name="status">
                        <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>Pending</option>
                        <option value="staring" ${order.status == 'staring' ? 'selected' : ''}>Staring</option>
                        <option value="finishing" ${order.status == 'finishing' ? 'selected' : ''}>Finishing</option>
                    </select>
                    <button type="submit">Cập nhật</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<footer>
    <p>&copy; 2025 CafeChill. Tất cả quyền được bảo vệ.</p>
</footer>
</body>
</html>
