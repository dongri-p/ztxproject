<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- user/user.jsp -->
 <section>
  <form method="post" name="uform" action="userOk" onsubmit="">
    <h3> 회원 가입 </h3>
    <div>
      <input type="text" name="userid" onblur="useridCheck(this.value)" id="txt" placeholder="아이디(6자이상)">
      <br> <span id="umsg"> </span>
    </div>
    
  </form> 
 </section>
</body>
</html>