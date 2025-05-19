<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Google login #2</title>
	<script src="https://accounts.google.com/gsi/client" async></script>
    <script src="https://cdn.jsdelivr.net/npm/jwt-decode@latest/build/jwt-decode.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <script>
    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "1057212021687-j292betvi7jtu2vuueer1agft6l4v9e0.apps.googleusercontent.com",
            callback: handleCredentialResponse
        });
        
        google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "signin", width: 250 }
        );
     	//google.accounts.id.prompt();
    }

    function handleCredentialResponse(response) {
        var profile = jwt_decode(response.credential);
        console.log("ID: " + profile.sub);
        console.log('Name: ' + profile.name);
        console.log("Image URL: " + profile.picture);
        console.log("Email: " + profile.email);    
		
        $('#login').css('display', 'none');
        $('#logout').css('display', 'block');
        $('#upick').attr('src', profile.picture);
        $('#uname').html('[ ' +profile.name + ' ]');
    }
    function signOut() {
        google.accounts.id.disableAutoSelect();
	    
        $('#login').css('display', 'block');
        $('#logout').css('display', 'none');
        $('#upick').attr('src', '');
        $('#uname').html('');
    }
    </script>
	</head>
	<body>
	
	<div id="login">
	    <div id="buttonDiv"></div> 
	</div>
	
	<div id="logout" style="display: none;">
	    <input type="button" onclick="signOut();" value="로그아웃" /><br>
	
	    <img id="upick" src=""><br>
	    <span id="uname"></span>
	</div>

	
	</body>
</html>