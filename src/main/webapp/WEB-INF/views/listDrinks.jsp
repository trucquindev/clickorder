<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Café Online</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fceabb, #f8b500);
            color: #333;
        }
        .navbar h1 {
            margin: 0;
            font-size: 28px;
            color: #ff5722;
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
        .hero {
            text-align: center;
            padding: 80px 20px;
        }
        .hero h2 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #fff;
            text-shadow: 1px 1px 2px #333;
        }
        .hero p {
            font-size: 18px;
            color: #fff;
        }
        .menu-section {
            padding: 40px 60px;
            background-color: #fff;
            border-radius: 20px 20px 0 0;
        }
        .menu-title {
            text-align: center;
            font-size: 32px;
            margin-bottom: 30px;
            color: #333;
        }
        .drink-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        .drink-card {
            background-color: #fefefe;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        .drink-card:hover {
            transform: translateY(-5px);
        }
        .drink-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .drink-card .content {
            padding: 15px;
        }
        .drink-card h3 {
            margin: 0;
            font-size: 20px;
            color: #ff5722;
        }
        .drink-card p {
            font-size: 14px;
            color: #666;
            margin: 10px 0;
        }
        .drink-card .price {
            font-weight: bold;
            color: #222;
            margin-bottom: 10px;
        }
        .drink-card a {
            display: inline-block;
            padding: 10px 15px;
            background-color: #ff5722;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s;
        }
        .drink-card a:hover {
            background-color: #e64a19;
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

<div class="menu-section">
    <h3 class="menu-title">Thực Đơn Hôm Nay</h3>
    <div class="drink-grid">
        <c:forEach var="drink" items="${listDrinks}">
            <div class="drink-card">
                <img src="${"https://media.istockphoto.com/id/1467199060/vi/anh/t%C3%A1ch-c%C3%A0-ph%C3%AA-v%E1%BB%9Bi-kh%C3%B3i-v%C3%A0-h%E1%BA%A1t-c%C3%A0-ph%C3%AA-tr%C3%AAn-n%E1%BB%81n-g%E1%BB%97-c%C5%A9.jpg?s=612x612&w=0&k=20&c=pFd95WDAVp_CMpYNpTtc6AUKk-39qcJE5NnAVqo2Eb0=" }" alt="Ảnh đồ uống" class="drink-img"/>
<%--                <img src="${drink.imageUrl}" alt="${drink.name}" />--%>
                <div class="content">
                    <h3>${drink.name}</h3>
                    <p>${drink.description}</p>
                    <p class="price">${drink.price}₫</p>
                    <a href="/order/${drink.id}">Đặt ngay</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
