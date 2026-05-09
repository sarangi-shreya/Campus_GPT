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
			        if(request.getMethod().equalsIgnoreCase("POST")){
			            String name = request.getParameter("name");
			            String email = request.getParameter("email");
			            String course = request.getParameter("course");
			            int age = Integer.parseInt(request.getParameter("age"));
			            float cgpa = Float.parseFloat(request.getParameter("cgpa"));
			
			            PreparedStatement psUpdate = con.prepareStatement(
			                "UPDATE student SET name=?,email=?,course=?,age=?,cgpa=? WHERE id=?");
			
			            psUpdate.setString(1,name);
			            psUpdate.setString(2,email);
			            psUpdate.setString(3,course);
			            psUpdate.setInt(4,age);
			            psUpdate.setFloat(5,cgpa);
			            psUpdate.setInt(6,id);
			
			            psUpdate.executeUpdate();
			            psUpdate.close();
			
			            response.sendRedirect("displayStudents.jsp");
			        }
			
			        PreparedStatement psSelect = con.prepareStatement("SELECT * FROM student WHERE id=?");
			        psSelect.setInt(1,id);
			
			        ResultSet rs = psSelect.executeQuery();
			
			        if(rs.next()){
		%>
		
		<h2>Update Student</h2>
		
		<form method="post">
		    Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br><br>
		    Email: <input type="text" name="email" value="<%= rs.getString("email") %>"><br><br>
		    Course: <input type="text" name="course" value="<%= rs.getString("course") %>"><br><br>
		    Age: <input type="number" name="age" value="<%= rs.getInt("age") %>"><br><br>
		    CGPA: <input type="text" name="cgpa" value="<%= rs.getFloat("cgpa") %>"><br><br>
		
		    <input type="submit" value="Update">
		</form>
		
		<%
			        } 
			        else {
			            out.println("Student not found");
			        }
			
			        rs.close();
			        psSelect.close();
			
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