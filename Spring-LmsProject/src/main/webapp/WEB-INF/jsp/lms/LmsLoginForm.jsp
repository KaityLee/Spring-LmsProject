<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인 화면</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<style>
  
  body {background-color : #FFFFF1; } 
  
.login .top li{list-style: none;}
@font-face {
    font-family: dotum;
    src: local('KoPubWorld돋움체 Regular'), url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumMedium.woff2') format('woff2');
}
h3 {display:flex; align-items: center;  justify-content: center; margin-top :180px;}
session {display:flex; align-items: center;  justify-content: center; margin-top :10px; }
.login .top {position: relative; width: 350px;}
.login .top li {padding: 0 0 9px;}
.login .top li label {display: inline-block; width:150px; font-size: 17px; color: #464646; font-family:dotum; font-weight: bold;}
.login .top li input[type='text'],
.login .top li input[type='password'] {width: 150px; height: 20px; border-color: #d9d9d9;}
.login .top a  {position: absolute; right: -80px; top: 0;}
.login .top li a {display:block; width:100px; height: 60px; background:linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);font-size: 18px; color: #fff; line-height: 63px; text-align: center; font-weight: bold; border: 1px; border-color:#778f28;}
.login .top li.save {padding: 0 0 0 69px;}
.login .top li.save label {font-size: 13px; font-weight: normal; width: auto;}
.login .btm {padding: 5px 0 0 110px;}
.login .btm li{color: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec); font-size: 12px; font-family: dotum; }
.login .btm li a {margin: 0 0 0 10px; font-size: 12px; font-family: dotum; font-weight: bold; color:#829c2c; text-decoration:underline;}
}
</style>
 </head>
<script>

function login()
{
   var date = $('#container').serialize();
   
   $.ajax({
      url:'login',
      method:'post',
      data:date,
      dataType :'json',
      cache:false,
      success:function(res)
      {
         alert(res.suc? "환영합니다" : "다시 로그인 해주세요" );
         if(res.suc)
         {  
            location.href="/lms/home";
         }
       
      },   
         error : function(xhr, status, err){
            alert(err);
      }
      
   });
   
   
}
</script>
<body>
<h3>로그인</h3>
<div>
 <form id= "container" >
 <session>
 <div class="login">
       <ul class ="top">
          <input type="hidden" name="cmd" value="login">
         <li> <label for='sid'>아이디(ID):</label>
          <input id ='sid' type='text' name='sid' placeholder='ID를 입력해주세요' required ></li>
          
          <li><label for='pwd'>비밀번호(pwd):</label>
          <input id='pwd' type='password' name='pwd' placeholder='PWD를 입력해주세요' required></li>
         
         <li><a onclick="login();">로그인</a></li>
            </ul>
            
           <ul class="btm">
            <li>비밀번호를 잊으셨나요?<a href="">비밀번호 찾기</a></li>
            <li>회원가입하기<a href='/lmslogin/register'>회원가입</a></li>
           </ul>
       </div>
  </session>
      </form>

</div>
</body>
</html>