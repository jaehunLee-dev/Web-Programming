<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Page</title>
<link rel="stylesheet" href="login.css?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="login.js?ver=1"></script>
</head>
<body style="background-color: black;">
	<div style="display:flex; align-item:center; justify-content:center; margin-top:50px; margin-bottom:-50px; height:80px; line-height:80px;">
		<div
			style="background-color: white; color: orange; width: 25%; font-size: 300%; text-align: center; background-color:  #1C2024; font-weight:800;">GameView
		</div>
	</div>


	<div class="bodyContainer">
		<div class="mainBox">
			<div id="menu">
				<div id="loginTitle">
					<div id="loginBoxColor"></div>
					<div class="centerText">Login</div>
				</div>
				<div id="signUpTitle">
					<div id="signUpBoxColor"></div>
					<div class="centerText">Sign Up</div>
				</div>
			</div>
			<div id="loginInfo">
				<div class="title">Login</div>
				<div id="loginMsg">Enter your email and password:</div>
				<form method="post" action="mainLog.jsp" id="loginPost">
					<span class="inputTitle">Email</span><br>
					<div class="inputContainer" style="margin-bottom:20px;">
						<input type="text" class="userInfo" placeholder="Email"
							id="emailInput" name="emailLogin">
						<div class="alertMsg" id="emailInputMsg">Your email address
							is invalid!</div>
					</div>

					<span class="inputTitle">Password</span><br>
					<div class="inputContainer">
						<input type="password" class="userInfo" placeholder="Password"
							id="pswdInput" name="pswdLogin">
						<div class="alertMsg" id="pswdInputMsg">Please enter your
							password!</div>
					</div>
				</form>
				<button id="loginBtn">Login</button>
			</div>

			<div id="signUpInfo">
				<div class="title">Sign Up</div>
				<div class="bold">Sign up to GameView:</div>
				<form method="post" action="signup.jsp" id="signupPost">
					<span class="inputTitle">Nickname</span><br>
					<div class="inputContainer" style="margin-bottom:20px;">
						<input type="text" class="userInfo" id="firstName"
							placeholder="Nickname(english letter and number are possible)"
							name="nickname" maxlength="45">
						<div class="alertMsg" id="firstNameMsg">Please enter your
							nickname!</div>
					</div>
					<span class="inputTitle" >Email</span><br>
					<div class="inputContainer" style="margin-bottom:20px;">
						<input type="email" class="userInfo" placeholder="Email"
							id="email" name="email" maxlength="90"> <br>
						<div class="alertMsg" id="emailMsg">Please enter your email!</div>
					</div>
					<span class="inputTitle">Password</span><br>
					<div class="inputContainer" style="margin-bottom:20px;">
						<input type="password" class="userInfo" placeholder="Password"
							id="pswd" name="pswd" maxlength="45">
						<div class="alertMsg" id="pswdMsg">Please enter your
							password!</div>
					</div>
					<span class="inputTitle">Confirm password</span><br>
					<div class="inputContainer">
						<input type="password" class="userInfo" placeholder="Password"
							id="pswd_validate">
						<div class="alertMsg" id="pswdValidMsg">Please re-enter your
							password!</div>
					</div>
				</form>

				<button id="signUpBtn" >Sign Up</button>
			</div>
		</div>
	</div>
</body>
</html>
