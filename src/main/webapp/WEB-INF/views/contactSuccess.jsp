<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ thành công - CafeChill</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #fffaf0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        .navbar {
            background-color: #4e342e;
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
        .success-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .message-box {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .message-box h2 {
            color: #4e342e;
            margin-bottom: 20px;
        }

        .message-box p {
            font-size: 16px;
            color: #555;
        }

        .footer {
            background: #4e342e;
            color: white;
            padding: 20px;
            text-align: center;
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

<div class="success-container">
    <div class="message-box">
        <h2>🎉 Cảm ơn bạn đã liên hệ!</h2>
        <p>Chúng tôi đã nhận được tin nhắn và sẽ phản hồi sớm nhất có thể.</p>
    </div>
</div>

<div class="footer">
    <p>&copy; 2025 CafeChill. All rights reserved.</p>
</div>

</body>
</html>
