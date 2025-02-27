<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    function getUserid(form)
    {
    	var name=form.name.value;
    	var email=form.email.value;
    	
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		alert(typeof(chk.responseText));
    	}
    	chk.open("get", "getUserid?name="+name+"&email="+email);
    	chk.send();
    }
  </script>
</head>
<body> <!-- login/fUserid.jsp -->
  <form id="uform">
    <h4> 아이디 찾기 </h4>
    <div> <input type="text" name="name" id="txt" placeholder="이 름"> </div>
    <div> <input type="text" name="email" id="txt" placeholder="이메일"> </div>
    <div>
      <input type="button" value="아이디 찾기" id="submit" onclick="getUserid(this.form)">
    </div>
  </form>
</body>
</html>