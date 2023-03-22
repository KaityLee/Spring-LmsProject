<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<title></title>
</head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<style>
  * { margin: 0px; padding: 0px; text-decoration: none; font-family:sans-serif;}

body { background-image:#34495e; background-color : #FFFFF1;} 

.joinForm { position:absolute; width:400px; height:400px; padding: 30px, 20px; background-color: #FFFFF1;
 text-align:center; top:40%; left:50%; transform: translate(-50%,-50%); border-radius: 15px;}

.joinForm h2 { text-align: center;margin: 30px;}

.textForm { border-bottom: 2px solid #adadad; margin: 30px; padding: 10px 10px;}

.h4 {color: #f62b33; font-size:8px; height:25px; background: none; }

.sid { width: 100%; border:none; outline:none; color: #636e72; font-size:16px; height:25px; background: none;}

.pwd { width: 100%; border:none; outline:none; color: #636e72; font-size:16px; height:25px; background: none;}

.email { width: 100%; border:none; outline:none; color: #636e72; font-size:16px; height:25px; background: none;}


.phone { width: 100%; border:none; outline:none; color: #636e72; font-size:16px; height:25px; background: none;
}

.btn { position:relative; left:40%; transform: translateX(-50%); margin-bottom: 40px; width:80%; height:40px; background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
 background-position: left; background-size: 200%; color:white; font-weight: bold; border:none; cursor:pointer; transition: 0.4s; display:inline;
}
.btn2 { position:relative; left:40%; transform: translateX(-50%); margin-bottom: 40px; width:80%; height:40px; background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
 background-position: left; background-size: 200%; color:white; font-weight: bold; border:none; cursor:pointer; transition: 0.4s; display:inline; text-align: center;
}

.btn:hover {
  background-position: right;
  }
.btn2:hover{
  background-position: right;
  
}
</style>
<script type="text/javascript">
function searchFunction()
{
   var pw = $('#pwd').val();
   var pw2 = $('#pwd2').val();
   
    if(pw != pw2)
    {
       $('#checkMessage').html("비밀번호가 일치하지 않습니다.");
    }
     else 
     {
       $('#checkMessage').html("");
     }
  
}  
function join()
{
	var pwd = $('#pwd').val();
    var aid = $('#aid').val();
    var email = $('#email').val();
    var phone = $('#phone').val();
    
    var num = pwd.search(/[0-9]/g);
    var eng = pwd.search(/[a-z]/ig);
    
   
    console.log(pwd +','+ aid +','+ email +','+ phone +','+ num +','+ eng);
    
    if(aid=="" || pwd=="" || email=="" || phone=="" )
      {
         alert('모든 항목은 필수로 입력되어야 합니다.');
         return false;
      }
    
    if(pwd.length < 8 || pwd.length > 20)
      {

       alert("비밀번호 8자리 ~ 20자리 이내로 입력해주세요.");
       return false;
      }
    else if(pwd.search(/\s/) != -1)
      {
      alert("비밀번호는 공백 없이 입력해주세요.");
       return false;
      }
    else if(num < 0 || eng < 0 )
       {
        alert("영문,숫자를 혼합하여 입력해주세요.");
        return false;
      }
	
	var date = $('#adjoinForm').serialize();
		$.ajax({
			url:'adminregister',
			method:'post',
			data: date,
			cache:false,
			dataType:'json',
			success:function(res){
				 alert(res.save ?"가입되었습니다." : "가입에 실패하였습니다.");
				if(res.save)
				{ 
					location.href="/lmslogin/adminlogin";
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
<body>
<header>
        
        <h1><img id='center'src="/JavaWeb/images/logo-new2208.png"></h1>  
    
</header>

 <main>
    <form class="adjoinForm" id="adjoinForm">
                                                                                               
      <h2>회원가입</h2>
       <input type="hidden" name="cmd" value="join">
      
      <div class="textForm">
        <input id="aid" name="aid" type="text" class="aid" placeholder="아이디">
      </div>
      
      <div class="textForm">
        <input id="pwd" name="pwd" type="password" class="pwd" placeholder="비밀번호" >
      </div>
      
        <div class="textForm">
        <input id="pwd2" name="pwd2" type="password" class="pwd" placeholder="비밀번호 확인" onkeyup="searchFunction();">
      </div>
      <span id="checkMessage" style="color:red;font-weight:bold"></span>
   
      
      <div class="textForm">
        <input id="phone" name="phone" type="text" class="phone" placeholder="전화번호">
      </div>
      
        <div class="textForm">
        <input id="email" name="email" type="text" class="email" placeholder="이메일">
      </div>
   
      <button type="button" class="btn" onclick="join();">J O I N</button>
      <button type="button" class="btn2" onclick='location.href="/lmslogin/adminlogin"'>H O M E</button>
    </form>
 </main>   

</body>
</html>