<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ - CafeChill</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #fffdf7;
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
        .contact-container {
            max-width: 700px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .contact-container h2 {
            text-align: center;
            color: #4e342e;
            margin-bottom: 30px;
        }

        .contact-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .contact-form input:focus, .contact-form textarea:focus {
            border-color: #4e342e;
            outline: none;
        }

        .contact-form button {
            background-color: #4e342e;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #6d4c41;
        }

        .footer {
            background: #4e342e;
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: 50px;
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

<div class="contact-container">
    <h2>Liên hệ với chúng tôi</h2>
    <form class="contact-form" action="/submitContact" method="post">
        <label for="name">Họ và tên:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Nội dung:</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <button type="submit">Gửi liên hệ</button>
    </form>
</div>

<div class="footer">
    <p>&copy; 2025 CafeChill. All rights reserved.</p>
</div>

</body>
</html>
