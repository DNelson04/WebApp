package com.example.webapp;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/navigate")
public class HelloServlet extends HttpServlet {

    public void init() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MatrixCell[][] sessionMatrix = (MatrixCell[][]) session.getAttribute("matrix");

        if (sessionMatrix == null) {
            MarkovMatrix.initializeMatrix(getServletContext());
            sessionMatrix = MarkovMatrix.getMatrix();
        }

        int from = Integer.parseInt(request.getParameter("from"));
        int to = Integer.parseInt(request.getParameter("to"));

        MarkovMatrix.updateMatrix(sessionMatrix, from, to);
        session.setAttribute("matrix", sessionMatrix);

        // Redirect to the target page
        String targetPage = request.getParameter("page");
        response.sendRedirect(targetPage);
    }

    public void destroy() {
    }
}