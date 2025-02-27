<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function getPwd(form)
    {
    	var userid=pform.userid.value;
    	var name=pform.name.value;
    	var email=pform.email.value;
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		document.getElementById("pform").style.visibility="hidden";
    		document.getElementById("pform").userid.value="";
    		document.getElementById("pform").name.value="";
    		document.getElementById("pform").email.value="";
    		document.getElementById("view").innerText="비밀번호 : "+chk.responseText;
    	}
    	chk.open("get", "/login/getPwd?userid="+userid+"&name="+name+"&email="+email);
    	chk.send();
    }
  </script>
</head>
<body> <!-- login/fPassword.jsp -->
  <form id="pform">
    <h4> 비밀번호 찾기 </h4>
    <div> <input type="text" name="userid" id="txt" placeholder="아이디"> </div>
    <div> <input type="text" name="name" id="txt" placeholder="이 름"> </div>
    <div> <input type="text" name="email" id="txt" placeholder="이메일"> </div>
    <div>
      <input type="button" value="비밀번호 찾기" id="submit" onclick="getPwd(this.form)">
    </div>
  </form>
  
  <div id="view">  </div>
</body>
</html>