<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- reserv/list.jsp -->
 <section>
  <table>
    <tr>
      <td> 예약코드 </td>
      <td>  </td>
      <td>  </td>
      <td>  </td>
    </tr>
  <c:forEach items="${reslist}" var="resdto">
  ${resdto.userid}
  </c:forEach>
  </table>
 </section>
</body>
</html>