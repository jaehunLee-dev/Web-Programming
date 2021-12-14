var id = new Array();
var user_pswd = new Array();
var current_idx;
$(document).ready(function(){

    //hide all pages and units except first login page and menu (Login/Sign Up)
    $('#signUpInfo').hide();
    $('#signedUp').hide();
    $('#firstNameMsg').hide();
    $('#lastNameMsg').hide();
    $('#genderMsg').hide();
    $('#emailMsg').hide();
    $('#pswdMsg').hide();
    $('#pswdValidMsg').hide();
    $('#emailInputMsg').hide();
    $('#pswdInputMsg').hide();
    $('#loggedIn').hide();

    //use fade in/out for changing menu (login / sign up)
    $('#signUpTitle').click(function() {                        //show signup menu
		$('#firstName').val('');
		$('#email').val('');
        $('#signedUp').hide();
        $('#loginInfo').fadeOut(500);
        $('#signUpInfo').delay(500).fadeIn(500);
        $('#signUpTitle').css('background-color','white');
        $('#signUpBoxColor').css('background-color','orange');
        $('#loginTitle').css('background-color','#D8D8D8');
        $('#loginBoxColor').css('background-color','#D8D8D8');
        $('#signUpTitle').css('color','black');
        $('#loginTitle').css('color','gray');
    });

    $('#loginTitle').click(function() {                         //show login menu
        $('#signedUp').hide();
        $('#signUpInfo').fadeOut(500);
        $('#loginInfo').delay(500).fadeIn(500)
        $('#loginTitle').css('background-color','white');
        $('#loginBoxColor').css('background-color','orange');
        $('#signUpTitle').css('background-color','#D8D8D8');
        $('#signUpBoxColor').css('background-color','#D8D8D8');
        $('#loginTitle').css('color','black');
        $('#signUpTitle').css('color','gray');

    });

    //when click sing page, warning messages (  eg)"Please enter your email!") appear if input value is empty.
    //'wrong' class makes unit border red.  classAdd or classRemove below are for red border.
    //'checked' class makes 'check' icon in input. classAdd or classRemove below are for check icon.

    $('#signUpInfo').click(function(){                          //signup menu
        if ($('#firstName').val() == ''){
            $('#firstNameMsg').show();
        }

        if ($('#email').val() == ''){
            $('#emailMsg').show();
        }
        if ($('#pswd').val() == ''){
            $('#pswdMsg').show();
        }
        if ($('#pswd_validate').val() == ''){
            $('#pswd_validate').addClass('wrong');
            $('#pswd_validate').removeClass('checked');
            $('#pswdValidMsg').show();
        }

        //functions for wrong/right inputs.
        firstNameValid();
        emailValid();
        pswdValid();
    })

    $('#emailInput').keyup(function(){            //check if email is valid when key is entered to email
        //check for email input
        emailInputValid();
    });

    function emailInputValid(){                   //check if email is valid by regular expression
        var regEx = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;      //regular expression checking Email form
        if (!regEx.test($('#emailInput').val())){
            $('#emailInput').addClass('wrong');
            $('#emailInput').removeClass('checked');
            if ($('#emailInput').val() == ''){      //if input is empty, hide warning message
                $('#emailInputMsg').hide();
                return false;
            }
            $('#emailInputMsg').show();             //show warning message for inappropriate input
            return false;
        }
        $('#emailInput').removeClass('wrong');
        $('#emailInput').addClass('checked');
        $('#emailInputMsg').hide();
        return true;
    }

    $('#pswdInput').keyup(function(){               //check if password is valid when key is entered to password
        //check for password input
        if ($('#pswdInput').val() == ''){           //when input is empty, show warning message
            $('#pswdInput').addClass('wrong');
            $('#pswdInput').removeClass('checked');
            $('#pswdInputMsg').show();
        }
        else {                                      //when input is not empty, hide warning message
            $('#pswdInput').removeClass('wrong');
            $('#pswdInput').addClass('checked');
            $('#pswdInputMsg').hide();
        }
    });

    $('#pswdInput').focus(function(){               //same with above (keyup) function but it works when focused.
        if ($('#pswdInput').val() == ''){
            $('#pswdInput').addClass('wrong');
            $('#pswdInput').removeClass('checked');
            $('#pswdInputMsg').show();
        }
        else {
            $('#pswdInput').removeClass('wrong');
            $('#pswdInput').addClass('checked');
            $('#pswdInputMsg').hide();
        }
    });

    $('#loginBtn').click(function () {              //check whether input is appropriate or not when login Button is clicked.=
		if (emailInputValid() && $('#pswdInput').val() != ''){
			$('#loginPost').submit();
		}
		else alert('Please enter your account');

    });

    /*
    functions for typing nickName, email, password, password validate input.
    If unappropriate input comes, show warning message according to error reason.
    If appropriate input comes, delete red border.
    Check are done by regular expression.
    */

    $('#firstName').keyup(function(){
        if(!firstNameValid()){
            if (firstNameReason1()){}                                               //reason 1 (explained below)
            else if (firstNameReason2()){}                                          //reason 2 (explained below)
        }
        if ($('#firstName').val() == ''){
            $('#firstNameMsg').show();
            $('#firstNameMsg').text("Please enter your first name!");
        }
    });


    $('#email').keyup(function(){                                           //check email
        emailValid();
    });

    $('#pswd').keyup(function(){                                           //check password
        pswdValid();
    });

    $('#pswd_validate').keyup(function(){                                   //check 'confirm password'
        if ($('#pswd_validate').val() == ''){
            $('#pswd_validate').addClass('wrong');
            $('#pswd_validate').removeClass('checked');
            $('#pswdValidMsg').text("Please re-enter your password!");
        }
        else if ($('#pswd_validate').val() != $('#pswd').val()){
            $('#pswd_validate').addClass('wrong');
            $('#pswd_validate').removeClass('checked');
            $('#pswdValidMsg').text("Password does not match!");
        }
        else{
            $('#pswd_validate').removeClass('wrong');
            $('#pswd_validate').addClass('checked');
            $('#pswdValidMsg').hide();
        }
    });

    //when user try to sign up, check whether all inputs are appropriate. If they are all appropriate, signed up. Else cannot sign up.

    $('#signUpBtn').click(function(){
        if (firstNameValid() && pswdValid() && ($('#pswd_validate').val() == $('#pswd').val()) && emailValid()){
			$('#signupPost').submit();
        }
        else alert("You should complete sign up form.")
    });
});

function firstNameValid(){                //valid function for nickname input
    var regEx = RegExp(/^([A-Za-z][A-Za-z0-9]*)$/);
    if (!regEx.test($('#firstName').val())){
        $('#firstNameMsg').show();
        $('#firstName').addClass('wrong');
        $('#firstName').removeClass('checked');
        return false;
    }
    $('#firstName').removeClass('wrong');
    $('#firstName').addClass('checked');
    $('#firstNameMsg').hide();
    return true;
}

function firstNameReason1(){            //reason 1 : Nickname should start with English letter.
    var regEx = RegExp(/^([A-Za-z](.)*)$/);
    if (!regEx.test($('#firstName').val())){
        $('#firstNameMsg').text("Nickname should start with English letter.");
        return true;
    }
}

function firstNameReason2(){            //reason 2 : Nickname cannot contain special characters.
    var regEx = RegExp(/^[A-Za-z0-9]*$/);
    if (!regEx.test($('#firstName').val())){
        $('#firstNameMsg').text("Nickname cannot contain special characters!");
        return true;
    }
}


function emailValid(){
    var regEx = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;          //regular expression for email
    if (!regEx.test($('#email').val())){
        $('#email').addClass('wrong');
        $('#email').removeClass('checked');
        $('#emailMsg').text("Your email address is invalid!");
        if ($('#email').val() == ''){
            $('#emailMsg').text("Please enter your email!");
        }
        $('#emailMsg').show();
        return false;
    }
    $('#email').removeClass('wrong');
    $('#email').addClass('checked');
    $('#emailMsg').hide();
    return true;
}

function pswdValid(){
    var regEx = RegExp(/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/);                 //regular expression for password
    if (!regEx.test($('#pswd').val())){
        $('#pswd').addClass('wrong');
        $('#pswd').removeClass('checked');
        $('#pswdMsg').text("Requirement: At least 6 characters, one capital letter, one lowercase letter, at least one digit and one special character!");
        if ($('#pswd').val() == ''){
            $('#pswdMsg').text("Please enter your password!");
        }
        $('#pswdMsg').show();
        return false;
    }
    $('#pswd').removeClass('wrong');
    $('#pswd').addClass('checked');
    $('#pswdMsg').hide();
    return true;
}
