<%@ page import="com.example.webapp.*"%>
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

    section {
        margin-bottom: 40px;
    }

    h2 {
        font-size: 28px;
        margin-bottom: 15px;
    }

    p {
        font-size: 18px;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    ul {
        list-style-type: none;
        padding-left: 0;
    }

    ul li {
        font-size: 18px;
        margin-bottom: 10px;
    }

    footer {
        text-align: center;
        padding: 20px;
        background: #333;
        color: white;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<%!
    MatrixCell[][] sessionMatrix;
    int from = 2;

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
%>
<header class="navbar">
    <h1>My Store</h1>
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
    <section>
        <h2>Our Story</h2>
        <p>Our journey began with a shared passion for innovation and a vision to revolutionize the world of manufacturing.
            At 3DWorld, we believe that creativity knows no bounds, and neither should the tools we use to bring ideas to life.
            Founded this year, our mission has been to make 3D printing accessible and transformative for businesses, hobbyists, and creators
            alike. We are committed to providing cutting-edge technology, exceptional service, and a platform for our customers
            to turn their wildest ideas into reality. Join us as we continue to push the boundaries of what's possible, one layer at a time.</p>
    </section>

    <section>
        <h2>Our Mission</h2>
        <p> Our mission is to democratize innovation by providing state-of-the-art 3D printing solutions that empower
            individuals and businesses to bring their ideas to life. We are dedicated to advancing the boundaries of manufacturing, fostering
            creativity, and delivering high-quality, accessible technology. Our commitment to excellence, sustainability, and customer satisfaction
            drives us to continuously innovate and improve, making the extraordinary achievable for everyone.</p>
    </section>

    <section>
        <h2>Our Team</h2>
        <ul>
            <li>Daniel Nelson's Alter Ego - CEO</li>
            <li>Daniel Nelson - CTO</li>
            <li>Daniel Nelson if he had an accounting degree - CFO</li>
        </ul>
    </section>
</main>

<footer>
    <p>&copy; 2024 3DWorld. All rights reserved.</p>
</footer>
</body>
</html>