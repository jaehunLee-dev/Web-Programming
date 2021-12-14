<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">

</script>
<title>Game Information</title>
</head>

<body>

	<%@ page import="java.sql.*"%>
	<%
	String title = "";
	String review = "";
	String uid="";
	String score="";
	try {
		String gid = request.getParameter("gid");				//get gid by request
		String rid = request.getParameter("rid");				//get rid by request
		Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager
		.getConnection("jdbc:mysql://localhost:3306/gamedb?" + "user=root&password=7702");
		PreparedStatement pst = conn.prepareStatement("Select gameId, userId, fullReview, score, title from games where gameId=? and reviewId=?");
		pst.setString(1, gid);
		pst.setString(2, rid);
		ResultSet rs = pst.executeQuery();				//find data by query
		title = "1";
		while (title != "") {
			if (rs.next()) {											//show the full review of selected review.
				title = rs.getString("title");
				review = rs.getString("fullReview");
				uid = rs.getString("userId");
				score = rs.getString("score");
				%>
				<div id="pageTitle" style="font-size: x-large;"><%=title %></div>
				<div id="byUid" style="font-size: x-large;"><i>by <%=uid %></i></div>
				<div id="byScore" style="font-size: x-large;">Score: <%=score %>/10</i>
				<%
				switch (Integer.parseInt(score)){					//if 8<=score<=10, it is best game.
				case 10:
				case 9:
				case 8:
				%>
				<div class = "imgContainer">
						<img class="rateImg" src="assets/thabong.jpg" alt="good" />
				</div>
				</div>
				<div class="rateContainer">
					<div class="green rateMsg" style="font-size: x-large;">Strongly recommended! God game!</div>
				</div>
				<%
				break;																	//if 6<=score<=7, it is good game.
				case 7:
				case 6:
				%>
				<div class = "imgContainer">
						<img class="rateImg" src="assets/soso.jpg" alt="soso" />
				</div>
				</div>
				<div class="rateContainer">
					<div class="rateMsg orange" style="font-size: x-large;">Maybe you can enjoy it. Try it.</div>
				</div>
				<%
				break;															//if 4<=score<=5, it is bad game.
				case 5:
				case 4:
				%>
				<div class = "imgContainer">
						<img class="rateImg" src="assets/bad.jpg" alt="bad" />
				</div>
				</div>
				<div class="rateContainer">
					<div class="rateMsg black" style="font-size: x-large;">Bad game....</div>
				</div>
				<%
				break;														//if score<4, it is terrible game.
				default:
				%>
				<div class = "imgContainer">
						<img class="rateImg" src="assets/suck.png" alt="terrible" />
				</div>
				</div>
				<div class="rateContainer">
					<div class="rateMsg red" style="font-size: x-large;">Do not play this. Its terrible game.</div>
				</div>
				<%
				}
				%>
				<div id="pageContent"><%=review %></div>
				<%
			} else{
				title = "";
				review = "";
			}
		}
	} catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}
	%>
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
	<script type="text/javascript" src="script.js"></script>
</body>

</html>
