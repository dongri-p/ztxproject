<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   section {
     width:1100px;
     height:600px;
     margin:auto;
   }
   section table {
     border-spacing:0px;
   }
   section table tr:first-child td {
     height:40px;
     text-align:center;
     border-top:2px solid black;
   }
   section table tr td {
     height:70px;
     text-align:center;
     border-bottom:1px solid black;
   }
   section table tr:last-child td {
     border-bottom:2px solid black;
   }
 </style>
</head>
<body> <!-- qnaList.jsp -->
<section>
 <table>
	<thead>
		<tr>
     		<th>순번</th>
     		<th>접수번호</th>
     		<th>제목</th>
     		<th>게시일</th>
     		<th>상태</th>
    	</tr>
    </thead>
   <tbody>
   	
   </tbody>
 </table>
 <a href="/inquiry/inquiryWrite" class="btn">문의 작성하기</a>
</section>
</body>
</html>