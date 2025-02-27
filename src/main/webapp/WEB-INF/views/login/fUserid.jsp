<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
  body {
    background-color: #f8f9fa; /* 연한 회색 배경 */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .card {
    width: 100%;
    max-width: 400px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    background: white;
  }

  h4 {
    text-align: center;
    margin-bottom: 20px;
  }

  .form-control {
    border-radius: 8px;
    padding: 10px;
  }

  .btn-primary {
    width: 100%;
    border-radius: 8px;
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    background-color: #007bff;
    border: none;
    transition: 0.3s;
  }

  .btn-primary:hover {
    background-color: #0056b3;
  }

  #view {
    margin-top: 20px;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    color: #333;
  }
</style>
  <script>
  function getUserid(form)
  {
	    var name = form.name.value;
	    var email = form.email.value;
	    
	    if (!name || !email)
	    {
	        alert("이름과 이메일을 입력해주세요.");
	        return;
	      }

	    var chk = new XMLHttpRequest();
	    chk.onload = function () {
	        document.getElementById("uform").style.visibility="hidden";
	        document.getElementById("uform").name.value ="";
	        document.getElementById("uform").email.value="";
	        document.getElementById("view").innerText = "아이디 : " + (chk.responseText.trim() || "존재하지 않는 사용자입니다.");
	    };
	    chk.open("GET", "/login/getUserid?name="+name+"&email="+email);
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
  
  <div id="view">  </div>
</body>
</html>