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
		background-color:blue;
		color:black;
		padding:1em;
		font-weight:900; /* Fix typo here */
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
				<button><a href="logIn.jsp">Logout</a></button>
				<button><a href="logIn.jsp">Old User</a></button>
				<button><a href="UserInfo.jsp">New User</a></button>
				<button><a href="BookInfo.jsp">Add Book </a></button>
				<button><a href="RecordInfo.jsp">Add Record</a></button>
			</div>
	</section>
</body>
</html>