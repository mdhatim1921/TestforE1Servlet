<%@page import="com.jsp.dao.implementation.DaoImplementation"%>
<%@page import="com.jsp.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Book By ID</title>
</head>
<body>

<div>
    <form action="deleteBook.jsp" method="get"> <!-- Specify the action and method -->
        Book ID: <input type="number" name="bookId">
        <input type="submit" value="Submit">
    </form>
</div>
    
<%
    String bookIdParam = request.getParameter("bookId");

    if (bookIdParam != null && !bookIdParam.isEmpty()) {
        try {
            long bookId = Long.parseLong(bookIdParam);
            
            Dao dao = new DaoImplementation();
            dao.deleteBook(bookId);
        } catch (NumberFormatException e) {
            out.println("<p>Invalid book ID. Please enter a valid numeric ID.</p>");
        } catch (Exception e) {
            out.println("<p>An error occurred while deleting the book: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>No book ID provided.</p>");
    }
%>
   
</body>
</html>
