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
    td, th {  padding: 1em;  vertical-align: middle;}  
    td {  border-bottom: 1px solid rgba(0,0,0,.1); background: #fff;}
   a { color: #73685d;} 
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
        
            <img id='left'src="/JavaWeb/images/badge-best-campus-common.png">
            <h1><img id='center'src="/JavaWeb/images/logo-new2208.png"></h1>
        <div class="option">
            <div class="right_top">
             <ul>
                <li><a href="/ezen/campus/campus_info.asp">캠퍼스위치</a></li>
                <li><a href="/ezen/license/?scc=1">자격증소개</a></li>
                <li><a href="/ezen/community/review.asp">수강후기</a></li>
             </ul>
             </div>
             <div class="right_btm">
             <ul>
                <li><a href="/ezen/club/" class="link" target="_blank">강사클럽</a></li>
                <li><a href="/ezen/community/book_list.asp" class="link" target="_blank">교재</a></li>
                <li><a href="https://edu.ezenac.co.kr/" class="link" target="_blank">온라인에듀</a></li>
                <li><a href="//member.ezenac.co.kr/ezen/member/member_join.asp" class="link sign">회원가입</a></li>
                <li><a href="//member.ezenac.co.kr/ezen/member/member_login.asp" class="link login">로그인</a></li>            
             </ul>
            </div>
        </div>
        
    </header>
<main>
<p>
<%@ include file='/WEB-INF/jsp/lms/Admin_Login_inc.jsp' %>
</p>
<h3> 채점목록 </h3>
<table>
<thead>
<tr><th>번호</th><th>과목</th><th>아이디</th><th>날짜</th><th>통과여부</th></tr>
</thead>
<tbody>
   <c:forEach var="map" items="${list}">
   	<c:set var="report" value="${map.report}"/>
      <tr>
         <td>${report.num}</td>
         <td>
         <c:set var="lvl_code" value="${report.lvl_code}"/>
         ${map.slevel.subject_name}
         </td>
         <td><a id='tag' href="lms/detail&num=${report.num}">${report.sid}</a></td>
         <td>${report.studydate}</td>
         <td>
         <c:set var="pass" value="${report.pass}"/>
         <c:set var="reply" value="${report.reply}"/>
         <c:if test="${pass==1}">합격</c:if>
         <c:if test="${pass==0&&reply==null}">미채점</c:if>
         <c:if test="${pass==0&&reply!=null}"><p>불합격</p></c:if>
         </td>
      </tr>
   </c:forEach>
</tbody>
</table>
<p>
<div id='listNum'>
   <c:forEach begin="1" end="${list[0].ttlpage}" var="var">
      <a id="${var}" href="lms/list&page=${var}" 
      style="text-decoration:none">[${var}]</a>
   </c:forEach>
</div>
</p>
</main>
</body>
</html>