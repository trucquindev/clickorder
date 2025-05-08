<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chỉnh sửa đơn hàng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 40px;
            background-color: #f9f9f9;
            color: #333;
        }
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        h2 {
            color: #2c3e50;
        }

        form {
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #2ecc71;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
        }

        a.back-link {
            display: inline-block;
            margin-top: 20px;
            color: #2980b9;
            text-decoration: none;
        }

        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Chỉnh sửa đơn hàng</h2>

    <form action="/orders/edit" method="post">
        <input type="hidden" name="id" value="${order.id}" />

        <label>Tên khách hàng</label>
        <input type="text" name="customerName" value="${order.customerName}" required />

        <label>Địa chỉ</label>
        <input type="text" name="address" value="${order.address}" required />

        <label>Thức uống</label>
        <select name="drink.id">
            <c:forEach var="d" items="${drinks}">
                <option value="${d.id}" <c:if test="${d.id == order.drink.id}">selected</c:if>>
                        ${d.name}
                </option>
            </c:forEach>
        </select>

        <label>Số lượng</label>
        <input type="number" name="quantity" value="${order.quantity}" min="1" required />

        <input type="submit" value="Cập nhật đơn hàng" />
    </form>
</div>

<a class="back-link" href="/orders">← Quay lại danh sách</a>
</body>
</html>
