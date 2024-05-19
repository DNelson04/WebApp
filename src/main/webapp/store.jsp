<%@ page import="com.example.webapp.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    h2 {
        font-size: 28px;
        margin-bottom: 15px;
    }

    form {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background: #f4f4f4;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    form div {
        margin-bottom: 15px;
    }

    form label {
        display: block;
        margin-bottom: 5px;
        font-size: 18px;
    }

    form input[type="text"],
    form input[type="email"],
    form input[type="number"],
    form select {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    form button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 10px;
        cursor: pointer;
        border-radius: 4px;
    }

    form button:hover {
        background-color: #45a049;
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
    int from = 1;

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
<body>
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
    <section>
        <h2>Order Now!</h2>
        <form>
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div>
                <label for="product">Product:</label>
                <select id="product" name="product" required>
                    <option value="">Select a product</option>
                    <option value="product1">The Rocktopus</option>
                    <option value="product2">Millennium Falcon</option>
                    <option value="product3">Coin Holder</option>
                </select>
            </div>
            <div>
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" min="1" required>
            </div>
            <button type="submit">Place Order</button>
        </form>
    </section>
</main>

<footer>
    <p>&copy; 2024 3DWorld. All rights reserved.</p>
</footer>
</body>
</html>