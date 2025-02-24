<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f9f9f9;
	}
	.container {
		display: flex;
		flex-direction: column;
		width: 100%;
		min-width: 1150px;
		max-width: 1200px;
		margin: auto;
	}
	.top-section {
		display: flex;
		flex-direction: row;
		width: 100%;
	}
	.sidebar, .right-panel {
		width: 20%;
		background: #f2f2f2;
		padding: 20px;
	}
	.main-content {
		width: 60%;
		padding: 20px;
		text-align: center;
		background: white;
	}
	.search-box {
		background-color: #e6e6e6;
		padding: 20px;
		border-radius: 10px;
	}
	.search-box input, .search-box select, .search-box button {
		display: block;
		width: 100%;
		margin: 5px 0;
		padding: 10px;
	}
	.banner {
		background: #005bac;
		color: white;
		padding: 20px;
		font-size: 18px;
		margin-bottom: 20px;
	}
	.quick-menu, .info-section {
		margin-top: 20px;
		background: white;
		padding: 20px;
		text-align: left;
	}
	.info-section h3, .quick-menu h3 {
		background: #005bac;
		color: white;
		padding: 10px;
		margin-bottom: 10px;
	}
	.info-section ul, .quick-menu ul {
		list-style: none;
		padding: 0;
	}
	.info-section ul li, .quick-menu ul li {
		padding: 5px 0;
		border-bottom: 1px solid #ddd;
	}
	.bottom-section {
		display: flex;
		flex-direction: row;
		width: 100%;
		margin-top: 20px;
	}
	.wide-box {
		flex: 1;
		background: white;
		margin: 10px;
		padding: 20px;
		text-align: center;
	}
</style>
<script>
	function startSt(type) {
		closeAllPopups();
		if (type === 'passenger') {
			document.getElementById('passenger-selection-popup').style.display = 'block';
		}
		else if (type === 'departure') {
			document.getElementById('popup').style.display = 'block';
			loadDeparture();
		}
		else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'block';
			loadArrival();
		}
	}
	function closeAllPopups() {
		document.getElementById('passenger-selection-popup').style.display = 'none';
		document.getElementById('popup').style.display = 'none';
		document.getElementById('arrival-popup').style.display = 'none';
		document.getElementById('seats-popup').style.display = 'none';
	}
	function closePopup(type) {
		if (type === 'passenger') {
			document.getElementById('passenger-selection-popup').style.display = 'none';
		}
		else if (type === 'departure') {
			document.getElementById('popup').style.display = 'none';
		}
		else if (type === 'arrival') {
			document.getElementById('arrival-popup').style.display = 'none';
		}
		else if (type === 'seats') {
			document.getElementById('seats-popup').style.display = 'none';
		}
	}

</script>
</head>
<body>
	<div class="container">
		<div class="top-section">
			<div class="sidebar">
				<h3>승차권 판매</h3>
				<div class="search-box">
					<input type="text" placeholder="출발지" onclick="startSt('departure')">
					<input type="text" placeholder="도착지">
					<input type="date">
					<select>
						<option>전체</option>
						<option>삼천리호</option>
						<option>ZTX</option>
						<option>MZX-청춘</option>
					</select>
					<button>검색</button>
				</div>
			</div>
			<div class="main-content">
				<div class="banner">열차 승차권 부정 판매 행위 절대 금지</div>
				<h2>ZTX 할인상품</h2>
				<div class="discounts">
				    <p>청소년 드림 | 힘내라 청춘 | 맘편한 꼬레일 | 다자녀 행복</p>
				</div>
				<h2>BEST 여행상품</h2>
				<p>기차+숙박+렌터카+입장권을 한번에!</p>
			</div>
			<div class="right-panel">
				<h3>QUICK 메뉴</h3>
				<div class="quick-menu">
					<ul>
						<li>예약 확인</li>
						<li>서비스 아이디어 제안</li>
						<li>암표 제보</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="bottom-section">
			<div class="wide-box">
				<h3>공지사항</h3>
				<ul>
					<li>승차권 다량 구매 제한 안내</li>
					<li>일시적인 점검 안내</li>
					<li>타임 세일 서비스 변경 공지</li>
					<li>2025년 초특가 프로모션 예정</li>
				</ul>
			</div>
			<div class="wide-box">
				<h3>종합 이용 가이드</h3>
				<ul>
					<li>승차권 이용안내</li>
					<li>광역역 도심공항터미널</li>
					<li>할인제도</li>
					<li>유실물 센터</li>
					<li>열차운행 시간표</li>
					<li>노선 검색</li>
				</ul>
			</div>
			<div class="wide-box">
				<h3>은하철도 SNS</h3>
				<p>블로그 | 페이스북 | 인스타그램 | 유튜브 | 트위터</p>
			</div>
		</div>
	</div>
</body>
</html>
