<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	div{
		display:flex;
		justify-content:center;
		align-items:center;
		gap:12px;
	}
	section{
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
		background-color:gray;
		color:white;
		padding:5em;
	}
	button{
		background-color:green;
		color:black;
		padding:1em;
		font-weight:900; 
		border-radius:5px;
	}
	a{
		text-decoration:none;
		color:white;
	}
</style>

</head>
<body>
	<section>
			<h1>Library Management System</h1>
			<div>
				<button><a href="BookInfo.jsp">Add</a></button>
				<button><a href="AllLibraryRecord.jsp">Update Book</a></button>
				<button><a href="AllLibraryRecord.jsp">Delete Book</a></button>
				<button><a href="FindBookById.jsp">Find Book By Id</a></button>
				<button><a href="FindAll.jsp">List Of Books</a></button>
				<button><a href="AllLibraryRecord.jsp">Library Record</a></button>
				<button><a href="Logout.jsp">Other</a></button>

			</div>
	</section>
</body>
</html>