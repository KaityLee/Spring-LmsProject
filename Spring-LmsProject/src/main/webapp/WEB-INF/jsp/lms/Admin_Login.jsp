<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<title></title>
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
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">

function Login()
{
	 var date = $('#container').serialize();
     
      $.ajax({
         url:'adminlogin',
         method:'post',
         data: date,
         cache:false,
         dataType:'json',
         success:function(res){
        	 alert(res.suc? "환영합니다" : "다시 로그인 해주세요" );
        	 if(res.suc)
            { 
               location.href='/admin/list';
            }
        	
          },
         
         error:function(xhr,status,err){
            alert('에러:'+err);
         }
      });
   }
 
 
</script>
<body>
<h3>관리자로그인</h3>
<form id="container">
<session>
 <div class="login">
        <ul class="top">
       <input type="hidden" name="cmd" value="adminlogin">
        <li> <label for='aid'> 아이디 </label> 
        <input type="text"  name="aid" id="aid"></li>
        <li> <label for='pwd'> 비밀번호 </label> 
        <input type="password" name="pwd" id="pwd"></li>
        <li><a onclick="Login();" >로그인</a></li>
        </ul>
        
        <ul class="btm">
         <li>회원가입 <a href="/lmslogin/adminregister">회원가입</a></li>
         <li>비밀번호를 잊으셨나요?<a href="/lmslogin/adminfind">비밀번호 찾기</a></li>
        </ul>
    </div>
    </session>
    </form>
</body>
</html>