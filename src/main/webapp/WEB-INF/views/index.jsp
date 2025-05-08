<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>CafeChill - Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #fff8f0;
        }
        .swiper {
            width: 100%;
            height:77vh;
        }
        .swiper-slide {
            position: relative;
            background-size: cover;
            background-position: center;
        }
        .overlay {
            position: absolute;
            top: 50%;
            left: 10%;
            transform: translateY(-50%);
            color: white;
            text-shadow: 2px 2px 8px #000;
        }
        .overlay h1 {
            font-size: 3em;
            margin: 0;
        }
        .overlay p {
            font-size: 1.3em;
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
        .section {
            padding: 50px 20px;
            text-align: center;
        }
        .hero{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .menu-items {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
        }
        .item {
            background: white;
            width: 250px;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .item img {
            width: 100%;
            border-radius: 10px;
        }
        .item h3 {
            margin: 10px 0 5px;
        }
        .footer {
            background: #4e342e;
            color: white;
            padding: 20px;
            text-align: center;
        }
        /* Swiper pagination + navigation */
        .swiper-pagination-bullets {
            bottom: 20px !important;
        }
        .swiper-button-next,
        .swiper-button-prev {
            color: white;
        }
        #typewriter {
            font-size: 2em;
            color: black;
            padding: 20px;
            border-radius: 12px;
            display: inline-block;
        }
        .cursor {
            display: inline-block;
            width: 1px;
            background-color: white;
            margin-left: 3px;
            animation: blink 0.8s infinite;
        }
        @keyframes blink {
            0%, 50%, 100% { opacity: 1; }
            25%, 75% { opacity: 0; }
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
<div class="hero">
    <h1 id="typewriter"></h1>
</div>

<div class="swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-02.png')">
<%--            <div class="overlay">--%>
<%--                <h1>OLONG KHÓI</h1>--%>
<%--                <p>Bản làng – vị khói độc đáo</p>--%>
<%--            </div>--%>
        </div>
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-01.png')">
        </div>
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-03.png')">
        </div>
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-04.png')">
        </div>
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-05.png')">
        </div>
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-06.png')">
        </div>
        <div class="swiper-slide" style="background-image: url('https://www.tuctactea.com.vn/wp-content/uploads/2025/04/slider-05.png')">
        </div>
    </div>

    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>

    <!-- Add Navigation -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
</div>

<div class="section">
    <h2>Đồ uống nổi bật</h2>
    <div class="menu-items">
        <div class="item">
            <img src="https://www.bartender.edu.vn/wp-content/uploads/2015/11/tra-sua-truyen-thong.jpg" alt="Trà sữa truyền thống">
            <h3>Trà sữa truyền thống</h3>
            <p>Vị ngọt dịu, thơm ngon, topping phong phú</p>
        </div>
        <div class="item">
            <img src="https://chefjob.vn/wp-content/uploads/2017/12/thuc-uong-epresso-la-gi.jpg" alt="Espresso đậm đà">
            <h3>Espresso đậm đà</h3>
            <p>Đậm vị cà phê Ý nguyên chất</p>
        </div>
        <div class="item">
            <img src="https://www.lorca.vn/wp-content/uploads/2025/04/1-26.jpg" alt="Matcha Latte mát lạnh">
            <h3>Matcha Latte</h3>
            <p>Vị thanh mát từ bột trà xanh Nhật Bản</p>
        </div>
    </div>
</div>

<div class="section" style="background: #fff3e0;">
    <h2>Ưu đãi đặc biệt</h2>
    <p>Giảm 20% cho đơn hàng đầu tiên! Đặt hàng ngay để không bỏ lỡ!</p>
</div>

<div class="footer">
    <p>&copy; 2025 CafeChill. All rights reserved.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<script>
    const text = "Thưởng thức phút giây thư giãn tại CafeChill";
    const typewriter = document.getElementById("typewriter");
    let i = 0;
    let isDeleting = false;

    function typeLoop() {
        if (!isDeleting) {
            typewriter.innerHTML = text.substring(0, i) + '<span class="cursor">|</span>';
            i++;
            if (i <= text.length) {
                setTimeout(typeLoop, 100);
            } else {
                isDeleting = true;
                setTimeout(typeLoop, 1500); // thời gian giữ nguyên trước khi xóa
            }
        } else {
            typewriter.innerHTML = text.substring(0, i) + '<span class="cursor">|</span>';
            i--;
            if (i >= 0) {
                setTimeout(typeLoop, 60);
            } else {
                isDeleting = false;
                setTimeout(typeLoop, 1000); // nghỉ một chút rồi gõ lại
            }
        }
    }

    window.onload = typeLoop;

    const swiper = new Swiper('.swiper', {
        loop: true,
        speed: 800,
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>
</body>
</html>
