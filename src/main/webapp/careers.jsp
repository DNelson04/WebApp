<%@ page import="com.example.webapp.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
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

    h1 {
        font-size: 36px;
        margin-bottom: 20px;
        margin-left: 10px;
    }

    h2 {
        font-size: 28px;
        margin-bottom: 15px;
        margin-left: 10px;
    }

    ul {
        list-style-type: disc;
        padding-left: 40px;
        margin-bottom: 20px;
    }

    ul li {
        font-size: 18px;
        margin-bottom: 10px;
    }

    p {
        font-size: 18px;
        margin-bottom: 20px;
        margin-left: 10px;
    }

    a {
        color: #333;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
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
<html>
<%!
    MatrixCell[][] sessionMatrix;
    int from = 3;
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
<head>
    <title>Careers</title>
</head>
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
<body>
<h1>Join Our Team</h1>

<h2>Current Job Openings</h2>
<ul>
    <li>3D Printer</li>
    <li>Technician</li>
    <li>Coffee Runner</li>
</ul>

<h2>Why Work With Us?</h2>
<p>I think we're pretty cool personally.</p>

<h2>How to Apply</h2>
<p>If you are interested in applying, that's very cool!</p>

<h2>Contact Us</h2>
<p>If you have any questions, feel free to contact me at <a href="mailto:danielnelson2070@gmail.com">danielnelson2070@gmail.com</a>.</p>
<footer>
    <p>&copy; 2024 3DWorld. All rights reserved.</p>
</footer>
</body>
</html>