<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Database Connection</title>
	</head>
	<body>
		<%@ page import="java.sql.*" %>
		
		<%
			String url = "jdbc:postgresql://localhost:5432/college_db";
			String user = "postgres";
			String pass = "24becc16";
			
			Connection con = null;
			
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection(url, user, pass);
			}
			catch (Exception e) {
				out.println(e);
			}
		%>
	</body>
</html>