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
	document.addEventListener('DOMContentLoaded', function() {
		const generalButton = document.getElementById('general');
		const mileageButton = document.getElementById('mileage');
		generalButton.classList.add('active-button');
		generalButton.addEventListener('click', function() {
			generalButton.classList.add('active-button');
			generalButton.classList.add('active-button:hover');
			mileageButton.classList.remove('active-button');
			mileageButton.classList.remove('active-button:hover');
		});
	});
	function openPopup(type) {
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
	document.addEventListener('click', function(event) {
		const passengerPopup = document.getElementById('passenger-selection-popup');
		const seatPopup = document.getElementById('seats-popup');
		const seatSelectBtn = document.getElementById('seats-btn');
		const passengerBtn = document.getElementById('passenger-btn');
		if (passengerPopup.style.display === 'block' && !passengerPopup.contains(event.target) && event.target !== passengerBtn) {
			passengerPopup.style.display = 'none';
		}
		if (seatPopup.style.display === 'block' && !seatPopup.contains(event.target) && event.target !== seatSelectBtn) {
			seatPopup.style.display = 'none';
		}
	});
	document.addEventListener('DOMContentLoaded', function () {
		const seatSelectBtn = document.getElementById('seats-btn');
		const seatPopup = document.getElementById('seats-popup');
		seatSelectBtn.addEventListener('click', function(event) {
			event.stopPropagation();
			seatPopup.style.display = seatPopup.style.display === 'block' ? 'none' : 'block';
		});
		window.selectSeat = function(seatType) {
			document.querySelector('#seats-btn span').innerText = seatType;
			document.getElementById('seatClass-hidden').value = seatType;
			seatPopup.style.display = 'none';
		}
	});
	document.addEventListener('DOMContentLoaded', function () {
		loadDeparture();
	});
	function loadDeparture() {
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/api/flights/airports');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var data = JSON.parse(xhr.responseText);
				var airportList = document.getElementById('airport-list');
				if (airportList) {
					airportList.innerHTML = '';
					var defaultAirport = data.find(airport => airport.airportCode === 'SEL');
					if (defaultAirport) {
						document.getElementById('from-text').textContent = defaultAirport.airportCode;
						document.getElementById('departure-text').textContent = defaultAirport.city + '/' + defaultAirport.detailedCity;
					}
					else {
						document.getElementById('from-text').textContent = 'SEL';
						document.getElementById('departure-text').textContent = '서울';
					}
					data.forEach(function(airport) {
						var li = document.createElement('li');
						var airportCode = document.createElement('span');
						airportCode.classList.add('airport-code');
						airportCode.textContent = airport.airportCode;
						var airportInfo = document.createElement('span');
						if (airport.detailedCity == 'null' || airport.detailedCity == null) {
							airportInfo.textContent = ' ' + airport.city + ', ' + airport.country;
						}
						else {
							airportInfo.textContent = ' ' + airport.city + '/' + airport.detailedCity + ', ' + airport.country;
						}
						li.appendChild(airportCode);
						li.appendChild(airportInfo);
						li.onclick = function() {
							document.getElementById('from-text').textContent = airport.airportCode;
							if (airport.detailedCity == 'null' || airport.detailedCity == null) {
								document.getElementById('departure-text').textContent = airport.city;
							}
							else {
								document.getElementById('departure-text').textContent = airport.city + '/' + airport.detailedCity;
							}
							document.getElementById('from-hidden').value = airport.airportCode;
							closePopup('departure');
						};
						airportList.appendChild(li);
					});
				}
				else {
					console.error('The element with id "airport-list" is not found.');
				}
			}
			else if (xhr.readyState === 4 && xhr.status !== 200) {
				console.error('Failed to load airports data. Status: ' + xhr.status);
				document.getElementById('from-text').textContent = 'SEL';
				document.getElementById('departure-text').textContent = '서울';
			}
		};
		xhr.onerror = function() {
			console.error('Request failed');
			document.getElementById('from-text').textContent = 'SEL';
			document.getElementById('departure-text').textContent = '서울';
		};
		xhr.send();
	}
	document.addEventListener('DOMContentLoaded', function () {
		loadArrival();
	});
	function loadArrival() {
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/api/flights/airports');
		xhr.onload = function() {
			var data = JSON.parse(xhr.responseText);
			var airportList = document.getElementById('arrival-list');
			airportList.innerHTML = '';
			data.forEach(function(airport) {
				var li = document.createElement('li');
				var airportCode = document.createElement('span');
				airportCode.classList.add('airport-code');
				airportCode.textContent = airport.airportCode;
				var airportInfo = document.createElement('span');
				if (airport.detailedCity == 'null' || airport.detailedCity == null) {
					airportInfo.textContent = ' ' + airport.city + ', ' + airport.country;
				}
				else {
					airportInfo.textContent = ' ' + airport.city + '/' + airport.detailedCity + ', ' + airport.country;
				}
				li.appendChild(airportCode);
				li.appendChild(airportInfo);
				li.onclick = function() {
					document.getElementById('to-text').textContent = airport.airportCode;
					if (airport.detailedCity == 'null' || airport.detailedCity == null) {
						document.getElementById('arrival-text').textContent = airport.city;
					}
					else {
						document.getElementById('arrival-text').textContent = airport.city + '/' + airport.detailedCity;
					}
					document.getElementById('to-hidden').value = airport.airportCode;
					console.log("도착지 설정됨: " + airport.airportCode);
					closePopup('arrival');
				};
				airportList.appendChild(li);
			});
		};
		xhr.send();
	}
	document.addEventListener('DOMContentLoaded', function () {
		const bookingButton = document.getElementById('booking');
		showContent('booking');
		document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
			el.classList.remove('active');
		});
		bookingButton.parentNode.classList.add('active');
		function activateMenu(event) {
			document.querySelectorAll('.booking_widget_list li').forEach(function(el) {
				el.classList.remove('active');
			});
			event.currentTarget.parentNode.classList.add('active');
		}
		document.querySelectorAll('.booking_widget_list li button').forEach(function(button) {
			button.addEventListener('click', activateMenu);
		});
		var tripMethod = "round";
		var calendar = flatpickr("#date-btn", {
			locale: "ko",
			mode: "range",
			dateFormat: "Y-m-d",
			showMonths: 2,
			minDate: "today",
			onChange: function(selectedDates, dateStr, instance) {
				if (tripMethod === "round" && selectedDates.length === 2) {
					document.getElementById('date-btn').value = selectedDates[0].toLocaleDateString() +
					" ~ " + selectedDates[1].toLocaleDateString();
					document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
					document.getElementById('arrivalDate-hidden').value = instance.formatDate(selectedDates[1], "Y-m-d");
				}
				else if (tripMethod === "one-way" && selectedDates.length === 1) {
					document.getElementById('date-btn').value = "가는 날: " + selectedDates[0].toLocaleDateString();
					document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
					document.getElementById('arrivalDate-hidden').value = "";
				}
			}
		});
		var tripMethods = document.querySelectorAll('input[name="t_methods"]');
		tripMethods.forEach(function (radio) {
			radio.addEventListener('change', function () {
				var dateInput = document.getElementById('date-btn');
				if (this.value === "round") {
					tripMethod = "round";
					calendar = flatpickr("#date-btn", {
						locale: "ko",
						mode: "range",
						dateFormat: "Y-m-d",
						showMonths: 2,
						defaultDate: "today",
						minDate: "today",
						onChange: function (selectedDates, dateStr, instance) {
							if (selectedDates.length === 2) {
								dateInput.value = selectedDates[0].toLocaleDateString() + " ~ " + selectedDates[1].toLocaleDateString();
								document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
								document.getElementById('arrivalDate-hidden').value = instance.formatDate(selectedDates[1], "Y-m-d");
							}
						}
					});
					dateInput.placeholder = "가는 날 ~ 오는 날";
				}
				else if (this.value === "one-way") {
					tripMethod = "one-way";
					calendar = flatpickr("#date-btn", {
						locale: "ko",
						mode: "single",
						dateFormat: "Y-m-d",
						showMonths: 2,
						defaultDate: "today",
						minDate: "today",
						onChange: function (selectedDates, dateStr, instance) {
							if (selectedDates.length === 1) {
								dateInput.value = "가는 날: " + selectedDates[0].toLocaleDateString();
								document.getElementById('departureDate-hidden').value = instance.formatDate(selectedDates[0], "Y-m-d");
								document.getElementById('arrivalDate-hidden').value = "";
							}
						}
					});
					dateInput.placeholder = "가는 날";
				}
			});
		});
	});
	document.addEventListener('DOMContentLoaded', function() {
		flatpickr("#date", {
			locale: "ko",
			dateFormat: "Y-m-d",
			allowInput: true,
			showMonths: 2,
			maxDate: new Date().fp_incr(365),
			minDate: "today"
		});
	});
	function showContent(type) {
		document.querySelectorAll('.booking_contents, .select_contents, .check-in_contents, .schedule_contents').forEach(function(el) {
			el.style.display = 'none';
		});
		if (type === 'booking') {
			document.querySelector('.booking_contents').style.display = 'block';
		}
		else if (type === 'select') {
			document.querySelector('.select_contents').style.display = 'block';
		}
		else if (type === 'check-in') {
			document.querySelector('.check-in_contents').style.display = 'block';
		}
		else if (type === 'schedule') {
			document.querySelector('.schedule_contents').style.display = 'block';
		}
	}
	function updateButtonTextWithIcon(buttonId, newText) {
		var button = document.getElementById(buttonId);
		var icon = button.querySelector('i');
		var span = button.querySelector('span');
		if (span) {
			span.textContent = newText;
		}
		if (icon) {
			button.appendChild(icon);
		}
	}
	function updatePassengerButton() {
		var adultCount = parseInt(document.getElementById('adult-count').textContent, 10) || 0;
		var childCount = parseInt(document.getElementById('child-count').textContent, 10) || 0;
		var infantCount = parseInt(document.getElementById('infant-count').textContent, 10) || 0;
		var passengerText = '성인 ' + adultCount + '명';
		var additionalPassengers = [];
		if (childCount > 0) {
			additionalPassengers.push('소아');
		}
		if (infantCount > 0) {
			additionalPassengers.push('유아');
		}
		if (additionalPassengers.length > 0) {
			if (additionalPassengers.length === 1) {
				passengerText += ', ' + additionalPassengers[0] + '···';
			}
			else {
				passengerText += ', ' + additionalPassengers[0] + '···';
			}
		}
		document.getElementById('passenger-btn').innerHTML = passengerText;
		var passengerBtn = document.getElementById('passenger-btn');
		passengerBtn.innerHTML = '';
		var icon = document.createElement('i');
		icon.className = 'fa-regular fa-user';
		passengerBtn.appendChild(icon);
		passengerBtn.append(' ' + passengerText);
		var passengersValue = adultCount + childCount;
		document.getElementById('passenger-hidden').value = passengersValue;
		document.getElementById('adult-hidden').value = adultCount;
		document.getElementById('child-hidden').value = childCount;
		document.getElementById('infant-hidden').value = infantCount;
	}
	document.addEventListener('DOMContentLoaded', function() {
		updatePassengerButton();
	});
	function increase(type) {
		var adultCount = parseInt(document.getElementById('adult-count').textContent);
		var childCount = parseInt(document.getElementById('child-count').textContent);
		var infantCount = parseInt(document.getElementById('infant-count').textContent);
		var totalPassengers = adultCount + childCount;
		if (type === 'adult' && totalPassengers < 10) {
			document.getElementById('adult-count').textContent = adultCount + 1;
		}
		else if (type === 'child' && totalPassengers < 10) {
			document.getElementById('child-count').textContent = childCount + 1;
		}
		else if (type === 'infant' && infantCount < adultCount) {
			document.getElementById('infant-count').textContent = infantCount + 1;
		}
		updatePassengerButton();
	}
	function decrease(type) {
		var adultCount = parseInt(document.getElementById('adult-count').textContent);
		var childCount = parseInt(document.getElementById('child-count').textContent);
		var infantCount = parseInt(document.getElementById('infant-count').textContent);
		if (type === 'adult' && adultCount > 0) {
			document.getElementById('adult-count').textContent = adultCount - 1;
			if (infantCount > adultCount - 1) {
				document.getElementById('infant-count').textContent = adultCount - 1;
			}
		}
		else if (type === 'child' && childCount > 0) {
			document.getElementById('child-count').textContent = childCount - 1;
		}
		else if (type === 'infant' && infantCount > 0) {
			document.getElementById('infant-count').textContent = infantCount - 1;
		}
		updatePassengerButton();
	}
	function revealSections() {
		const sections = document.querySelectorAll('.fade-in-section');
		const windowHeight = window.innerHeight;
		sections.forEach(section => {
			const sectionTop = section.getBoundingClientRect().top;
			if (sectionTop < windowHeight - 100) {
				section.classList.add('visible');
			}
		});
	}
	window.addEventListener('scroll', revealSections);
	window.addEventListener('load', revealSections);
	$(function() {
		var currentURL = window.location.pathname;
		var referrerURL = document.referrer ? (new URL(document.referrer)).pathname : '';
		function isIndex(url) {
			return url === '/' || url.endsWith('/index') || url.endsWith('/index.html') || url.endsWith('/index.php');
		}
		if (isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
			$('.main_content').slideDown(1000);
		}
		else if (!isIndex(currentURL) && isIndex(referrerURL)) {
			$('.main_content').slideUp(500);
		}
		else if (!isIndex(currentURL) && (!referrerURL || !isIndex(referrerURL))) {
						
		}
		else {
			$('.main_content').show();
		}
	});
	function checkLoginStatus(event) {
		fetch('/checkLoginStatus')
		.then(response => response.json())
		.then(isLoggedIn => {
			if (isLoggedIn) {
				activateMileageButton();
			}
			else {
				event.preventDefault();
				openLoginPopup();
			}
		});
	}
	function activateMileageButton() {
		const generalButton = document.getElementById('general');
		const mileageButton = document.getElementById('mileage');
		mileageButton.classList.add('active-button');
		mileageButton.classList.add('active-button:hover');
		generalButton.classList.remove('active-button');
		generalButton.classList.remove('active-button:hover');
	}
	function login() {
		closeLoginPopup();
		activateMileageButton();
		console.log('로그인 성공');
	}
	function openLoginPopup() {
		document.getElementById('login-popup').style.display = 'block';
		document.getElementById('popup-overlay').style.display = 'block';
	}
	function closeLoginPopup() {
		document.getElementById('login-popup').style.display = 'none';
		document.getElementById('popup-overlay').style.display = 'none';
	}
	function check(my) {
		if(my.userid.value.trim().length==0) {
			alert("아이디를 입력하세요");
			return false;
		}
		else if(my.pwd.value.trim().length==0) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		else
			return true;
	}
	var fs1=22;
	var fs2=22;
	function sizedown(n) {
		var num;
		if(n==0)
			num=fs1;
		else
			num=fs2;
		if(num!=11) {
			s1=setInterval(function() {
				num--;
				document.getElementsByClassName("inner")[n].style.fontSize=num+"px";
				document.getElementsByClassName("inner")[n].style.top="-15px";
				document.getElementsByClassName("inner")[n].style.opacity=1;
				document.getElementsByClassName("inner")[n].style.style="#1f0c59";
				document.getElementsByClassName("inner")[n].style.fontWeight="bold";
				document.getElementsByClassName("inner")[n].style.paddingLeft="2px";
				document.getElementsByClassName("inner")[n].style.paddingRight="2px";
				if(n== 0) {
					document.getElementsByClassName("inner")[n].textContent = "아이디 *";
				}
				else {
					document.getElementsByClassName("inner")[n].textContent = "비밀번호 *";
				}
				if(num==11) {
					clearInterval(s1);
					if(n==0)
						fs1=11;
					else
						fs2=11;
				}
			},10);
		}
	}
	function init(my,n) {
		if(my.value.trim().length==0) {
			if(n==0)
				num=fs1;
			else
				num=fs2;
			s2=setInterval(function() {
				num++;
				document.getElementsByClassName("inner")[n].style.fontSize=num+"px";
				document.getElementsByClassName("inner")[n].style.top="-5px";
				document.getElementsByClassName("inner")[n].style.opacity=0.6;
				document.getElementsByClassName("inner")[n].style.style="#333";
				if(n== 0) {
					document.getElementsByClassName("inner")[n].textContent = "아이디";
				}
				else {
					document.getElementsByClassName("inner")[n].textContent = "비밀번호";
				}
				if(num>=18) {
					console.log(num);
					clearInterval(s2);
					if(n==0)
						fs1=18;
					else
						fs2=18;
				}
			},20);
		}
	}
	window.onload=function() {
		document.getElementById("txt").focus();
	}
	function useridSearch() {
		son=open("usForm","","width=400,height=300");
		son.moveTo(200,200);
	}
	function pwdSearch() {
		son=open("psForm","","width=400,height=370");
		son.moveTo(200,200);
	}
	function selectDeparture(airportCode, city) {
		document.getElementById('from-text').textContent = airport.airportCode;
		document.getElementById('departure-text').textContent = city;
		document.getElementById('from-hidden').value = airport.airportCode;
		console.log("출발지 설정: " + airport.airportCode);
		closePopup('departure');
	}
	function selectArrival(airportCode, city) {
		document.getElementById('to-text').textContent = airportCode;
		document.getElementById('arrival-text').textContent = city;
		document.getElementById('to-hidden').value = airportCode;
		console.log("도착지 설정: " + airportCode);
		closePopup('arrival');
	}
	function getDayOfWeek(day) {
		const weekdays = ['일', '월', '화', '수', '목', '금', '토'];
		return weekdays[day];
	}
	function getDateOptions() {
		const select = document.getElementById('cdate');
		const today = new Date();
		for(var i = -1; i <= 2; i++) {
			var optionDate = new Date();
			optionDate.setDate(today.getDate() + i);
			var year = optionDate.getFullYear();
			var month = ('0' + (optionDate.getMonth() + 1)).slice(-2);
			var day = ('0' + optionDate.getDate()).slice(-2);
			var dayOfWeek = getDayOfWeek(optionDate.getDay());
			var dateString = year+"-"+month+"-"+day+" ("+dayOfWeek+")";
			var dateValue = year+"-"+month+"-"+day;
			var option = document.createElement('option');
			option.value = dateValue;
			option.textContent = dateString;
			select.appendChild(option);
		}
	}
	document.addEventListener('DOMContentLoaded', function() {
		getDateOptions();
	});
	function enforceUppercase(element) {
		element.value = element.value.toUpperCase();
		element.value = element.value.replace(/[^A-Z]/g, '');
	}
	function validateCheckbox() {
		var checkbox = document.getElementById('agree-contents');
		var agreeErrorMessage = document.getElementById('agreeContentsErrorMessage');
		var inputErrorMessages = document.getElementsByClassName('inputContentsErrorMessage');
		// 체크박스 검증
		if (!checkbox.checked) {
			agreeErrorMessage.style.visibility = 'visible';
		}
		else {
			agreeErrorMessage.style.visibility = 'hidden';
		}
		
		// 필수 입력 필드가 비어 있을 경우 경고 문구 표시
		var isValid = true;
		var requiredFields = document.querySelectorAll('#form1 input[required]');
		requiredFields.forEach(function(input, index) {
			if (input.value.trim() === '') {
				inputErrorMessages[index].style.visibility = 'visible';
				isValid = false;
			}
			else {
				inputErrorMessages[index].style.visibility = 'hidden';
			}
		});
		// 체크박스와 모든 필드가 유효한 경우 폼 제출
		if (isValid && checkbox.checked) {
			document.getElementById('form1').submit();
		}
	}
	function checkSelectionDetails() {
		var pnr = document.getElementById("pnr").value;
		var sung = document.getElementById("sung").value;
		var name = document.getElementById("name").value;
		var date = document.getElementById("date").value;
		// 각 변수 값 출력
		console.log("PNR:", pnr);
		console.log("성:", sung);
		console.log("이름:", name);
		console.log("날짜:", date);
		// URL 생성 후 확인
		const requestUrl = "/api/check-reservation?pnr=" + pnr + "&sung=" + sung + "&name=" + name + "&date=" + date;
		console.log("Direct Request URL:", requestUrl);
		// XMLHttpRequest 객체 생성
		const xhr = new XMLHttpRequest();
		xhr.open("GET", requestUrl, true);
		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					const data = JSON.parse(xhr.responseText);
					console.log("Response Data:", data);
					if (data.exists) {
						document.getElementById("form1").submit();
					}
					else {
						alert("조회 가능한 예약 정보가 없습니다.");
					}
				}
				else {
					console.error("Error:", xhr.statusText);
					alert("조회 중 오류가 발생했습니다.");
				}
			}
		};
		// 요청 전송
		xhr.send();
		return false; // 기본 폼 제출 막기
	}

</script>
</head>
<body>
	<div class="container">
		<div class="top-section">
			<div class="sidebar">
				<h3>승차권 판매</h3>
				<div class="search-box">
					<div id="quick_booking">
						<button type="button" class="quick_booking_button" onclick="openPopup('departure')">
							<span id="from-text">From</span> 
							<span id="departure-text">&nbsp;출발지</span>
						</button>
						<button type="button" class="quick_booking_button" onclick="openPopup('arrival')">
							<span id="to-text">To</span> 
							<span id="arrival-text">&nbsp;도착지</span>
						</button>
					</div>
					<div id="popup" class="popup" style="display: none;">
						<span class="close-btn" onclick="closePopup('departure')">&times;</span>
						<h2>출발지 선택</h2>
						<ul id="airport-list" class="airport-list"></ul>
					</div>
					<div id="arrival-popup" class="popup" style="display: none;">
						<span class="close-btn" onclick="closePopup('arrival')">&times;</span>
						<h2>도착지 선택</h2>
						<ul id="arrival-list" class="airport-list"></ul>
					</div>
					<input type="hidden" name="departure" id="from-hidden">
					<input type="hidden" name="arrival" id="to-hidden">				
				
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
