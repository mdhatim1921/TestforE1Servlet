<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="com.jsp.model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
</head>
<body>


<%HttpSession session2=request.getSession();
Book b=(Book)session2.getAttribute("login");
%>

<form action="updateBook" method="post">
    <label for="bookId">Book ID:</label>
    <input type="text" id="bookId" name="bookId" value="<%= b.getBookId() %>" readonly><br><br>

    <label for="title">Title:</label>
    <input type="text" id="title" name="title" placeholder="Enter new title" value="<%= b.getTitle() %>"><br><br>

    <label for="author">Author:</label>
    <input type="text" id="author" name="author" placeholder="Enter new author" value="<%= b.getAuthor() %>"><br><br>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" placeholder="Enter new quantity" value="<%= b.getQuantity() %>"><br><br>

    <label for="price">Price:</label>
    <input type="text" id="price" name="price" placeholder="Enter new price" value="<%= b.getPrice() %>"><br><br>

    <label for="genre">Genre:</label>
    <input type="text" id="genre" name="genre" placeholder="Enter new genre" value="<%= b.getGenre() %>"><br><br>

    <input type="submit" value="Update Book">
</form>

</body>
</html>