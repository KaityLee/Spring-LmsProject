<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style>

.login .top li{list-style: none;}
@font-face {
    font-family: dotum;
    src: local('KoPubWorld돋움체 Regular'), url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumMedium.woff2') format('woff2');
}
body{margin: 0; background: #f5f5f5}

header { position: relative; display: flex; justify-content: space-between; align-items: center; background: rgba(115,104,93); width: 100%; height: 100px;  }
header .option div {width: 220px; height: 50px;}
.right_top ul  {list-style: none;  position: absolute; top: 10px; right: 100px;  }
.right_btm ul  {list-style: none;  position: absolute; top: 50px; right: 50px; }
.right_top ul li{float: left; padding-right: 10px; font-size: 15px; font-family: dotum; }
.right_btm ul li{float: left; padding-right: 10px; font-size: 15px; font-family: dotum; }
.right_top ul li a {color: white; }
.right_btm ul li a {color: white; }

session {display:flex; align-items: center;  justify-content: center; margin-top: 100px;}
.login .top {position: relative; width: 350px;}
.login .top li {padding: 0 0 9px;}
.login .top li label {display: inline-block; width:63px; font-size: 17px; color: #464646; font-family:dotum; font-weight: bold;}
.login .top li input[type='text'],
.login .top li input[type='password'] {width: 146px; height: 25px; border-color: #d9d9d9;}
.login .top a  {position: absolute; right: 0; top: 0;}
.login .top button  {position: absolute; right: 0; top: 0;}
.login .top li button {display:block; width:111px; height: 69px; background: rgba(115,104,93);font-size: 18px; color: #fff; line-height: 69px; text-align: center; font-weight: bold; border: 1px; border-color:#778f28;}
.login .top li.save {padding: 0 0 0 69px;}
.login .top li.save label {font-size: 13px; font-weight: normal; width: auto;}
.login .btm {padding: 5px 0 0 110px;}
.login .btm li{color: #383d41; font-size: 12px; font-family: dotum; }
.login .btm li a {margin: 0 0 0 10px; font-size: 12px; font-family: dotum; font-weight: bold; color: rgba(115,104,93); text-decoration:underline;}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function(){
    $('#txt1').val(getCookie('rememberid'));
});
     
function setCookie(name,value,exp)
{   
   var date = new Date(); 
    date.setTime(date.getTime() + exp*24*60*60*1000);
    document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
}

function getCookie(name) 
{
     var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
     return value? value[2] : null; 
 }



function Login()
{
   var id = $('#txt1').val();
   var pwd = $('#txt2').val();
   var chk = $('#chk1').val();
   
    if(chk=='on')
      {
       setCookie('rememberid',id,30);
      }
    
      $.ajax({
         url:'lmslogin',
         method:'post',
         data: {"id":id,"pwd":pwd,"cmd":"login_sequence"},
         cache:false,
         dataType:'json',
         success:function(res){
            if(res.logined)
            { 
               var aid= res.aid;
                alert(aid+"님, 환영합니다");
               location.href='lms?cmd=reportList';
            }
            else
               {
                alert("아이디, 비밀번호가 일치하지 않습니다");
                location.href='lmslogin?cmd=adminloginform';
               }
            },
         
         error:function(xhr,status,err){
            alert('에러:'+err);
         }
      });
   }
 
 
 
 
 
 
 function Login_Check()
 {
    var ID=$('input[name=id]').val();
    var PWD=$('input[name=pwd]').val();
    
    if(ID==''||PWD=='')
       {
        alert("로그인 정보를 입력해주세요");
        return false;
       }
    else
       {
         Login();
         return false;
       }
    return false;
 }

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
    
<session>
 <div class="login">
        <ul class="top">
       <form onsubmit="return false;">
       <input type="hidden" name="cmd" value="login_sequence">
        <li> <label for='txt1'> 아이디 </label> <input type="text"  name="id" id="txt1"></li>
        <li> <label for='txt2'> 비밀번호 </label> <input type="password" name="pwd" id="txt2"></li>
        <li><button onclick="Login_Check();" >로그인</button></li>
        </form> 
        <li class="save"><input type="checkbox" id="chk1" checked="checked"><label for="chk1">ID 저장</label></li>    
        </ul>
        <ul class="btm">
         <li>회원가입 <a href="lmslogin?cmd=register">선생님계정</a></li>
         <li>아이디를 잊으셨나요?<a href="">아이디 찾기</a></li>
         <li>비밀번호를 잊으셨나요?<a href="">비밀번호 찾기</a></li>
        </ul>
    </div>

    </session>
</body>
</html>