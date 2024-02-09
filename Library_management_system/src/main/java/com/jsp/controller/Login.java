package com.jsp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.jsp.dao.Dao;
import com.jsp.dao.implementation.DaoImplementation;
import com.jsp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("username");
        String password = req.getParameter("password");

        Dao userDao = new DaoImplementation();
        User user = userDao.login(email, password);

        if (user != null) {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("login", user);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {
            PrintWriter printWriter = resp.getWriter();
            printWriter.write("<html><body>");
            printWriter.write("<p>Invalid email or password</p>");
            printWriter.write("</body></html>");

            req.getRequestDispatcher("logIn.jsp").include(req, resp);
        }
    }
}
