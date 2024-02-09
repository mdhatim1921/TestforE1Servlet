<%@page import="com.jsp.model.Recorddd"%>
<%@page import="com.jsp.model.Book"%>
<%@page import="com.jsp.dao.implementation.DaoImplementation"%>
<%@page import="com.jsp.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Find Book by ID</title>
    
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
            width: 100%;
        }

        .h {
            background-color: #000;
            color: white;
        }

        .h, .d {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .h {
            font-weight: bold;
        }

        

        h4 {
            color: red;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: blue;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div>
    <form action="">
        Book ID: <input type="number" name="bookId">
        <input type="submit" value="Submit">
    </form>
    </div>
    
    <%
        String bookIdParam = request.getParameter("bookId");
        if (bookIdParam != null && !bookIdParam.isEmpty()) {
            try {
                Long bookId = Long.parseLong(bookIdParam);
                Dao dao=new DaoImplementation();
                Book book= dao.findBookById(bookId);
				Recorddd recorddd=new Recorddd();
                if (book != null) {
    %>
                    <table>
                      <tr>
				<th class="h">id</th>
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
				<th ><%=book.getBookId()%></th>
				<th><%=book.getTitle()%></th>
				<th><%=book.getAuthor()%></th>
				<th><%=book.getGenre() %></th>
				<th><%=book.getPrice()%></th>
				
				<th><%=recorddd.getBorrowDate() %></th>
				<th><%=recorddd.getRecordId() %></th>
				<th><a href="">edit</a></th>
				<th><a href="">Delete</a></th>

			</tr>
                      
                    </table>
    <%
                } else {
    %>
                    <h4>No book found for the provided ID.</h4>
    <%
                }
            } catch (NumberFormatException e) {
    %>
                <h4>Invalid book ID. Please enter a valid numeric ID.</h4>
    <%
            }
        }
    %>
</body>
</html>
