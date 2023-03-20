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

.king
{
	position : absolute;
	left : 43%;
	top : 20%;	
}

</style>
<body>


<div class='king'>

<h1>MYINFO</h1>

   <div class='first'>      
  		 <label > I D </label>   ${sv.sid}
   </div>
   
 	<div class='second'>  
 	  	<label> EMAIL </label>${sv.email}
    </div>
   
	<div class='third'>  
 	 	 <label> PHONE </label>${sv.phone}
   </div>
   
  <div class='fourth'>  
  	 <label> MAX_LV </label>${rv.lvl_code}
   </div>
   
   <div class='fifth'>  
   <label> REPORT </label><c:set var="pass" value="${rv.pass}"/>        
								         <c:if test="${pass==1}">제출한 과제가 합격되었습니다.</c:if>
								         <c:if test="${pass==0}">해당과목 과제 정보가 없습니다.</c:if>
								         
  </div>

	<a id="info_link" href="lms?cmd=SubjectList"> LIST </a>

		

</body>
</html>