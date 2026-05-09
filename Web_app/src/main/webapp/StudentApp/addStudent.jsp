<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student App</title>
</head>
<body>

    <%@ include file="DBConnection.jsp" %>
    <%@ include file="navbar.jsp" %>

    <h2 style="color:green; text-align:center">ADD STUDENT</h2>

    <form method="post">
        Name: <input type="text" name="name" required><br><br>
        Email: <input type="email" name="email" required><br><br>

        Course:
        <input type="radio" name="course" value="CSE" required>CSE
        <input type="radio" name="course" value="ECE">ECE
        <input type="radio" name="course" value="EEE">EEE
        <input type="radio" name="course" value="EIE">EIE
        <input type="radio" name="course" value="Mech">MechE<br><br>

        Age: <input type="number" name="age" required><br><br>
        CGPA: <input type="text" name="cgpa" required><br><br>

        <input type="submit" value="Add Student">
    </form>

    <%
        if(request.getMethod().equalsIgnoreCase("POST")) {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String course = request.getParameter("course");
            int age = Integer.parseInt(request.getParameter("age"));
            float cgpa = Float.parseFloat(request.getParameter("cgpa"));

            try {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO student(name,email,course,age,cgpa) VALUES(?,?,?,?,?)"
                );

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, course);
                ps.setInt(4, age);
                ps.setFloat(5, cgpa);

                ps.executeUpdate();

                out.println("<p style='color:green;'>Student Added Successfully!</p>");

                ps.close();

                response.sendRedirect("addStudent.jsp");

            } catch(Exception e) {
                e.printStackTrace();
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        }
    %>

</body>
</html>