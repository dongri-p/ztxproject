<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
  <style>
  
  </style>
  <script>
    function chgEmail()
    {
    	var email=document.getElementById("email")
    }
  </script>
</head>
<body> <!-- user/userView.jsp -->
 <section>
  <table>
    <section> <h3> 회원 정보 </h3> </section>
    <tr>
      <td> 아이디 </td>
      <td> ${udto.userid} </td>
    </tr>
    <tr>
      <td> 이 름 </td>
      <td> ${udto.name} </td>
    </tr>
    <tr>
      <td> 이메일 </td>
      <td>
        <input type="text" id="email" value="${udto.email}">
        <input type="button" value="수정" onclick="chgEmail()">
      </td>
    </tr>
    <tr>
      <td> 비밀번호 변경 </td>
      <td>
        <form>
          현재비밀번호 <input type="password" name="oPwd" id="pwd"> <p>
          새 비밀번호 <input type="password" name="nPwd" id="pwd"> <p>
          비밀번호 확인 <input type="password" name="nPwd2" id="pwd"> <p>
          <input type="submit" value="비밀번호 변경" onclick="chgPwd()">
        </form>
      </td>
    </tr>
    <tr>
      <td> 전화번호 </td>
      <td>
        <input type="text" id="phone" value="${udto.phone}">
        <input type="button" value="수정" onclick="chgPhone()">
      </td>
    </tr>
  </table>
 </section>
</body>
</html>