<%@page import="com.java.project.entity.Video"%>
<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>동영상 학습</title>
<style>
   header {padding: 1rem;}
   main{width:fit-content; margin: 0 auto;}
   section {width:fit-content; margin: 0 auto; display: inline-block; }
   aside {width:fit-content; display: inline-block; vertical-align: top; padding-left: 3rem;}
   textarea {width: 500px; height: 120px; resize: none;}
   button {all: unset; background-color: #3A8891; color: white; padding: 5px 20px; border-radius: 10px;}
   #endbtn {all: unset; background-color: #3A8891; color: white; padding: 5px 20px; border-radius: 10px; margin-left: 10rem;}
   button:hover { background: #17373a;}
   #endbtn:hover { background: #17373a;}
    .text {height: 10px; padding: 5px; color: #434242;}
    .block1{ position: relative; width: 40rem; max-width: 100%; margin: 4rem auto 3rem; padding: 0.5rem 1rem; line-height: 1.7; font-size: 1.1em; color: #222222;
           background: #f9f9f9; border-left: 6px solid #0E5E6F; &::before, &::after{ position: absolute; left: 0; font-size: 1rem; color: rgba(#0E5E6F, .6); }
   }
   .block2-title{ margin: 0; padding: 0 1rem 2rem; text-align: center; color: #222222; &::before, &::after{ content: ''; display: inline; width: 20px;
       height: 2px; vertical-align: middle; background: #1E4670;}
     &::before{ margin-right: 0.5rem; border-top-left-radius: 50%; border-bottom-left-radius: 50%;}
     &::after{ margin-left: 0.5rem; border-top-right-radius: 50%; border-bottom-right-radius: 50%;}
   }
   blockquote { margin: 20px 0px 1.75em 0px; position: relative; padding: 20px 55px;background: #F3EFE0; font: 16px "georgia";}
   blockquote:after {content: "\201C"; font-size: 76px; position: absolute; top: -15px;left: 10px; color: #0E5E6F;}
   .entry-content blockquote p { max-width: 100%;padding: 0;margin: 0 0 15px;font-size: 20px;}
   .separator--line {margin-top:2em;  border: 0; border-bottom:3px solid #434242; width: 0; animation: separator-width 1.5s ease-out forwards;}
   @keyframes separator-width { 0% { width: 0;} 100% { width: 85%;}}
   blockquote { color:grey; }
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
$(function(){
   $('#assign_form').css('display','none');
   $('#show').css('display','none');
});

window.addEventListener("beforeunload",(event) => {
		var end = $('#end').serialize();
		$.ajax({
		   url : '/lms/end_study',
		   method:'post',
		   data : end,
		   dataType : 'json',
		   cache : false,
		   success : function(res){
		   },
		   error : function(xhr,status,err){
		      alert(err);
		   }
		});
	}
);

if(${rv.pass}==0){
	const duration = '${video.duration}';
	const arr = duration.split(':');
	setTimeout(show_button, arr[0]*60000+arr[1]*1000);
}


function show_button(){
   $('#show').css('display','');
}

function showassign(){
   $('#assign_form').css('display','');
}

function submit_assign(){
    if (confirm('등록하시겠습니까?'))
      {
          var data = $('#assignment').serialize();
            $.ajax({
               url : '/lms/post',
               method:'post',
               data : data,
               dataType : 'json',
               cache : false,
               success : function(res){
                  alert(res.suc ? "제출 완료" : "제출 실패");
                  location.href="/lms/list";
               },
               error : function(xhr,status,err){
                  alert(err);
               }
            });
      }
}

function end() {
   if (confirm('학습을 종료하시겠습니까?'))
   {
      var end = $('#end').serialize();
         $.ajax({
            url : '/lms/end_study',
            method:'post',
            data : end,
            dataType : 'json',
            cache : false,
            success : function(res){
               alert(res.suc ? "학습종료" : "에러");
               location.href="/lms/list";
            },
            error : function(xhr,status,err){
               alert(err);
            }
         });
   }
}
</script>
</head>
<body bgcolor="F3EFE0">
<header>
   <form id="end">
      <input type="hidden" name="lvl_code" value="${video.lvl_code}">
      <input type="hidden" name="sid" value="${sid}">
      <button id='endbtn' type="button" onclick="end();">학습종료</button>
   </form>
   <h2 class="block2-title">${video.title }</h2>
   <hr class="separator separator--line" />
</header>
<main>
	<section>
	   <h4 class="text">학습시간 : ${video.duration }</h4>
	   <iframe width="600" height="400"
	      src="${video.fname }?autoplay=1&mute=1">
	   </iframe>
	</section>
	<aside>
	   <h3 class="block1">
	   		${video.description}
	   </h3>
	   <button id="show" type='button' onclick='showassign();'>실습과제 작성</button>
	   <div id="assign_form">
	      <form id="assignment">
	         <input type="hidden" name="lvl_code" value="${video.lvl_code}">
	         <input type="hidden" name="sid" value="${sid}">
	         <h4>${quiz}</h4>
	         <textarea rows="5" cols="40" name="answer"></textarea>
	         <blockquote>${rv.reply}</blockquote>
	         <br>
	         <button type="button" onclick="submit_assign();">제출</button>
	      </form>
	   </div>
	</aside>
</main>
<hr class="separator separator--line" />
</body>
</html>
   