<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채점목록</title>
<style type="text/css">
body{margin:0; background: #f5f5f5;}
   header { position: relative; display: flex; 
   justify-content: space-between; align-items: center;
    background: rgba(115,104,93); width: 100%; height: 100px;  }
header .option div {width: 220px; height: 50px;}
.right_top ul  {list-style: none;  position: absolute; top: 10px; right: 100px;  }
.right_btm ul  {list-style: none;  position: absolute; top: 50px; right: 50px; }
.right_top ul li{float: left; padding-right: 10px; font-size: 15px; font-family: dotum; }
.right_btm ul li{float: left; padding-right: 10px; font-size: 15px; font-family: dotum; }
.right_top ul li a {color: white; }
.right_btm ul li a {color: white; }
   
   table {  border: 1px #a39485 solid;  font-size: .9em;
     box-shadow: 0 2px 5px rgba(0,0,0,.25);  width: 100%;
     border-collapse: collapse;  border-radius: 5px;
     overflow: hidden;}
   th {  text-align: left;}  
   thead {  font-weight: bold;  color: #fff; background: #73685d;}  
   tr.row{background-color: #fff;}
    tr.row:hover{ background-color:  #f5f5f5;}
    td, th {  padding: 1em;  vertical-align: middle;}  
    td {  border-bottom: 1px solid rgba(0,0,0,.1); }
   a { color: black;} 
   a:hover{color:#a39485;}
    tbody {    overflow-x: auto; overflow-y: hidden;
    position: relative;    white-space: nowrap;}
   main{width:70% ; margin:0 auto;}
   div#listNum {width:fit-content ;margin:0 auto;}
   h3 { font-size:30px ;width:fit-content; margin:0 auto; padding-bottom:1em; color:black; }
   a#tag {text-decoration: none;}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
   var aid = '${aid}';
   
   if(aid=='')
   {
      alert('로그인이 필요합니다');
      location.href = '/lmslogin/adminlogin';
   }
   
   //pgColor();
})
<%--
function pgColor()
{
   $('a#${page}').css('text-decoration','underline');
   $('a#${page}').css('color','red');
}
--%>
</script>

</head>
<body>
<header>
        
            <img id='left'src="/images/badge-best-campus-common.png">
            <h1><img id='center'src="/images/logo-new2208.png"></h1>
        <div class="option">
            <div class="right_top">
            
             </div>
             <div class="right_btm">
             
            </div>
        </div>
        
    </header>
<main>
<p>
<%@ include file='/WEB-INF/jsp/lms/Admin_Logout.jsp' %>
</p>
<h3> 채점목록 </h3>
<table>
<thead>
<tr><th>번호</th><th>과목</th><th>아이디</th><th>날짜</th><th>통과여부</th></tr>
</thead>
<tbody>
   <c:forEach var="map" items="${list}">
   	<c:set var="report" value="${map.report}"/>
      <tr class="row">
         <td><a id='tag' href="/admin/detail?num=${report.num}">${report.num}</a></td>
         <td><a id='tag' href="/admin/detail?num=${report.num}">
         <c:set var="lvl_code" value="${report.lvl_code}"/>
         ${map.slevel.subject_name}</a>
         </td>
         <td><a id='tag' href="/admin/detail?num=${report.num}">${report.sid}</a></td>
         <td><a id='tag' href="/admin/detail?num=${report.num}">${report.studydate}</a></td>
         <td><a id='tag' href="/admin/detail?num=${report.num}">
         <c:set var="pass" value="${report.pass}"/>
         <c:set var="reply" value="${report.reply}"/>
         <c:if test="${pass==1}">합격</c:if>
         <c:if test="${pass==0&&reply==null}">미채점</c:if>
         <c:if test="${pass==0&&reply!=null}">불합격</c:if>
         </a></td>
      </tr>
   </c:forEach>
</tbody>
</table>
<p>
<div id='listNum'>
   <c:forEach begin="1" end="${list[0].ttlpage}" var="var">
      <a id="${var}" href="/admin/list?page=${var}" 
      style="text-decoration:none">[${var}]</a>
   </c:forEach>
</div>
</p>
</main>
</body>
</html>