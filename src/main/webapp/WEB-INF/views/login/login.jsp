<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
  input[type="text"],
  input[type="password"],
  input[type="submit"] {
    width: 100%;
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
  .error-message {
    font-size: 12px;
    color: red;
    margin-top: 5px;
  }
  section a {
    text-decoration: none;
    color: #083B82;
  }
  .footer-links {
    display: flex;
    justify-content: center;
    gap: 20px;  /* 공간을 일정하게 */
    font-size: 14px;
    margin-top: 10px;
  }
  .footer-links span {
    cursor: pointer;
    text-decoration: none;
  }
  .footer-links a {
    text-decoration: none;
    color: #083B82;
  }
</style>
</head>
<body> <!-- login/login.jsp -->
 <section>
  <h3>로그인</h3>
  <form method="post" action="loginOk">
    <div> 
      <input type="text" name="userid" id="txt" placeholder="아이디"> 
    </div>
    <div>
      <input type="password" name="pwd" id="txt" placeholder="비밀번호">
      <c:if test="${err == 1}">
        <br><span class="error-message">아이디 혹은 비밀번호가 틀립니다.</span>
      </c:if>
    </div>
    <div> 
      <input type="submit" value="로그인" id="submit"> 
    </div>
    <div class="footer-links">
      <span>아이디 찾기</span>
      <span>|</span>
      <span>비밀번호 찾기</span>
      <span>|</span>
      <span><a href="../member/member">회원가입</a></span>
    </div>
  </form>
 </section>
</body>
</html>
