<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>validate</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	try {
		String reviewId = request.getParameter("rid");						//get parameters by request
		String gameId = request.getParameter("gid2");
		String title = request.getParameter("title").replaceAll("'","");
		String fullReview = request.getParameter("fullReview").replaceAll("'","");
		String summary = request.getParameter("summary").replaceAll("'","");
		String score = request.getParameter("score");
		String userId = request.getParameter("nickname2");
		String date = request.getParameter("date");
		Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager
		.getConnection("jdbc:mysql://localhost:3306/gamedb?" + "user=root & password=7702");

		Statement st = conn.createStatement();

		int i = st.executeUpdate("insert into games (reviewId,gameId,userId,fullReview,score,title,summary, date) values('"+reviewId+"','"+gameId+"','"+				//insert new game review into game database
				userId+"','"+fullReview+"','"+score+"','"+title+"','"+summary +"','"+ date+"')");
				if (i == 0) {
					reviewId = "";
					gameId = "";
					fullReview = "";
					score = "";
				}
				response.sendRedirect("gameLog.jsp?gid="+gameId);												//after insertion, go back to gameLog page
		}

	catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}

	%>
</body>
</html>
