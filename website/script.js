// initial state of divs
$('#search').hide();
$('#theme_history').hide();
$('#theme_modal').hide();
$('#logout_page').hide();
$('#contact').hide();


let history = []; // this is the array that store to local storage. This array have recent visited game's image
let theme = 0; // this is the flag of theme style
let nickName = "initial"; // this is the nickname of logged user

$('#curName').on('click', function() { // if you click the user name logout modal(page) will pop up
  $('#logout_page').toggle();
})

$('#btn_logout').on('click', function() { // if you click the logout button go to main page which user is not logged state
  location.replace('main.html');
})

$('#btn_start').on('click', function() { // if you click the start button go to search page (in this progress we get history data from local storage)
  $('#home').fadeOut();
  $('#search').slideDown(400);
  $('#theme_history').hide();
  getFromLocalStorage();
});

function theme1() { // theme 1 set css functionm

  $('.home').animate({
    "opacity": "0"
  }, 10);
  $('.navbarA').delay(150).css('background', 'linear-gradient(to right, #060201 30%, #FF8000)');
  $('.home').delay(150).css('background-image', 'url("assets/background1.jpg")');
  $('.home_ment_sub').delay(150).css('color', 'rgba(200, 103, 30, 0.8)');
  $('.btn_grad').delay(150).css('color', 'rgba(200, 103, 30, 0.8)');
  $('.btn_grad').delay(150).css('border', '2px solid rgba(200, 103, 30, 0.3)');
  $('.theme_modal_header').delay(150).css('background', '#FF8000');
  $('.theme_modal').delay(150).css('border', '2px solid #FF8000');
  $('.logout_modal').delay(150).css('border', '2px solid #FF8000');
  $('.btn_bar').delay(150).css('background', '#FF8000');
  $('.btn_bar .icon').delay(150).css('border-left', '1px solid #DF7401');
  $('.logo').attr('src', 'assets/Logo5.png');
  $('.search').css('background', 'black');
  $('.searchButton').css('background', '#FF8000');
  $('.searchButton').css('border', '1px solid #FF8000');
  $('#searchText').css('border', '3px solid #FF8000');
  $(".game-card").css('color', 'white');
  $("#contact").css('background', 'black');


  $('.home').delay(170).animate({
    "opacity": "1"
  });
};
$('#theme1').on('click', function() { // if theme 1 button clicked
  theme1();
  $('#logout_page').hide();
  saveTheme(1);
});

function theme2() { // theme 2 set css functionm

  $('.home').animate({
    "opacity": "0"
  }, 10);
  $('.navbarA').delay(150).css('background', 'linear-gradient(to right, white 20%, rgba(68,122,158,1))');
  $('.home').delay(150).css('background-image', 'url("assets/background2.jpg")');
  $('.home_ment_sub').delay(150).css('color', 'rgba(35, 201, 224, 1)');
  $('.btn_grad').delay(150).css('color', 'rgba(35, 201, 224, 1.5)');
  $('.btn_grad').delay(150).css('border', '2px solid rgba(35, 201, 224, 1.5)');
  $('.theme_modal_header').delay(150).css('background', 'rgba(35, 201, 224, 0.8)');
  $('.theme_modal').delay(150).css('border', '2px solid rgba(35, 201, 224, 0.8)');
  $('.logout_modal').delay(150).css('border', '2px solid rgba(35, 201, 224, 0.8)');
  $('.btn_bar').delay(150).css('background', 'rgba(35, 201, 224, 1)');
  $('.btn_bar .icon').delay(150).css('border-left', '1px solid white');
  $('.logo').delay(150).attr('src', 'assets/Logo4.png');
  $('.search').css('background', 'rgba(255,255,255,0.8)');
  $('.searchButton').css('background', 'rgba(35, 201, 224, 0.8)');
  $('.searchButton').css('border', '1px solid rgba(35, 201, 224, 0.8)');
  $('#searchText').css('border', '3px solid rgba(35, 201, 224, 0.8)');
  $(".game-card").css('color', 'black');
  $("#contact").css('background', 'rgba(255,255,255,0.8)');

  $('.home').delay(170).animate({
    "opacity": "1"
  });
};
$('#theme2').on('click', function() { // if theme 2 button clicked
  theme2();
  $('#logout_page').hide();
  saveTheme(2);
});

function theme3() { // theme 3 set css functionm

  $('.home').animate({
    "opacity": "0"
  }, 10);
  $('.navbarA').delay(150).css('background', 'linear-gradient(to right, white 20%, rgba(205,194,105,1))');
  $('.home').delay(150).css('background-image', 'url("assets/background3.jpg")');
  $('.home_ment_sub').delay(150).css('color', 'rgba(228,222,143,1)');
  $('.btn_grad').delay(150).css('color', 'rgba(228,222,143,1)');
  $('.btn_grad').delay(150).css('border', '2px solid rgba(228,222,143,1)');
  $('.theme_modal_header').delay(150).css('background', 'rgba(228,222,143,0.8)');
  $('.theme_modal').delay(150).css('border', '2px solid rgba(228,222,143,0.8)');
  $('.logout_modal').delay(150).css('border', '2px solid rgba(228,222,143,0.8)');
  $('.btn_bar').delay(150).css('background', 'rgba(228,222,143,1)');
  $('.btn_bar .icon').delay(150).css('border-left', '1px solid white');
  $('.logo').delay(150).attr('src', 'assets/Logo3.png');
  $('.search').css('background', 'rgba(255,255,255,0.8)');
  $('.searchButton').css('background', 'rgba(228,222,143,0.8)');
  $('.searchButton').css('border', '1px solid rgba(228,222,143,0.8)');
  $('#searchText').css('border', '3px solid rgba(228,222,143,0.8)');
  $(".game-card").css('color', 'black');
  $("#contact").css('background', 'rgba(255,255,255,0.8)');

  $('.home').delay(170).animate({
    "opacity": "1"
  });
};
$('#theme3').on('click', function() { // if theme 3 button clicked
  theme3();
  $('#logout_page').hide();
  saveTheme(3);
});


$("#menu").on("click", "li", function() { // this is the header list click handler. When clicked, they play their respective roles. (page handle)
  if ($(this).text() == "Home") {
    $('#home').show();
    $('#search').hide();
    $('#theme_modal').hide();
    $('#contact').hide();
  } else if ($(this).text() == "Search") {
    $('#home').hide();
    $('#search').show();
    $('#theme_history').hide();
    $('#contact').hide();
    getFromLocalStorage();
  } else if ($(this).text() == "LogIn") {
    location.href = "login.jsp";
  } else if ($(this).text() == "Contact") {
    $('#home').hide();
    $('#search').hide();
    $('#theme_modal').hide();
    $('#theme_history').hide();
    $('#contact').show();
  }
});

$("#footer_menu").on("click", "li", function() { // this is the a footer services list click handler. When clicked, they play their respective roles. (page handle)
  if ($(this).text() == "Home") {
    $('#home').show();
    $('#search').hide();
    $('#theme_modal').hide();
    $('#contact').hide();
  } else if ($(this).text() == "Search") {
    $('#home').hide();
    $('#search').show();
    $('#theme_history').hide();
    $('#contact').hide();
    getFromLocalStorage();
  } else if ($(this).text() == "Contact Us") {
    $('#home').hide();
    $('#search').hide();
    $('#theme_modal').hide();
    $('#theme_history').hide();
    $('#contact').show();
  }
});


$('#btn_theme').on('click', function() { // if theme button clicked, pop up theme modal
  $('#theme_modal').slideToggle();
})

$('#btn_history').on('click', function() { // if =history button clicked, pop up theme modal
  $('#theme_history').slideToggle();
})


$('#postRVBtn').click(function() {  //if postReview button clicked, set all inputs ''
  $('#taskTitle').val('');
  $('#taskDscrb').val('');
  $('#summary').val('');
});

$('#login2postBtn').click(function() {  //go to login page
  location.href = "login.jsp";
});

$('#save').click(function(event) {    //if any inappropriate are there, do not submit and if it's ok, submit to validate.jsp (it is done at gameLog.jsp)

  if ($('#summary').val() == '' || $('#taskTitle').val() == '' || $('#taskDscrb').val() == '') {
    alert('You should enter all contents');
    event.preventDefault();
    return;
  }
  $("#nickname2").val(sessionStorage.getItem('name'));
  let today = new Date();

  let year = today.getFullYear(); // year
  let month = today.getMonth() + 1; // month
  let date = today.getDate(); //date
  $("#date").val(year + ' / ' + month + ' / ' + date);


  $('#exampleModal').modal('hide');
});


$(document).ready(function() { //when document is ready get the data from local storage
  getFromLocalStorage();
});

function reviewClick() { // find full review by gid and rid, then open pop-up full review window
  var _width = '650';
  var _height = '780';
  var _left = Math.ceil((window.screen.width - _width) / 2);
  var _top = Math.ceil((window.screen.height - _height) / 2);
  var gid = sessionStorage.getItem('gameID');
  var rid = event.currentTarget.querySelector('.reviewId').innerHTML;
  window.open('gameInfo.jsp?gid=' + gid + "&rid=" + rid, 'full review', 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);
}


$(function() { // when the DOM is fully loaded

  $('#searchForm').submit(function(e) {
    let searchText = $('#searchText').val(); // store input text to variable
    getGames(searchText, 0);
    e.preventDefault();
  });

});
$(function() { // when the DOM is fully loaded

  $('#searchFormL').submit(function(e) {
    let searchText = $('#searchText').val(); // store input text to variable
    getGames(searchText, 1);
    e.preventDefault();
  });
});






function getGames(searchText, mode) {
  $.ajax({ // Perform an asynchronous HTTP (Ajax) request
      type: 'GET',
      dataType: 'jsonp',
      crossDomain: true,
      jsonp: 'json_callback',
      url: 'https://www.giantbomb.com/api/search/?api_key=ec164f3e4ebfe95b8f71fde3a5b2562480e35db4&query=' + searchText + '&resources=game&format=jsonp'
    })
    .done(function(data) { // done will resolve as soon as we have the response
      let games = data.results;
      let output = '';

      if (games.length == 0) { // if the search doesn't match any results
        output += '<h3>No games found!</h3>';
        $('#result').html(output);
      } else {
        $.map(games, function(game) { // .map() translates all items in an array or object to new array of items.
          output += `
				<div class="col-lg-4 col-sm-5 game-card">
		            <img class="img-fluid" src="${game.image.small_url}" onclick="gameSelected('${game.id}','${game.image.small_url}', ${mode})">
		            <h5>${game.name}</h5>
                <br><br><br>

		        </div>
				`;
          $('#result').html(output);
        });
      }
    })
    .fail(function() { // if there is an error sending the request
      let errMsg = '<h3>An error occured</h3>'; // new variable because output is undefined
      $('#result').html(errMsg);
    });
};

function saveName(name) { // get the nickname from parameter
  nickName = name;
}

function gameSelected(id, img_url, mode) { // if specific game is selected, get the id and image of game and also get the mode(=login status)
  addContent(id, img_url);
  sessionStorage.setItem('gameID', id);
  sessionStorage.setItem('name', nickName);
  setTimeout(function() {
    if (mode == 0) { // check current login status
      nickName = "";
      window.location.assign('game.jsp?gid=' + id);
    } else {
      window.location.assign('gameLog.jsp?gid=' + id);
    }

  }, 400);

  return false;
}



function getGame(mode) { // receive a game ID and a user nickname from the session storage. After that, the game information received from Json through the game ID is displayed on the screen.

  let gameId = sessionStorage.getItem('gameID');
  let poster = sessionStorage.getItem('name');


  $.ajax({
      type: 'GET',
      dataType: 'jsonp',
      crossDomain: true,
      jsonp: 'json_callback',
      url: 'https://www.giantbomb.com/api/game/' + gameId + '/?api_key=a98aac48e7d66d4bedf4e73f4b9c533295c02a9e&format=jsonp'
    })
    .done(function(data) { // show the information of selected game
      let game = data.results;
      let output = `
			<div class="row">
	    		<div class="col-md-4">
	    			<img class="rounded" src="${game.image.medium_url}">
					<div style="display:flex; justify-content:flex-start; align-items:center;">
						<a href="#" class="prvBtn" onClick="window.history.back(); return false ; "> <i class="fas fa-arrow-left"></i>&nbsp;Prev Page</a>
						<a href="${game.site_detail_url}" target="_blank" class="detailBtn">View in detail</a>
					</div>
	    		</div>
	    		<div class="col-md-8">
	    			<h2>${game.name}</h2>
	    			<p id="deck" class="font-italic"></p>
	    			<ul class="list-group">
	    				<li id="platforms" class="list-group-item"><strong>Platforms: </strong></li>
	    				<li id="genres" class="list-group-item"><strong>Genres: </strong></li>
	    				<li id="themes" class="list-group-item"><strong>Themes: </strong></li>
	    				<li id="devs" class="list-group-item"><strong>Developers: </strong></li>
	    				<li id="pubs" class="list-group-item"><strong>Publishers: </strong></li>
	    				<li id="release" class="list-group-item"></li>
	    			</ul>
					<p id="pNick" style="display:none">${poster}</p>
	    		</div>
	    	</div>
		`;
      $('#game').html(output);
      if (game.deck == null) { // game information
        $('p#deck').append('No description available');
      } else {
        $('p#deck').append(game.deck);
      }
      if (game.platforms == null) { // game information
        $('li#platforms').append('N/A');
      } else {
        for (i = 0; i < game.platforms.length; i++) {
          $('li#platforms').append(game.platforms[i].name + '; ');
        }
      }

      if (game.genres == null) { // game information
        $('li#genres').append('N/A');
      } else {
        for (i = 0; i < game.genres.length; i++) {
          $('li#genres').append(game.genres[i].name + '; ');
        }
      }
      if (game.themes == null) { // game information
        $('li#themes').append('N/A');
      } else {
        for (i = 0; i < game.themes.length; i++) {
          $('li#themes').append(game.themes[i].name + '; ');
        }
      }
      if (game.developers == null) { // game information
        $('li#devs').append('N/A');
      } else {
        for (i = 0; i < game.developers.length; i++) {
          $('li#devs').append(game.developers[i].name + '; ');
        }
      }

      if (game.publishers == null) { // game information
        $('li#pubs').append('N/A');
      } else {
        for (i = 0; i < game.publishers.length; i++) {
          $('li#pubs').append(game.publishers[i].name + '; ');
        }
      }
      if (game.expected_release_year !== null) { // game information
        $('li#release').append('<strong>Expected release year: </strong>' + game.expected_release_year);
      } else if (game.original_release_date !== null) { // game information
        $('li#release').append('<strong>Original release date: </strong>' + game.original_release_date);
      } else {
        $('li#release').append('<strong>Release date: </strong>N/A');
      }
    })
    .fail(function() { // failed to get game data from server
      let errMsg = '<h3>An error occured</h3>';
      $('#game').append(errMsg);
    });
}

const drawStar = (target) => { // drawing a score star
  document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
}

function addContent(id1, img_url1) { // add game data to array and local storage and show in the recent game modal
  var not_push = 0;
  const data = {
    id: id1,
    img_url: img_url1,
  };

  history.forEach(function(history) { // check the game id that duplicated
    if (data.id == history.id) {
      not_push = 1;
    }
  });
  if (not_push == 0) { // handle the duplicated or situation that recent visited game is more than 5
    if (history.length == 5) {
      history.pop();
    }
    history.unshift(data);
    localStorage.setItem('history', JSON.stringify(history));
    renderToHTML(history);
  }
}

function saveTheme(theme) { // save the theme number to local storage
  localStorage.setItem('theme', JSON.stringify(theme));
}

function getFromLocalStorage() { // get data from local storage
  const reference = localStorage.getItem('history');
  const reference2 = localStorage.getItem('theme');
  // if reference exists
  if (reference) {
    // converts back to array and store it in todos array
    history = JSON.parse(reference);
    renderToHTML(history);
  }
  if (reference2) {
    // converts back to array and store it in todos array
    theme = JSON.parse(reference2);
    renderTheme(theme);
  }
}

function renderToHTML(history) { // rearrange the grid based on local storage
  console.log(history);
  const cardGrid = document.querySelector('#theme_history_contents');
  cardGrid.innerHTML = '';
  let mode=0;
  if(nickName!="initial"){
    mode=1;
  }
  history.forEach(function(history) { // render the array to recent visited page
    const div = document.createElement('div');
    if(mode==0){ // not login
      div.innerHTML = `
        <div class="history_card">
        <img style="max-width: 130px; margin-top: 10px; margin-bottom: 10px;"
        class="img-fluid" src="${history.img_url}"
        onclick="gameSelected('${history.id}','${history.img_url}',0)">
        </div>
      `;
    }
    else{ // login
      div.innerHTML = `
        <div class="history_card">
        <img style="max-width: 130px; margin-top: 10px; margin-bottom: 10px;"
        class="img-fluid" src="${history.img_url}"
        onclick="gameSelected('${history.id}','${history.img_url}',1)">
        </div>
      `;
    }
    cardGrid.append(div);
  });
}

function renderTheme(theme) { // render the theme
  if (theme == 1) {
    theme1();
  } else if (theme == 2) {
    theme2();
  } else if (theme == 3) {
    theme3();
  }
}

document.querySelector('#contact-form').addEventListener('submit', (e) => { // recieving contact us form (submit is not actually done because this site doesn't have official mail or service)
  e.preventDefault();
  e.target.elements.name.value = '';
  e.target.elements.email.value = '';
  e.target.elements.message.value = '';
});
