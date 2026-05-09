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
			String url = "jdbc:postgresql://localhost:5432/chatbot_db";
			String user = "postgres";
			String pass = "Shreya@1807";
			
			Connection con = null;
			
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection(url, user, pass);
				out.println("Database Connected Successfully!");
				
				Statement stmt = con.createStatement();

				// USERS TABLE
				stmt.executeUpdate("CREATE TABLE IF NOT EXISTS users (" +
				    "user_id SERIAL PRIMARY KEY," +
				    "username VARCHAR(50)," +
				    "password VARCHAR(100))");

				// INTENTS TABLE
				stmt.executeUpdate("CREATE TABLE IF NOT EXISTS intents (" +
				    "intent_id SERIAL PRIMARY KEY," +
				    "intent_name VARCHAR(50))");

				// QUESTIONS TABLE
				stmt.executeUpdate("CREATE TABLE IF NOT EXISTS questions (" +
				    "question_id SERIAL PRIMARY KEY," +
				    "question_text TEXT," +
				    "intent_id INT REFERENCES intents(intent_id))");

				// RESPONSES TABLE
				stmt.executeUpdate("CREATE TABLE IF NOT EXISTS responses (" +
				    "response_id SERIAL PRIMARY KEY," +
				    "intent_id INT REFERENCES intents(intent_id)," +
				    "response_text TEXT)");

				// CHAT LOGS TABLE
				stmt.executeUpdate("CREATE TABLE IF NOT EXISTS chat_logs (" +
				    "chat_id SERIAL PRIMARY KEY," +
				    "user_id INT REFERENCES users(user_id)," +
				    "question TEXT," +
				    "response TEXT," +
				    "timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");

				out.println("<br>Tables created successfully!");
			}
			catch (Exception e) {
				out.println(e);
			}
		%>
	</body>
</html>