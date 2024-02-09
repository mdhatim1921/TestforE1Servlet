package com.jsp.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.jsp.dao.Dao;
import com.jsp.dao.implementation.DaoImplementation;
import com.jsp.model.Recorddd;
import com.jsp.model.User;
import com.jsp.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/saveRecord")
public class SaveRecord extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Parse request parameters
        LocalDate borrowDate = LocalDate.parse(req.getParameter("borrowDate"));
        LocalDate returnDate = LocalDate.parse(req.getParameter("returnDate"));

        // Get user and book IDs from request parameters
        Long userId = Long.parseLong(req.getParameter("userId"));
        Long bookId = Long.parseLong(req.getParameter("bookId"));

        
        Recorddd recorddd=new Recorddd();
        recorddd.setBorrowDate(borrowDate);
        recorddd.setRetrunDate(returnDate);
        Dao dao = new DaoImplementation();
        User user = dao.findUserById(userId);
        Book book = dao.findBookById(bookId);
        recorddd.setBook(book);
        recorddd.setUser(user);
        dao.addRecord(recorddd);
        req.getRequestDispatcher("logIn.jsp").include(req, resp);
        
    }
}

       
