<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thống kê CafeChill</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fff8f0;
            padding: 30px;
            margin: 0;
            color: #4e342e;
        }

        h1 {
            text-align: center;
            color: #4e342e;
            font-size: 2.5em;
            margin-top: 30px;
        }

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

        .summary {
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
            background: #fff3e0;
            padding: 20px;
            border-radius: 12px;
        }

        .summary div {
            text-align: center;
        }

        .chart-container {
            width: 80%;
            margin: 40px auto;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background: #6d4c41;
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

<h1>Trang Thống kê</h1>

<!-- Navbar -->
<div class="nav">
    <a href="/admin/drinks">Quản lý đồ uống</a>
    <a href="/admin/orders">Đơn hàng</a>
    <a href="/admin/users">Người dùng</a>
    <a href="/admin/stats">Thống kê</a>
</div>

<!-- Tóm tắt thông tin -->
<div class="summary">
    <div>
        <h3>Doanh thu tổng</h3>
        <p><strong>${totalRevenue} VND</strong></p>
    </div>
    <div>
        <h3>Số đơn hàng</h3>
        <p><strong>${totalOrders}</strong></p>
    </div>
    <div>
        <h3>Số người dùng</h3>
        <p><strong>${totalUsers}</strong></p>
    </div>
</div>

<!-- Biểu đồ doanh thu theo tháng -->
<div class="chart-container">
    <h3>Doanh thu theo tháng</h3>
    <canvas id="revenueChart"></canvas>
</div>

<!-- Biểu đồ trạng thái đơn hàng -->
<div class="chart-container">
    <h3>Trạng thái đơn hàng</h3>
    <canvas id="statusChart"></canvas>
</div>

<!-- Bảng top người dùng đặt hàng nhiều nhất -->
<div>
    <h3 style="text-align:center;">Top người dùng đặt hàng nhiều nhất</h3>
    <table>
        <tr>
            <th>Tên người dùng</th>
            <th>Số đơn</th>
            <th>Tổng tiền</th>
        </tr>
        <c:forEach var="entry" items="${topUsers}">
            <tr>
                <td>${entry._id}</td>
                <td>${entry.orderCount}</td>
                <td>${entry.totalSpent}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    // Biểu đồ doanh thu theo tháng
    const revenueChart = new Chart(document.getElementById('revenueChart'), {
        type: 'line',
        data: {
            labels: ${labels},
            datasets: [{
                label: 'Doanh thu (VND)',
                data: ${data},
                borderColor: '#4e342e',
                backgroundColor: '#d7ccc8',
                tension: 0.3
            }]
        }
    });

    // Biểu đồ trạng thái đơn hàng
    const statusChart = new Chart(document.getElementById('statusChart'), {
        type: 'bar',
        data: {
            labels: [
                <c:forEach var="entry" items="${statusCounts}">
                "${entry.key}"<c:if test="${!entryStatus.last}">,</c:if>
                </c:forEach>
            ],
            datasets: [{
                label: 'Số lượng đơn hàng',
                data: [
                    <c:forEach var="entry" items="${statusCounts}">
                    ${entry.value}<c:if test="${!entryStatus.last}">,</c:if>
                    </c:forEach>
                ],
                backgroundColor: ['#ff9800', '#2196f3', '#4caf50']
            }]
        }
    });
</script>

</body>
</html>
