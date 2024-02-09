package com.jsp.controller;

import java.io.IOException;
import com.jsp.dao.Dao;
import com.jsp.dao.implementation.DaoImplementation;
import com.jsp.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateBook")
public class UpdateBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));
        String genre = req.getParameter("genre");

        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setQuantity(quantity);
        book.setPrice(price);
        book.setGenre(genre);

        Dao dao = new DaoImplementation();
        dao.updateBook(book);

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
