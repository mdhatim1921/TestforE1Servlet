<%@page import="java.util.List"%>
<%@page import="com.jsp.model.Book"%>
<%@page import="com.jsp.dao.Dao"%>
<%@page import="com.jsp.dao.implementation.DaoImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Genre</th>
            </tr>
        </thead>
        <tbody>
            <% Dao dao = new DaoImplementation();
            List<Book> books = dao.listOfBooks();
            for (Book book : books) {
            %>
                <tr>
                    <td><%= book.getBookId() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getQuantity() %></td>
                    <td><%= book.getPrice() %></td>
                    <td><%= book.getGenre() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
