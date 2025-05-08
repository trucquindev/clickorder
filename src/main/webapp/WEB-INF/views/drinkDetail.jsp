<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chi tiết đồ uống</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
            text-align: center;
        }
        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
        }
        h2 {
            margin: 20px 0 10px;
        }
        .price {
            color: #e91e63;
            font-size: 22px;
            margin: 10px 0;
        }
        .btn {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 8px;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
<div class="card">
    <img src="${"https://media.istockphoto.com/id/1467199060/vi/anh/t%C3%A1ch-c%C3%A0-ph%C3%AA-v%E1%BB%9Bi-kh%C3%B3i-v%C3%A0-h%E1%BA%A1t-c%C3%A0-ph%C3%AA-tr%C3%AAn-n%E1%BB%81n-g%E1%BB%97-c%C5%A9.jpg?s=612x612&w=0&k=20&c=pFd95WDAVp_CMpYNpTtc6AUKk-39qcJE5NnAVqo2Eb0=" }" alt="Ảnh đồ uống" class="drink-img"/>
    <h2>${drink.name}</h2>
    <p>${drink.description}</p>
    <div class="price">${drink.price}₫</div>
    <a class="btn" href="/order/${drink.id}">Đặt món</a>
</div>
</body>
</html>
