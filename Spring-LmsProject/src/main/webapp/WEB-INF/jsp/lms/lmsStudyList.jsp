<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SUBJECTLIST</title>
</head>
<style>

body {
  padding:1.5em;
  background: #FFFFE6;
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  
   background: linear-gradient( to right, #002b5b , #8fe3cf );
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: linear-gradient( to right, #f5e8c7 , #ecccb2 );
  color : #747474;
}

a {
  color: #73685d;
}
  
  h1{
		color:#002b5b ;
	}	  
 
button{
  background:#02778B;
  color:#FFF2E6;
  border:none;
  position:relative;
  height:25px;
  font-size:1.3em;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#14899D;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #14899D;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
  
  img{width:fit-content; margin:0 auto; display:none;} /*display:inline-block */
	
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;    
  }
  
  tr {
    display: inline-block;
    vertical-align: top;  
  }
  
  th {
    border-bottom: 1px solid #a39485;    
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;   
  }
  
 }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">


function lvCheck(lvl_code) //학습하기버튼 (이곳에서 lvl_code와 pass여부를 따져줍니다.)
{	
	alert('현재 레벨 : ' + ${map.rv.lvl_code} +"\n" +'클릭한 수업 레벨 : ' + lvl_code);
	
		if(${map.rv.lvl_code}==0) 
		{
			alert('로그인을 하셔야 이용 가능한 서비스입니다.');
		}
		else if(lvl_code<=${map.rv.lvl_code})  //단계가 낮은단계라면.
		{		 	
		 	location.href='/lms/study?lvl_code='+lvl_code;		 	
		}
	 	else if(lvl_code==${map.rv.lvl_code}+1)
		 {
		 	if(${map.rv.pass}>0)
		 	{
		 		  location.href='/lms/study?lvl_code='+lvl_code;
		 	}
		 	else
		 	{
		 		alert('전 학습을 패스하셔야 합니다.');	
		 	}	
		 }
	  	else
		 {
		 	alert('전 학습을 패스하셔야 합니다.');		 	
		 }
	 
}

function jackinthebox()
{
	$('#img1').css('display','inline-block');
}
function jackinthebox1()
{
	$('#img1').css('display','none');
}


setInterval(jackinthebox,4000);
setInterval(jackinthebox1,4050);

</script>



<body>


<%@include file="/WEB-INF/jsp/lms/lmsStudent.jsp"%>  


<div align='center'>
<h1>SUBJECTLIST</h1>    

<table>
    <thead>
    
    <tr>
    	<th>CHAPTER1</th>
    </tr>
    
    <tr>
        <th>SUBJECT</th>
        <th>DESCRIPTION</th>
        <th>STUDY</th>
        <th>DURATION</th>
    </tr>    
    </thead>
    
    <tbody>   	
	   
	  <c:forEach var='m' begin='0' end='2' items='${list}'>	       	          	
		    <tr>
		        <td><label>${m.slv.subject_name}</label></td> 
		        <td> <label>${m.slv.description}</label></td>
		        <td><button type='button' onclick='lvCheck(${m.slv.lvl_code});'>GO LEARNING</button></td>			         
			   	<td> <label>${m.dur}</label></td>				   		    
		    </tr>	   	 
		 </c:forEach> 
		
 <thead>
 	<tr>
        <th>CHAPTER2</th>
    </tr>
    <tr>
        <th>SUBJECT</th>
        <th>DESCRIPTION</th>
        <th>STUDY</th>
        <th>DURATION</th>
    </tr>
    </thead>
	    <tbody>
	    <c:forEach var='m' begin='3' end='5' items='${list}'>	       	          	
		    <tr>
		        <td><label>${m.slv.subject_name}</label></td> 
		        <td> <label>${m.slv.description}</label></td>
		        <td><button type='button' onclick='lvCheck(${m.slv.lvl_code});'>GO LEARNING</button></td>			         
			   	<td> <label>${m.dur}</label></td>				   		    
		    </tr>	   	 
		 </c:forEach>  
		
    	 	 	
	
		
</body>
</html>