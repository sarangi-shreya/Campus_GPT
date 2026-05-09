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
			String idParam = request.getParameter("id");
			
			if(idParam != null){
			
			    int id = Integer.parseInt(idParam);
			
			    try{
			
			        PreparedStatement ps = con.prepareStatement("DELETE FROM student WHERE id=?");
			        ps.setInt(1,id);
			
			        ps.executeUpdate();
			        ps.close();
			
			        response.sendRedirect("displayStudents.jsp");
			
			    } 
			    catch(Exception e){
			        e.printStackTrace();
			        out.println(e.getMessage());
			    }
			
			} 
			else {
			    out.println("Invalid request");
			}
		%>
	</body>
</html>