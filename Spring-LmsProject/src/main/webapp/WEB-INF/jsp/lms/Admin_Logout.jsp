<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>...</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script type="text/javascript">
function logout()
{
   
   var keyword = $('#logout').serialize();
      
      $.ajax({
         url:'adminlogin',
         method:'post',
         data: keyword,
         cache:false,
         dataType:'json',
         success:function(res){
            if(res.logout)
            { 
               alert("정상적으로 로그아웃 되었습니다");
               location.href="/lmslogin/adminlogin";
            }
            else
               {
                alert("에러");
               }
            },
         
         error:function(xhr,status,err){
            alert('에러:'+err);
         }
      });
   }
</script>
</head>
<body>
<div>
    <form id='logout'>
    <input type='hidden' name='cmd' value='adminLogout'>
   	 <span>관리자님 환영합니다</span>
   	 <button type='button' onclick='logout();'>로그아웃</button>
    </form>
    </div>
</body>
</html>