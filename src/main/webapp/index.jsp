
<%@ page import="com.example.webapp.*" %>
<!DOCTYPE html>
<html>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 60px;
        background-color: #333;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
        color: white;
    }

    .navbar h1 {
        margin: 0;
        font-size: 24px;
    }

    .navbar nav ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .navbar nav ul li {
        margin: 0 10px;
    }

    .navbar nav ul li a {
        color: white;
        text-decoration: none;
        font-size: 18px;
    }

    .navbar nav ul li a:hover {
        text-decoration: underline;
    }

    main {
        margin-top: 80px;
        padding: 20px;
    }

    .hero {
        text-align: center;
        padding: 50px;
        background: #f4f4f4;
        margin-bottom: 20px;
    }

    .hero h2 {
        font-size: 32px;
        margin-bottom: 20px;
    }

    .hero p {
        font-size: 18px;
        margin-bottom: 20px;
    }

    .hero a {
        display: inline-block;
        padding: 10px 20px;
        background: #333;
        color: white;
        text-decoration: none;
        font-size: 18px;
    }

    .hero a:hover {
        background: #555;
    }

    .featured-products {
        text-align: center;
        padding: 20px;
    }

    .featured-products h3 {
        font-size: 28px;
        margin-bottom: 20px;
    }

    .product {
        display: inline-block;
        width: 30%;
        margin: 10px;
        padding: 20px;
        background: #f4f4f4;
        text-align: left;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .product img {
        width: 100%;
        height: auto;
    }

    .product h4 {
        font-size: 22px;
        margin-bottom: 10px;
    }

    .product p {
        font-size: 16px;
        margin-bottom: 10px;
    }

    .product .btn {
        display: inline-block;
        padding: 10px 20px;
        background: #333;
        color: white;
        text-decoration: none;
        font-size: 16px;
    }

    .product .btn:hover {
        background: #555;
    }

    footer {
        text-align: center;
        padding: 12px;
        background: #333;
        color: white;
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 25px;
    }
</style>
<%!
    MatrixCell[][] sessionMatrix;
    int from = 0;

%>
<%
    MatrixCell[][] matrix = (MatrixCell[][]) session.getAttribute("matrix");
    if (matrix == null) {
        MarkovMatrix.initializeMatrix(pageContext.getServletContext());
        sessionMatrix = MarkovMatrix.getNewMatrix();
    }
    if(matrix != null) {
        sessionMatrix = matrix.clone();
    }
    session.setAttribute("matrix", sessionMatrix);
%>
<body>
<head>
    <title>3DWorld</title>
</head>
<header class="navbar">
    <h1>3DWorld</h1>
    <nav style="margin-top: 20px;">
        <ul>
            <li><a href="navigate?from=<%=from%>&to=0&page=index.jsp">Home</a></li>
            <li><a href="navigate?from=<%=from%>&to=1&page=store.jsp">Products</a></li>
            <li><a href="navigate?from=<%=from%>&to=2&page=about.jsp">About Us</a></li>
            <li><a href="navigate?from=<%=from%>&to=3&page=careers.jsp">Careers</a></li>
        </ul>
    </nav>
</header>

<main>
    <section class="hero">
        <h2>Welcome to 3DWorld
        </h2>
        <p>Discover our wide range of 3D printed products and find what you need.</p>
        <a href="navigate?from=<%=from%>&to=1&page=store.jsp">Shop Now</a>
    </section>

    <section class="featured-products">
        <h3>Featured Products</h3>
        <div class="product">
            <img src="static/product1.jpg" alt="The Rocktopus">
            <h4>The Rocktopus</h4>
            <p>Can you smell what The Rocktopus is cooking?</p>
            <a href="navigate?from=<%=from%>&to=1&page=#" class="btn">View Details</a>
        </div>
        <div class="product">
            <img src="static/product2.jpg" alt="Millennium Falcon">
            <h4>Millennium Falcon</h4>
            <p>Millennium Falcon replica</p>
            <a href="navigate?from=<%=from%>&to=1&page=#" class="btn">View Details</a>
        </div>
        <div class="product">
            <img src="static/product3.jpg" alt="Coin Holder">
            <h4>Coin Holder</h4>
            <p>Customizable to hold different denominations and amounts of coins.</p>
            <a href="navigate?from=<%=from%>&to=1&page=#" class="btn">View Details</a>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2024 3DWorld. All rights reserved.</p>
</footer>
</body>
</html>