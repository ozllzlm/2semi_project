<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        .home-content {
            display: inline-block;
            margin-top: 70px;
            text-align: center;

            font-family: 'Nanum Gothic', sans-serif;
        }

        .admin_nav>li {
            display: inline;
            font-weight: 700;
            font-size: 20px;
        }

        .admin_nav>li:not(:first-child) {
            margin-left: 100px;
        }

        .admin_nav>li:nth-child(2) {
            border-bottom: 3px solid rgb(135, 211, 124);
            padding-bottom: 3px;
        }

        .wrap {
            width: 1000px;
            margin: 50px auto;
        }

        ul,
        li {
            margin: 0;
            padding: 0;
        }

.report_list {
	margin: 20px 30px;
	min-height: 565px;
}

.report_list>ul {
	border-bottom: 1px solid #f3f5f7;
	height: 50px;
	line-height: 50px;
	display: flex;
	justify-content: space-around;
	list-style: none;
}

.report_list>ul.last {
	border: 0;
}

.report_list>ul>li {
	text-align: center;
}

.board_header {
	border-radius: 5px;
	background: rgb(135, 211, 124);
	color: white;
	font-weight: bold;
}

.report_list .id {
	width: 70px;
}

.report_list .category {
	width: 60px;
}

.report_list .title {
	width: 350px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.report_list .writer {
	width: 80px;
}

.report_list .read {
	width: 60px;
}

.report_list .date {
	width: 100px;
}

.page_button {
	text-align: center;
	margin-top: 40px;
	margin-bottom: 50px;
}

.page_button>button {
	border-style: none;
	margin: 10px;
	padding: 10px 10px;
	border-radius: 5px;
	font-size: 18px;
	cursor: pointer;
	color: #432;
}

.page_button>button:nth-child(${pi.page+2}) {
	background-color: rgb(135, 211, 124);
}

.board_ul {
	cursor: pointer;
}

a {
	text-decoration: none;
	color: #432;
}
</style>
</head>

<%@ include file="/WEB-INF/views/common/menubar.jsp"%>
<div class="home-content wrapper">
	<nav>
		<ul class="admin_nav">
			<li><a href="${ contextPath }/report/list"> 신고내역 </a></li>
			<li><a href="${ contextPath }/ad/list"> 광고/제휴 문의 </a></li>
			<li><a href="${ contextPath }/userSearch"> 회원정보조회 </a></li>

		</ul>
	</nav>
	<div class="wrap">

		<div class="report_list">
			<ul class="board_header">
				<li class="id">문의번호</li>
				<li class="title">제목</li>
				<li class="writer">작성자</li>
				<li class="read">열람</li>
				<li class="date">작성일</li>
			</ul>
			<c:forEach var="ad" items="${ adList }">
				<ul class="board_ul" onclick="adDetail(${ad.adNo});">
					<li class="id">${ad.adNo}</li>
					<li class="title">${ad.adTitle}</li>
					<li class="writer">${ad.adWriter}</li>
					<c:if test="${fn:contains(ad.read,'N')}">
						<li class="read">미열람</li>
					</c:if>
					<c:if test="${fn:contains(ad.read,'Y')}">
						<li class="read">열람</li>
					</c:if>
					<li class="date">${ad.adDate }</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>
<div class="page_button">

	<button onclick="location.href='${ contextPath }/ad/list?page=1'">&lt;&lt;</button>

	<c:choose>
		<c:when test="${ pi.page > 1 }">
			<button
				onclick="location.href='${ contextPath }/ad/list?page=${ pi.page - 1 }'">&lt;</button>
		</c:when>
		<c:otherwise>
			<button onclick="location.href='#'">&lt;</button>
		</c:otherwise>
	</c:choose>

	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		<c:choose>
			<c:when test="${ p eq pi.page }">
				<button onclick="location.href='#'" class="current_page">${ p }</button>
			</c:when>
			<c:otherwise>
				<button
					onclick="location.href='${ contextPath }/ad/list?page=${ p }'">${ p }</button>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:choose>
		<c:when test="${ pi.page < pi.maxPage }">
			<button
				onclick="location.href='${ contextPath }/ad/list?page=${ pi.page + 1 }'">&gt;</button>
		</c:when>
		<c:otherwise>
			<button onclick="location.href='#'">&gt;</button>
		</c:otherwise>
	</c:choose>

	<button
		onclick="location.href='${ contextPath }/board/list?page=${ pi.maxPage }'">&gt;&gt;</button>

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>

		function adDetail(adNo){
			location.href='${contextPath}/ad/detail?adNo='+adNo;
		}
		
	</script>

</body>

</html>