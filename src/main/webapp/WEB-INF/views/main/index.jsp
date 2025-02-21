<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>코레일 예매</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
	}
	section .header {
		background-color: #005bac;
		color: white;
		padding: 15px;
		text-align: center;
	}
	section .nav {
		background-color: #f2f2f2;
		padding: 10px;
		display: flex;
		justify-content: space-around;
	}
	section .container {
		padding: 20px;
		text-align: center;
	}
	section .search-box {
		background-color: #e6e6e6;
		padding: 20px;
		display: inline-block;
		border-radius: 10px;
	}
	section .search-box input, section .search-box select, section .search-box button {
		margin: 5px;
		padding: 10px;
	}
</style>
</head>
<body>
<section>
	<div class="container">
		<div class="search-box">
			<h2>열차 조회</h2>
			<input type="text" placeholder="출발지">
			<input type="text" placeholder="도착지">
			<input type="date">
			<select>
				<option>전체</option>
				<option>무궁화호</option>
				<option>KTX</option>
				<option>ITX-청춘</option>
			</select>
			<button>검색</button>
		</div>
	</div>
</section>
</body>
</html>