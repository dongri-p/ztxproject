<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }
  section {
    width: 100%;
    max-width: 500px;
    margin: 50px auto;
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  h3 {
    text-align: center;
    color: #333;
    font-size: 24px;
    margin-bottom: 30px;
  }
  div {
  }
  input[type="text"],
  input[type="password"],
  input[type="submit"],
  input[type="button"] {
    width: 47%;
    padding: 12px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color: #66afe9;
    outline: none;
  }
  .email {
    width: 48%;
    display: inline-block;
  }
  #submit {
    background-color: #083B82;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s ease;
  }
  #submit:hover {
    background-color: #45a049;
  }
  #button {
    border: none;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.3s ease;
  }
  #txt {
    width: 100%;
  }
  #sandc {
  
  }
  select {
    width: 47%;
    padding: 12px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    box-sizing: border-box;
  }
  #umsg, #pmsg {
    font-size: 12px;
    margin-top: 5px;
  }
  input[type="submit"],
  input[type="button"] {
    width:49.2%;
  }
  section a {
    text-decoration:none;
  }
</style>
<script>
  function useridCheck(userid)
  {
	  if(userid.length >= 6)
	  {
		  var chk=new XMLHttpRequest();
		  chk.onload=function()
		  {
			  //alert(chk.responseText);
			  if(chk.responseText == "0")
			  {
				  document.getElementById("umsg"),innerText="사용 가능한 아이디";
			  }
			  else
			  {
				  document.getElementById("umsg"),innerText="사용 불가능한 아이디";
			  }  
			  
		  }
		  
		  chk.open("get", "useridCheck?userid="+userid);
		  chk.send();
	  }
	  else
	  {
		  document.getElementById("umsg").innerText="아이디의 길이는 6자 이상입니다";
	  }
	  
  }
</script>
</head>
<body> <!-- user/user.jsp -->
 <section>
  <form method="post" name="uform" action="userOk" onsubmit="">
    <h3>회원 가입</h3>
    <div>
      <input type="text" name="userid" onblur="useridCheck(this.value)" id="txt" placeholder="아이디(6자이상)">
      <br> <span id="umsg"> </span>
    </div>
    <div> 
      <input type="text" name="name" id="txt" placeholder="이 름"> 
    </div>
    <div> 
      <input type="password" name="pwd" onkeyup="pwdCheck()" id="txt" placeholder="비밀번호"> 
    </div>
    <div>
      <input type="password" name="pwd2" onkeyup="pwdCheck()" id="txt" placeholder="비밀번호 확인">
      <br> <span id="pmsg"> </span>
    </div>
    <div>
      <input type="text" name="uid" class="email"> @
      <select name="dserver" id="select" onchange="getServer(this)">
        <option value=""> 직접입력 </option>
        <option value="naver.com"> naver.com </option>
        <option value="daum.net"> daum.net </option>
        <option value="gmail.com"> gmail.com </option>
        <option value="kakao.com"> kakao.com </option>
      </select>
    </div>
    <div> 
      <input type="text" name="phone" id="txt" placeholder="전화번호"> 
    </div>
    <div> 
      <a href="../main/index"> <input type="button" value="취 소" id="button"> </a>
      <input type="submit" value="회원 가입" id="submit">
    </div>
  </form> 
 </section>
</body>
</html>
