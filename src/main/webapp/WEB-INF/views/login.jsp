
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - CafeChill</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #fff8f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-box h2 {
            text-align: center;
            color: #4e342e;
            margin-bottom: 30px;
        }
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }
        .login-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #4e342e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        .login-box input[type="submit"]:hover {
            background: #6d4c41;
        }
        .register-link, .error {
            text-align: center;
            margin-top: 15px;
        }
        .register-link a {
            color: #4e342e;
            text-decoration: none;
        }
        .error {
            color: #e53935;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Đăng nhập CafeChill</h2>
    <form action="/login" method="post">
        <input type="text" name="username" placeholder="Tên đăng nhập" required>
        <input type="password" name="password" placeholder="Mật khẩu" required>
        <input type="submit" value="Đăng nhập">
    </form>
    <div class="error">${error}</div>
    <div class="register-link">
        Chưa có tài khoản? <a href="/register">Đăng ký ngay</a>
    </div>
</div>
</body>
</html>
