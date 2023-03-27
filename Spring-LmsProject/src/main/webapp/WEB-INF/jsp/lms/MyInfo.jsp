<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MYINFO</title>
</head>
<style>

body {				   
	  padding:1.5em;
	  background: #FFFFE6;
	  justify-content: center;
}

#content
{
	position : absolute;
	left : 37%;
	top : 20%;	
	text-align:center;
}

li{list-style:none; border:1px solid silver;padding:20px;}
ul{padding-left:0; text-align:center;}
#titleul{ float:left; background-color:white;}
#cont{float:left;background-color:white; width:400px;}
</style>
<body>


<div id='content'>

<h1>MYINFO</h1>
	<div id='cont_box'>
		<ul id="titleul">
		  	<li><span>아이디</span></li>	  
		 	<li><span>이메일</span></li>	  
		 	<li><pan>전화번호</span></li>
		</ul>  
	    <ul id="cont">
		  	<li><span>${stu.sid}</span></li>	  
		 	<li><span>${stu.email}</span></li>	  
		 	<li><pan>${stu.phone}</span></li>
		</ul>  
	</div>
   
	<a id="info_link" href="/lms/list"><button> LIST </button> </a>
   
				         
  </div>

		

</body>
</html>