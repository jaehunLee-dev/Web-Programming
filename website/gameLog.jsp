<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
								<div class="button_base b03_skewed_slide_in"  data-bs-toggle="modal" data-bs-target="#exampleModal" id="postRVBtn">
						<div>Post Review</div>
						<div></div>
						<div>PostReview</div>
					</div>
		</div>
		<hr />




		<%
			String maxRid = "";
			int maxRidInt = -1;
			String gid2="";
			try {
				gid2 = request.getParameter("gid"); //get game id by request
				Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
				Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/gamedb?" + "user=root&password=7702");
				PreparedStatement pst = conn.prepareStatement("Select MAX(reviewId) AS max_rid from games");		//find maximum rid from data for inserting next review.
				ResultSet rs2 = pst.executeQuery();
				if (rs2.next()){
					maxRid = rs2.getString("max_rid");
					maxRidInt = Integer.parseInt(maxRid);
					maxRidInt+=1;
				}
				else{
					maxRid = "0";
					maxRidInt = 0;
				}
				//out.println(rid2);
			} catch (Exception e) {
			}
			%>




		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Post Review</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">X</button>
					</div>
					<div class="modal-body">
						<form method="post" action="validate.jsp" id="reviewPost">
							<input type="hidden" id="nickname2" name="nickname2" /> <input
								type="hidden" id="date" name="date" /> <input type="number"
								id="reviewId" name="rid" value="<%=(maxRidInt)+""%>"
								style="display: none"> <input type="text" id="gIdHidden"
								name="gid2" value="<%=(gid2)+""%>" style="display: none">

							<div class="mb-3 normWeight" style="margin-top: -20px;">
								<label for="taskTitle" class="col-form-label">Review
									Title</label> <input type="text" class="form-control" id="taskTitle"
									placeholder="Review Title" name="title" maxlength="500">
							</div>

							<div class="mb-3 normWeight">
								<label for="taskType" class="col-form-label">Game Score</label>
								<span class="star"> ★★★★★ <span>★★★★★</span> <input
									type="range" oninput="drawStar(this)" value="1" step="1"
									min="0" max="10" id="starScore" name="score">
								</span>
							</div>
							<div class="mb-3 normWeight">
								<label for="taskDscrb" class="col-form-label">Review
									contents</label>
								<textarea class="form-control" id="taskDscrb"
									placeholder="Write your game review" name="fullReview" maxlength="5000"></textarea>
							</div>
							<div class="mb-3 normWeight">
								<label for="summary" class="col-form-label">Review
									summary</label>
								<textarea class="form-control" id="summary"
									placeholder="Write your review summary" name="summary" maxlength="5000"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" id="close"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id="save"
							form="reviewPost">Post Review</button>
					</div>
				</div>
			</div>
		</div>

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
				PreparedStatement pst = conn.prepareStatement("Select reviewId, score, title, summary, date from games where gameId=?");
				pst.setString(1, gid);							//set first parameter as gid
				ResultSet rs = pst.executeQuery();	//get review data which have same 'gid' with parameter
				title = "1";
				while (title != "") {
					if (rs.next()) {
				title = rs.getString("title");
				rvScore = rs.getString("score");
				review = rs.getString("summary");
				rid = rs.getString("reviewId");
				date = rs.getString("date");
				//render all game reviews on screen
			%>
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
		getGame(1);
	</script>
</body>

</html>
