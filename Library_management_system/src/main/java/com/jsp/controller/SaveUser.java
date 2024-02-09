package com.jsp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;

import com.jsp.dao.Dao;
import com.jsp.dao.implementation.DaoImplementation;
import com.jsp.model.Recorddd;
import com.jsp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/saveUserr")
public class SaveUser extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		LocalDate dob = LocalDate.parse(req.getParameter("dob"));
		String password=req.getParameter("password");
		
		User user=new User();
		user.setName(name);
		user.setEmail(email);
		user.setDob(dob);
		user.setPassword(password);
		
		
		Dao dao=new DaoImplementation();
		dao.addUser(user);

		req.getRequestDispatcher("logIn.jsp").include(req, resp);
	}
}
