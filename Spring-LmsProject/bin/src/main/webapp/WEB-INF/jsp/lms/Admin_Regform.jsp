<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style>
body{margin: 0;}
@font-face {
    font-family: dotum;
    src: local('KoPubWorld돋움체 Regular'), url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumMedium.woff2') format('woff2');
}

header { position: relative; display: flex; justify-content: space-between; align-items: center; background: rgba(39,39,46); width: 100%; height: 100px;  }
header .option div {width: 220px; height: 50px;}
.right_top ul  {list-style: none;  position: absolute; top: 10px; right: 100px;  }
.right_btm ul  {list-style: none;  position: absolute; top: 50px; right: 50px; }
.right_top ul li{float: left; padding-right: 10px; font-size: 15px; font-family: dotum; }
.right_btm ul li{float: left; padding-right: 10px; font-size: 15px; font-family: dotum; }
.right_top ul li a {color: white; }
.right_btm ul li a {color: white; }

session {position:relative;  display:flex; align-items: center;  justify-content: center; margin-top: 100px;}

.logo {width: 250px; height: 80px; }
session div.regform {border: 3px solid; border-color: black;padding: 40px;}
session div.regform div.aid {padding: 20px;}
session div.regform div.pwd {padding: 20px;}
session div.regform div.phone {padding: 20px;}
session div.regform div.email {padding: 20px;}
session div.regform div.aid .aaid {width: 200px; height: 30px; font-size: 20px; font-family: dotum; border-radius: 10px;}
session div.regform div.pwd .ppwd {width: 200px; height: 30px; font-size: 20px; font-family: dotum; border-radius: 10px;}
session div.regform div.phone .pphone {width: 200px; height: 30px; font-size: 20px; font-family: dotum; border-radius: 10px;}
session div.regform div.email .eemail {width: 200px; height: 30px; font-size: 20px; font-family: dotum; border-radius: 10px;}
session div.regform button.submit {width: 80px; position: relative; left: 80px; }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
    function regform()
{
	
	var keyword = $('#leg').serialize();
		$.ajax({
			url:'lmslogin',
			method:'post',
			data: keyword,
			cache:false,
			dataType:'json',
			success:function(res){
				if(res.register)
				{ 
				  
				    alert("선생님 정보가 등록되었습니다! ");
					location.href='lmslogin?cmd=adminloginform';
				}
				else
					{
					 alert("등록정보를 확인해주세요");
					}
				},
			
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	}
</script>
</head>
<body></body>
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
    <form id="leg">
    <input type='hidden' name="cmd" value="regseq"> 
    <div class="regform">
        <div>
            <img class="logo" src="/JavaWeb/images/admin_image1.png"></img>
        </div>
        <div class="aid"><input class= 'aaid' name='aid'type='text'placeholder='ID'></div>
        <div class="pwd"><input class= 'ppwd'name='pwd'type='password'placeholder="PWD"></div>
        <div class="phone"><input class='pphone' name='phone' type='text'placeholder="PHONE"></div>
        <div class="email"><input class='eemail' name='email' type='text' placeholder="EMAIL"></div>
        <button type="button" class="submit" onclick="regform();" >작성완료</button>
    </div>
    </form>
</session>
</body>
</html>