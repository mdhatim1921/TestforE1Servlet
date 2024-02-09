<%@page import="java.util.List"%>
<%@page import="com.jsp.model.Recorddd"%>
<%@page import="com.jsp.dao.Dao"%>
<%@page import="com.jsp.dao.implementation.DaoImplementation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>List of Records</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff; /* Set background color to black */
            color: #000; /* Set text color to white */
            margin: 0;
            padding: 40px;
            display: flex;
            flex-direction: column; /* Arrange elements in a column */
            align-items: center; /* Center horizontally */
        }

        h1 {
        
            text-align: center; /* Center text */
            margin-top: 20px; /* Add margin from top */
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin-top: 20px; /* Add margin from top */
        }

        input[type="number"] {
            width: 80%; /* Adjusted width */
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 20px; /* Rounded corners */
            resize: vertical;
            outline: none; /* Remove default outline */
        }

        input[type="submit"] {
            background-color: #000;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 20px; /* Rounded corners */
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px; /* Add margin from top */
        }

        .h, .d {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .h {
            background-color: #000;
            color: white;
            font-weight: bold;
        }

        .h a {
            color: white;
            text-decoration: none;
        }

        .h a:hover {
            color: white;
            text-decoration: underline;
        }

        h4 {
            color: red;
        }
 
    </style>
</head>
<body>
<div>
<h1>Library Record</h1>
    <form action="">
        Record Id <input type="number" name="recordId">
        <input type="submit" value="Find Record">
    </form>
</div>
<%
    Dao dao = new DaoImplementation();
    List<Recorddd> records = dao.listOfRecord();
    if (records != null && !records.isEmpty()) {
%>
    <table>
        <tr>
            <th class="h">Record ID</th>
            <th class="h">Title</th>
            <th class="h">Author</th>
            <th class="h">Genre</th>
            <th class="h">Price</th>
            <th class="h">Borrow Date</th>
            <th class="h">Return Date</th>
            <th class="h">Borrower Name</th>
            <th class="h">Edit</th>
            <th class="h">Delete</th>
        </tr>
<%
        for (Recorddd record : records) {
%>
            <tr>
                <td class="d"><%= record.getRecordId() %></td>
                <td class="d"><%= record.getBook().getTitle() %></td>
                <td class="d"><%= record.getBook().getAuthor() %></td>
                <td class="d"><%= record.getBook().getGenre() %></td>
                <td class="d"><%= record.getBook().getPrice() %></td>
                <td class="d"><%= record.getBorrowDate() %></td>
                <td class="d"><%= record.getRetrunDate() %></td>
                <td class="d"><%= record.getUser().getName() %></td>
                <td class="d"><a href="">Edit</a></td>
                <td class="d"><a href="">Delete</a></td>
            </tr>
<%
        }
%>
    </table>
<%
    } else {
%>
    <h4>No records found.</h4>
<%
    }
    
    String recordIdParam = request.getParameter("recordId");
    if (recordIdParam != null && !recordIdParam.isEmpty()) {
        try {
            Long recordId = Long.parseLong(recordIdParam);
            Recorddd record = dao.findRecordById(recordId);
            if (record != null) {
%>
                <table>
                    <tr>
                        <th class="h">Record ID</th>
                        <th class="h">Title</th>
                        <th class="h">Author</th>
                        <th class="h">Genre</th>
                        <th class="h">Price</th>
                        <th class="h">Borrow Date</th>
                        <th class="h">Return Date</th>
                        <th class="h">Borrower Name</th>
                        <th class="h">Edit</th>
                        <th class="h">Delete</th>
                    </tr>
                    <tr>
                        <td class="d"><%= record.getRecordId() %></td>
                        <td class="d"><%= record.getBook().getTitle() %></td>
                        <td class="d"><%= record.getBook().getAuthor() %></td>
                        <td class="d"><%= record.getBook().getGenre() %></td>
                        <td class="d"><%= record.getBook().getPrice() %></td>
                        <td class="d"><%= record.getBorrowDate() %></td>
                        <td class="d"><%= record.getRetrunDate() %></td>
                        <td class="d"><%= record.getUser().getName() %></td>
                        <td class="d"><a href="">Edit</a></td>
                        <td class="d"><a href="">Delete</a></td>
                    </tr>
                </table>
<%
            } else {
%>
                <h4>No record found for the provided ID.</h4>
<%
            }
        } catch (NumberFormatException e) {
%>
            <h4>Invalid record ID. Please enter a valid numeric ID.</h4>
<%
        }
    }
%>
</body>
</html>
