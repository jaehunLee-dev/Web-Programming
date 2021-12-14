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
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String pswd = request.getParameter("pswd");
		Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager
		.getConnection("jdbc:mysql://localhost:3306/gamedb?" + "user=root & password=7702");

		Statement st = conn.createStatement();

		int i = st.executeUpdate("insert into user (nickname,password,email) values('"+nickname+"','"+pswd+"','"+
				email+"')");
				if (i == 0) {
					nickname = "";
					email = "";
					pswd = "";
				}
				%>
				<script>
				alert("Successfully signed up! Welcome to GameView");				//if success to sign up, go back to login page
				history.back();
				</script>
				<%
		}

	catch (Exception e) {
		%>
		<script>
		alert("Your nickname or email is already signed up");					//if there is already account, alert and go back to login/sign up page
		history.back();
		</script>
		<%
	}

	%>
</body>
</html>
