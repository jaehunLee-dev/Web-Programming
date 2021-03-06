<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<!-- this jsp page is for not logged in status-->
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">

</script>
<title>Game Details</title>
</head>

<body>
<%@ page import="java.sql.*"%>
	<div id="game" class="container"></div>
	<div class="center">
		<div id="reviewTitle">
		<div>Game Review</div>
						<div class="button_base b03_skewed_slide_in" id="login2postBtn">
						<div id="login2postBtn">Login to Post</div>
						<div id="login2postBtn"></div>
						<div>Login to Post</div>
					</div>
		</div>
		<hr />








		<div id="review">

			<%
			String title = "";
			String review = "";
			String rvScore = "";
			String rid = "";
			String date = "";
			try {
				String gid = request.getParameter("gid"); //get game id by request
				Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
				Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/gamedb?" + "user=root&password=7702");
				PreparedStatement pst = conn.prepareStatement("Select reviewId, score, title, summary,date from games where gameId=?");			//query for finding review from database
				pst.setString(1, gid);
				ResultSet rs = pst.executeQuery();
				title = "1";
				while (title != "") {
					if (rs.next()) {					//get review's information (title,score,summary,reviewId, date)
				title = rs.getString("title");
				rvScore = rs.getString("score");
				review = rs.getString("summary");
				rid = rs.getString("reviewId");
				date = rs.getString("date");
			%>
			<!-- render reviews from database to screen-->
			<div>
			<div class="review_items" gid="<%=gid%>" rid="<%=rid%>">
				<div class="review_header">
					<div style="width:93%;">
						<div class="reviewItemTitle"><%=title%></div>
						<div class="reviewItemDate"><%=date%></div>
					</div>
					<div class="reviewScore"><%=rvScore%></div>
				</div>
					<div class="reviewSummary">
						<div><%=review%></div>
						<div class="viewFullBtn" gid="<%=gid%>"  onclick="reviewClick()"><i class="fas fa-bars"></i>
						&nbsp;Full Review
						<div class="reviewId" style="display: none"><%=rid%></div>
						</div>
					</div>
			</div>
			<hr style="width:100%;" />
			</div>
			<%
			} else {
			title = "";
			review = "";
			rvScore = "";
			}
			//out.println(title);
			}
			} catch (Exception e) {
			out.println("Something went wrong !! Please try again");
			}
			%>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous">
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous">

	</script>
	<script type="text/javascript" src="script.js?ver=1"></script>
	<script>
		getGame(0);
	</script>
</body>

</html>
