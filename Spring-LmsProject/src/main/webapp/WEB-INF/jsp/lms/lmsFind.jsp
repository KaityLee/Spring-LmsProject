<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8"> 
<title>ID 찾기</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<style>
  * { margin: 0px; padding: 0px; text-decoration: none; font-family:sans-serif;}

body { background-image:#34495e;}

.findForm { position:absolute; width:400px; height:400px; padding: 30px, 20px; background-color:#FFFFFF;
 text-align:center; top:40%; left:50%; transform: translate(-50%,-50%); border-radius: 15px;}

.findForm h2 { text-align: center;margin: 30px;}

.textForm { border-bottom: 2px solid #adadad; margin: 30px; padding: 10px 10px;}

.sid { width: 100%; border:none; outline:none; color: #636e72; font-size:16px; height:25px; background: none;}

.email { width: 100%; border:none; outline:none; color: #636e72; font-size:16px; height:25px; background: none;}


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

function find()
{
   
   var date = $("#findForm").serialize();
   
   
   $.ajax({
      url:'login',
      method:'post',
      data:date,
      dataType :'json',
      cache:false,
      success:function(res)
      {
               alert(res.finded ? "찾으시는 회원의 비밀번호는:" + res.pwd  : "일치하는 정보가 없습니다."  );
                  location.href="lms?cmd=LmsLoginForm";
         
         
      },   
         error : function(xhr, status, err){
            alert(err);
      }
      
   });
   
}
</script>
<body>
<main>
 <form class="findForm" id="findForm">
                                                                                               
      <h2>ID로 회원 찾기</h2>
       <input type="hidden" name="cmd" value="find">
      
      <div class="textForm">
        <input id="sid" name="sid" type="text" class="sid" placeholder="아이디">
      </div>
      

        <div class="textForm">
        <input id="email" name="email" type="text" class="email" placeholder="이메일">
      </div>
   
      <button type="button" class="btn" onclick="find();">F I N D</button>
      <button type="button" class="btn2" onclick='location.href="lms?cmd=LmsLoginForm"'>H O M E</button>
    </form>
    
    
</main>

</body>
</html>
