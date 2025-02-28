<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>열차편 검색 결과 - GGoRail</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<style>
    /* 기본 스타일 설정 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    section {
        width: 100%;
        max-width: 1200px;
        margin: auto;
    }
    section header {
        background-color: #00467F;
        padding: 20px;
        text-align: center;
        color: white;
    }
    section header h1 {
        margin: 0;
        font-size: 26px;
    }
    section nav {
        background-color: #0059A3;
        padding: 10px;
        text-align: center;
    }
    section nav a {
        color: white;
        margin: 0 15px;
        text-decoration: none;
        font-size: 16px;
        transition: color 0.3s ease;
    }
    section nav a:hover {
        text-decoration: underline;
        color: #FFD700;
    }
    .container {
        max-width: 1200px;
        margin: 30px auto;
        background-color: white;
        padding: 30px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
    }
    h2 {
        font-size: 26px;
        color: #00467F;
        margin-bottom: 20px;
        text-align: center;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
    }
    .route-table th, .route-table td {
        text-align: center;
    }
    .route-table th {
        background-color: #0059A3;
        color: white;
    }
    .select-route-btn {
    	font-size: 12px;
        padding: 3px 6px;
        background-color: #00467F;
        color: white;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    .select-route-btn:hover {
        background-color: #003A66;
        transform: translateY(-2px);
    }
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .container {
            padding: 20px;
        }
        h2 {
            font-size: 22px;
        }
        .select-route-btn {
            width: 100%;
            text-align: center;
        }
    }
</style>
</head>
<body>
<section>
    <header>
        <h1>열차편 검색 결과</h1>
    </header>

    <nav>
        <a href="../main/index">홈</a>
        <a href="../routes/search">열차 검색</a>
        <a href="../contact">고객센터</a>
    </nav>

    <div class="container">
        <h2>열차 시간표</h2>
        <!-- 가는날 비행기 목록 -->
        <c:if test="${not empty routes}">
            <table class="table table-bordered route-table">
                <thead class="thead-dark">
                    <tr>
                        <th>열차 번호</th>
                        <th>출발역</th>
                        <th>도착역</th>
                        <th>출발일</th>
                        <th>출발시간</th>
                        <th>도착시간</th>
                        <th>잔여석</th>
                        <th>선택</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="route" items="${routes}">
                    <fmt:parseDate value="${route.departureTime}" var="departureDate" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:parseDate value="${route.arrivalTime}" var="arrivalDate" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <tr>
                        <td>${route.routeid}</td>
                        <td>${route.departure}</td>
                        <td>${route.arrival}</td>
                        <td><fmt:formatDate value="${departureDate}" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${departureDate}" pattern="HH:mm:ss" /></td>
                        <td><fmt:formatDate value="${arrivalDate}" pattern="HH:mm:ss" /></td>
                        <td>${route.seat}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/reserve/resCheck" method="get">
                                <input type="hidden" name="selectedGoingrouteId" value="${route.routeid}">
                                <input type="hidden" name="selectedGoingrouteDeparture" value="${route.departure}">
                                <input type="hidden" name="selectedGoingrouteArrival" value="${route.arrival}">
                                <input type="hidden" name="selectedGoingrouteTime" value="${route.departureTime}">
                                <input type="hidden" name="selectedGoingrouteArrivalTime" value="${route.arrivalTime}">
                                <input type="hidden" name="passengers" value="${passengers}">
                                <button type="submit" class="select-flight-btn">선택</button>
                            </form>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- 결과가 없을 경우 -->
        <c:if test="${empty routes }">
            <p class="mt-4">검색 조건에 부합하는 열차편이 없습니다.</p>
        </c:if>
    </div>
</section>
</body>
</html>
