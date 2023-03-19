<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HOME</title>
</head>

<style type="text/css">

 html,
      body {
        width: 100%;
        height: 100%;
        padding : 0;
        margin : 0;
      }

#login{
	width: 45%;
	height: 100%;
	background:linear-gradient(to right, #8F8F8F , black);
	float: right;
	display:flex;
	justify-content : center;
	align-items : center;
	color:white;
	font-size : 50px;
	
}

#learning{
	width: 45%;
	height:  100%;
	background: linear-gradient(to right, #002b5b , #8fe3cf);
	float: left;
	display:flex;
	justify-content : center;
	align-items : center;
	color:white;
	font-size : 50px;
}
#home{
	width: 10%;
	height:  100%;
	background-color: white;
	color:black;
	float: left;
	display:flex;
	justify-content :center;
	align-items : center;
	
	
}

a {
 	 text-decoration: none; color: white;
}


</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<body>

	
	<a href='lmslogin?cmd=loginform'>
		<div id="login">
			<h1>LOGIN</h1>
		</div>
	</a>
	
	
	<a href='lms?cmd=SubjectList'>
		<div id="learning">
			<h1>LEARNING</h1>
			</div>
	</a>	
	
	
	<div id="home">
		<h1>HOME</h1>
	</div>

</body>
</html>