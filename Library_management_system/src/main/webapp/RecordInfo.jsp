<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Save Record</title>
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

        h1 {
            color: blue;
            text-align: center;
        }

        form {
            width: 300px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: black;
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
    <h1>Save Record</h1>
    <form action="saveRecord" method="post">
        <label for="borrowDate">Borrow Date:</label>
        <input type="date" id="borrowDate" name="borrowDate" required><br>
        
        <label for="returnDate">Return Date:</label>
        <input type="date" id="returnDate" name="returnDate" required><br>
        
        <label for="userId">User ID:</label>
        <input type="number" id="userId" name="userId" required><br>
        
        <label for="bookId">Book ID:</label>
        <input type="number" id="bookId" name="bookId" required><br>
        
        <input type="submit" value="Save Record">
    </form>
    </div>
</body>
</html>
