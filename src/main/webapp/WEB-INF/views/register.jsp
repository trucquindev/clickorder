<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - CafeChill</title>
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
        .register-box {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 420px;
        }
        .register-box h2 {
            text-align: center;
            color: #4e342e;
            margin-bottom: 30px;
        }
        .register-box input[type="text"],
        .register-box input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }
        .register-box input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #4e342e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        .register-box input[type="submit"]:hover {
            background: #6d4c41;
        }
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
        .login-link a {
            color: #4e342e;
            text-decoration: none;
        }
        .error {
            text-align: center;
            color: #e53935;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="register-box">
    <h2>Đăng ký tài khoản CafeChill</h2>
    <form action="/register" method="post">
        <input type="text" name="username" placeholder="Tên đăng nhập" required>
        <input type="password" name="password" placeholder="Mật khẩu" required>
        <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
        <input type="submit" value="Đăng ký">
    </form>
    <div class="error">${error}</div>
    <div class="login-link">
        Đã có tài khoản? <a href="/login">Đăng nhập</a>
    </div>
</div>
</body>
</html>
