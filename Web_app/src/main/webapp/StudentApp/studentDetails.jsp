<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student App</title>
	</head>
	<body>
		<%@ include file="navbar.jsp" %>
		<%@ include file="DBConnection.jsp" %>
		
		<%
			int id = Integer.parseInt(request.getParameter("id"));
			
			try{
			
			    PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE id=?");
			    ps.setInt(1,id);
			
			    ResultSet rs = ps.executeQuery();
			
			    if(rs.next()){
		%>
		
		<h2>Student Details</h2>
		
		ID: <%= rs.getInt("id") %><br>
		Name: <%= rs.getString("name") %><br>
		Email: <%= rs.getString("email") %><br>
		Course: <%= rs.getString("course") %><br>
		Age: <%= rs.getInt("age") %><br>
		CGPA: <%= rs.getFloat("cgpa") %><br>
	
		<%
			    }
			
			    rs.close();
			    ps.close();
			
			}
			catch(Exception e){
			    e.printStackTrace();
			    out.println(e.getMessage());
			}
		%>
	</body>
</html>