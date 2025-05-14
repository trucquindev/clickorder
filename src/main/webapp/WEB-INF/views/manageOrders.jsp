<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách đơn hàng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fff8f4;
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

        .nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .nav a {
            padding: 12px 24px;
            background: #6d4c41;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .nav a:hover {
            background: #4e342e;
            transform: translateY(-3px);
        }

        .filter-box {
            text-align: center;
            margin-bottom: 30px;
        }

        .filter-box input,
        .filter-box select,
        .filter-box button {
            padding: 10px 15px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
            transition: all 0.2s ease;
        }

        .filter-box button {
            background-color: #6d4c41;
            color: white;
            font-weight: bold;
            border: none;
        }

        .filter-box button:hover {
            background-color: #4e342e;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto 30px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px 20px;
            text-align: left;
        }

        th {
            background-color: #6d4c41;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f8f5f2;
        }

        tr:hover {
            background-color: #f1ece9;
        }

        select, button {
            font-size: 0.95em;
        }

        form.inline-form {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .export-btn {
            display: block;
            width: fit-content;
            margin: 0 auto 30px auto;
            padding: 12px 25px;
            background-color: seagreen;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .export-btn:hover {
            background-color: darkgreen;
        }

        footer {
            margin-top: 40px;
            text-align: center;
            font-size: 0.9em;
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

<a class="export-btn" href="/admin/orders/export">📄 Xuất PDF thống kê</a>

<div class="filter-box">
    <form method="get" action="/admin/orders" style="display: inline;">
        <input type="text" name="keyword" placeholder="Tìm theo tên khách hàng" value="${keyword}" />
        <select name="status">
            <option value="">Tất cả trạng thái</option>
            <option value="Pending" ${status == 'pending' ? 'selected' : ''}>Đang chờ</option>
            <option value="Starting" ${status == 'staring' ? 'selected' : ''}>Bắt đầu</option>
            <option value="Finishing" ${status == 'finishing' ? 'selected' : ''}>Hoàn thành</option>
        </select>
        <button type="submit">Lọc</button>
    </form>
</div>

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
                <form class="inline-form" method="post" action="/admin/orders/updateStatus">
                    <input type="hidden" name="id" value="${order.id}" />
                    <select name="status">
                        <option value="Pending" ${order.status == 'pending' ? 'selected' : ''}>Đang chờ</option>
                        <option value="Starting" ${order.status == 'staring' ? 'selected' : ''}>Bắt đầu</option>
                        <option value="Finishing" ${order.status == 'finishing' ? 'selected' : ''}>Hoàn thành</option>
                    </select>
                    <button type="submit">✔</button>
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
