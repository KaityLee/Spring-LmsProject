<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<style>
   a#logout_link {margin-left:0.4em; font-size: 14px; color:white;}
   a#info_link {margin-left:0.4em; font-size: 14px; color:white;}		
   div#container{ width:100%; height:30px; text-align:left; font-size: 17px;
   				color:white; background:linear-gradient( to right, #002b5b , #8fe3cf );
   				 padding: 0.5em .5em; vertical-align: middle; }
  		 
   				 
   
</style>
<script>
	$(function(){
		$('#login_link').css('display','none');
		$('#logout_link').css('display','');
		$('#info_link').css('display','')
		var sid = '${sid}'
		if(sid=='')
			{
				$('#logout_link').css('display','none');
				$('#login_link').css('display','');
				$('#info_link').css('display','none');
			}
	})
</script>
<div id='container'><label>ID: ${sid} /</label><label> ${map.nowlevel} </label> <label> ${map.passinfo} </label>
   <a id="logout_link" href="/lmslogin/logout"> ★LOGOUT★ </a>
   <a id="login_link" href="/lmslogin/login"> ★LOGIN★ </a>
   <a id="info_link" href="/lms/myinfo"> ☆MYINFO☆ </a>
</div>