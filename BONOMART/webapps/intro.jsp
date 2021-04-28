<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/intro.css">
</head>
<body>
    <div id="wrap" align="center">
        
            <p id="welcome">
                BONOMART
                <svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
                    <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"/>
                </svg> 
            </p>
            <div id="loginArea">
                <form action="" method="POST" id="loginForm">
                    <table id="login">
                        <tr>
                            <td><label class="text">ID &nbsp;</label></td>
                            <td><input class="form-control form-control-sm" type="text" name="userId"></td>
                        </tr>
                        <tr>
                            <td><label class="text">PW &nbsp;</label></td>
                            <td><input class="form-control form-control-sm" type="password" name="userPwd"></td>
                        </tr>
                    </table>


                    
                  
                    
                    <div class="btns" align="center">
                        <button id="memberJoinBtn" onclick="memberJoin()">JOIN</button> &nbsp;
                        <button id="loginBtn">LOGIN</button> 
                    </div>
                </form>
            </div>
    </div>
    
    <script>
    
    function memberJoin(){
		location.href="/bono/views/member/memberJoin.jsp";
	}
    </script>
</body>
</html>