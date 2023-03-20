<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>...</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
   var reply = '${report.reply}';
   var pass = ${report.pass};
   if(reply!='')
   {
      $('#pass').css('display','none');
      $('#reply').css('display','none');
      $('#replyblank').append('<table><tr><td>제출된 답변</td></tr><tr><td colspan="8">${report.reply}</td></tr></table>');   
   }
   else if(pass==1)
   {
      $('#pass').css('display','none');
      $('#reply').css('display','none');      
   }
})
function pass()
{      
   if(!confirm("문제를 통과하였습니까?")) return;
      var num = ${report.num};
      
      $.ajax({
         url :'lms',   
         method : 'post',
         data : {"num":num, "cmd":"reportPass"},              
         cache : false,
         dataType : 'json',         
           success : function(res)
           {                                                                 
              alert(res.pass?'전송되었습니다' : '전송 실패');
              if(res.pass)
              {
                  location.href='lms?cmd=reportList';
              }
         },
         error : function(xhr,status,err){
            alert('에러'+err);
         }
      });    
}

function replyForm()
{
   $('#pass').css('display','none');
   $('#reply').css('display','none');
   $('#replyblank').append('<p><div style="color:white">지도내용</div></p><p><textarea id="replyForm"></textarea>');
   $('#replyButton').append('<button onclick="reply();">제출</button>');   
}

function reply()
{
   if(!confirm("답변을 제출하겠습니까?")) return;
   var reply = $('#replyForm').val();
   console.log("reply"+reply);
   var num = ${report.num};
   
   $.ajax({
      url :'lms',   
      method : 'post',
      data : {"reply":reply,"num":num, "cmd":"reportReply"},              
      cache : false,
      dataType : 'json',         
        success : function(res)
        {                                                                 
           alert(res.reply?'전송되었습니다' : '전송 실패');
           if(res.reply)
           {
               location.href='lms?cmd=reportList';
           }
      },
      error : function(xhr,status,err){
         alert('에러'+err);
      }
   });   
}
</script>
<style type="text/css">
   body {  padding:1.5em;  background: #f5f5f5}
   table {  border: 1px #a39485 solid; 
     box-shadow: 0 2px 5px rgba(0,0,0,.25);  width: 100%;
     border-collapse: collapse;  border-radius: 5px;
     overflow: hidden;}
   #passrsl,#num,#sid,#lvl_code,#studydate,#question,#answer{background:#f5f5f5;}
   td{padding:0.5em;border-bottom: 1px solid rgba(0,0,0,.1);
      border: 1px #a39485 solid; background: #fff;}
   a { color: #73685d;} 
   h3 { font-size:30px ;width:fit-content; margin:0 auto; padding-bottom:1em; color:black; }
   
  #container { padding:1em; width:70%; margin:0 auto;
   background: #73685d; border: 1px #a39485 solid;  font-size: .9em;
     box-shadow: 0 2px 5px rgba(0,0,0,.25);  ;
     border-collapse: collapse;  border-radius: 5px;
     overflow: hidden;}
    button { width:fit-content; margin: 0 auto; button-color:#f5f5f5; }
    textarea {
    width: 100%;
    height: 6.25em;
    border: none;
    resize: none;
  }
   #replyform {width:fit_content;resize:none;}
</style>
</head>
<body>
<h3>${report.sid} 답안</h3>
<div id = "container">
<table>
<tbody>
<tr>
   <td id ='num'>번호</td>      <td>${report.num}</td>
   <td id='sid'>작성자</td>   <td colspan="3">${report.sid}</td>
   <td id ='lvl_code'>과목</td>      <td>
               <c:set var="lvl_code" value="${report.lvl_code}"/>
                  ${slevel[lvl_code]}
               </td>
   <td id ='studydate'>날짜</td>      <td>${report.studydate}</td>
   <td id='passrsl'>통과여부</td>   <td><c:set var="pass" value="${report.pass}"/>
               <c:set var="reply" value="${report.reply}"/>
            <c:if test="${pass==1}">합격</c:if>
            <c:if test="${pass==0&&reply==null}">미채점</c:if>
            <c:if test="${pass==0&&reply!=null}"><p>불합격</p></c:if>
            </td>
</tr>
<tr>
   <td  id='question' colspan="2">문제</td>   <td colspan="10">
         <c:set var="lvl_code" value="${report.lvl_code}"/>
          ${quiz[lvl_code]}
   </td>
</tr>
<tr>
   <td id ='answer' colspan="2">제출답안</td>   <td colspan="10" >
   <div style="white-space:pre">${report.answer}</div>
   </td>
</tr>
</tbody>
</table>
<p>
<div id='btn'>
<button id='pass' onclick="pass();">합격</button>
<button id='reply' onclick="replyForm();">불합격</a></button>
</div>
<div id='replyblank'></div>

<div id='replyButton'></div>
</div>
</body>
</html>