<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- inqueryWrite.jsp -->
<section>
	<form name="iform" method="post" action="inquiryWriteOk">
		<caption> <h3> 문의 작성하기</h3> </caption>
			<tr>
				<div> 이름 : <input type="text" name="name"></div>
				<div>비밀번호 : <input type="password" name="pwd"></div>
				<div> 항목 : <input type="" name="status"></div>
				<div> 제목 : <input type="text" name="title"></div>
				<div> 내용 : <input type="textarea" name="content"></div>
			</tr>
	</form>
</section>
</body>
</html>