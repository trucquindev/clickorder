<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Admin Dashboard - CafeChill</title>
    <style>
        /* Tổng thể */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fffaf5;
            margin: 0;
            padding: 40px;
            color: #4e342e;
        }

        h1 {
            color: #4e342e;
            text-align: center;
            margin-bottom: 50px;
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
        .container{
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        /* Cards Section */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            justify-items: center;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 300px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            margin: 20px 0;
            font-size: 1.2em;
            color: #4e342e;
        }

        .card p {
            color: #6d4c41;
            font-size: 1.1em;
        }

        .card .stat {
            font-size: 2em;
            font-weight: bold;
            color: #6d4c41;
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
<h1>Quản trị hệ thống CafeChill</h1>
<div class="nav">
    <a href="/admin/drinks">Quản lý đồ uống</a>
    <a href="/admin/orders">Đơn hàng</a>
    <a href="/admin/users">Người dùng</a>
    <a href="/admin/stats">Thống kê</a>
</div>

<!-- Cards Section -->
<div class="container">
    <div class="cards">
        <div class="card">
            <h3>Số đơn hàng hôm nay</h3>
            <p class="stat">120</p>
        </div>
        <div class="card">
            <h3>Số lượng khách hàng</h3>
            <p class="stat">450</p>
        </div>
        <div class="card">
            <h3>Tổng doanh thu</h3>
            <p class="stat">12,000,000 VND</p>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 CafeChill. Tất cả quyền được bảo vệ.</p>
</footer>
</body>
</html>
