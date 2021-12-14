<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="main.css?ver=1">
  <title></title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</head>

<body>


	<%@ page import="java.sql.*"%>
	<%
	String email = request.getParameter("emailLogin");
	String pswd = request.getParameter("pswdLogin");
	String nickname = "1";
	try {
		Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager
		.getConnection("jdbc:mysql://localhost:3306/gamedb?" + "user=root&password=7702");
		PreparedStatement pst = conn.prepareStatement("Select nickname from user where email=? and password=?");
		pst.setString(1, email);            //set first parameter as email
		pst.setString(2, pswd);             //set second parameter as password
		ResultSet rs = pst.executeQuery();    //get user account data which is same with above parameter
		if (rs.next()) {
			nickname = rs.getString("nickname"); // save the nickname in local variable
		} else{   //if there is no data which match with query (with email and password), alert that user entered wrong account and go back to login page.
			%>
			<script>
			alert("You have entered wrong account. Try again.");
			history.back();
			</script>
			<%
		}
	} catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}
	%>


  <div class="containerA">
    <div class="navbarA">
      <img class="logo" src="assets/Logo5.png" alt="">
      <div class="header">
        <a href="#"></a>
        <ul class="menu" id="menu">
          <li>Home</li>
          <li onclick="saveName('<%=nickname%>')">Search</li>
          <li>Contact</li>
          <span id="curName" class="user"><i class="fas fa-user"></i><%=nickname%></span>
          <div id="logout_page" class="logout_modal history">
            <div class="logout_sub">
              <button id="btn_logout"class="button-30" role="button"><i class="fas fa-sign-out-alt"></i>LOGOUT</button>
            </div>
          </div>
        </ul>

      </div>
    </div>
    <div class="home" id="home">
      <button type="button" class="btn_bar" id="btn_theme">
        <span class='text'>THEME</span><span class="icon"><i class="fas fa-palette"></i></span>
      </button>
      <div id="theme_modal" class="theme_modal">
        <div class="theme_modal_header">
          <h6>Choose your theme</h6>
        </div>
        <h6 style="position: absolute; top: 65px; left: 13px;">Orange</h6>
        <div id="theme1" class="theme main_c color1"><i class="fas fa-paint-brush"></i></div>
        <div class="theme sub_c color1_s">
          <h6 style="color:white; padding-left: 30px; padding-top: 10px;">Black</h6>
        </div>


        <h6 style="position: absolute; top: 110px; left: 13px;">Skyblue</h6>
        <div id="theme2" class="theme main_c color2"><i class="fas fa-paint-brush"></i></div>
        <div class="theme sub_c color2_s">
          <h6 style="color:black; padding-left: 30px; padding-top: 10px;">White</h6>
        </div>

        <h6 style="position: absolute; top: 155px; left: 13px;">Cream</h6>
        <div id="theme3" class="theme main_c color3"><i class="fas fa-paint-brush"></i></div>
        <div class="theme sub_c color3_s">
          <h6 style="color:black; padding-left: 30px; padding-top: 10px;">White</h6>
        </div>


      </div>
      <div class="home_ment">
        <h1 class="hero glitch layers" data-text="GAME VIEW"><span>GAME VIEW</span></h1>
        <div class="home_ment_sub">
          <h2>Gaming Review Community</h2>
        </div>
        <div class="btn_grad" id="btn_start" onclick="saveName('<%=nickname%>')">
          <h6>start</h6>
        </div>
      </div>
    </div>
    <div class="search" id="search">
      <button type="button" class="btn_bar" id="btn_history">
        <span class='text'>HISTORY</span><span class="icon"><i class="fa fa-bars"></i></span>
      </button>
      <div id="theme_history" class="theme_modal history">
        <div class="theme_modal_header">
          <h6>Resent visited</h6>
        </div>
        <div id="theme_history_contents" class="">

        </div>

      </div>
      <div class="jumbotron">
        <div class="banner">
          <h1 class="">game review</h1>
          <h2>Search the game and explore the reviews below.</h2>
        </div>
        <form id="searchFormL">
          <input type="text" class="form-control" id="searchText" placeholder="Enter your words. 10 games that match with the words will be shown.">
          <button type="submit" class="searchButton">
          <i class="fa fa-search"></i>
          </button>
        </form>
      </div>
      <div id="result" class="row"></div>
    </div>
    <section id="contact">

      <h1 class="section-header">Contact Us</h1>

      <div class="contact-wrapper">

        <!-- Left contact page -->

        <form id="contact-form" class="form-horizontal" role="form">

          <div class="form-group">
            <div class="col-sm-12">
              <input type="text" class="form-control" id="name" placeholder="NAME" name="name" value="" required>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-12">
              <input type="email" class="form-control" id="email" placeholder="EMAIL" name="email" value="" required>
            </div>
          </div>

          <textarea class="form-control" rows="10" placeholder="MESSAGE" name="message" required></textarea>

          <button class="btn btn-primary send-button" id="submit" type="submit" value="SEND">
            <div class="alt-send-button">
              <i class="fa fa-paper-plane"></i><span class="send-text">SEND</span>
            </div>

          </button>

        </form>

        <!-- Left contact page -->

        <div class="direct-contact-container">

          <ul class="contact-list">
            <li class="list-item"><i class="fa fa-map-marker fa-2x"><span class="contact-text place">Suwon, SKKU</span></i></li>

            <li class="list-item"><i class="fa fa-phone fa-2x"><span class="contact-text phone"><a href="tel:" title="Give me a call">(XXX) XXX-XXXX</a></span></i></li>

            <li class="list-item"><i class="fa fa-envelope fa-2x"><span class="contact-text gmail"><a href="mailto:gameviewnice.gmail.com" title="Send me an email">gameviewnice@gmail.com</a></span></i></li>

          </ul>

          <hr>
          <ul class="social-media-list">
            <li><a href="https://www.facebook.com/" target="_blank" class="contact-icon">
                <i class="icon ion-social-facebook" aria-hidden="true"></i></a>
            </li>
            <li><a href="https://twitter.com/" target="_blank" class="contact-icon">
                <i class="icon ion-social-twitter" aria-hidden="true"></i></a>
            </li>
            <li><a href="https://www.snapchat.com/" target="_blank" class="contact-icon">
                <i class="icon ion-social-snapchat" aria-hidden="true"></i></a>
            </li>
            <li><a href="https://www.instagram.com/" target="_blank" class="contact-icon">
                <i class="icon ion-social-instagram" aria-hidden="true"></i></a>
            </li>
          </ul>
          <hr>

          <div class="copyright">&copy; ALL OF THE RIGHTS RESERVED</div>

        </div>

      </div>

    </section>

  </div>

  <div class="footer-dark">
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-md-3 item">
            <h3>Services</h3>
            <ul id="footer_menu">
              <li><a href="#">Home</a></li>
              <li><a href="#">Search</a></li>
              <li><a href="#">Contact Us</a></li>
            </ul>
          </div>
          <div class="col-sm-6 col-md-3 item">
            <h3>About</h3>
            <ul>
              <li><a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Project</a></li>
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel" style="transform:none">SKKU</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      Class: Web Programming Lab SWE3048_43<br>
                      Professor: TAMER ABUHMED<br>
                      Project: Final Project
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
              <li><a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal1">Team</a></li>
              <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel" style="transform:none">Team member</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      2017314649 ByeongNam Kang<br>
                      2017314626 JaeHoon Lee<br>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
            </ul>
          </div>
          <div class="col-md-6 item text">
            <h3>Game view</h3>
            <p>This web page allows you to register and view reviews of games and easily search for information on numerous games. Feel free to sign up and use these various features.</p>
            <p>Huge information about the game was taken from www.giantbomb.com as API.</p>
          </div>
          <div class="col item social">
            <a href="https://www.facebook.com/" target="_blank"><i class="icon ion-social-facebook"></i></a>
            <a href="https://twitter.com/" target="_blank"><i class="icon ion-social-twitter"></i></a>
            <a href="https://www.snapchat.com/" target="_blank"><i class="icon ion-social-snapchat"></i></a>
            <a href="https://www.instagram.com/" target="_blank"><i class="icon ion-social-instagram"></i></a>
          </div>
        </div>
        <p class="copyright" style="color: white">Game View � 2021</p>
      </div>
    </footer>
  </div>
  </div>
  <script type="text/javascript" src="script.js?ver=1"></script>
</body>

</html>
