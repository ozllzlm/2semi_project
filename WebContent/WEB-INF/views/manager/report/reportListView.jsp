<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

        .admin_nav>li:nth-child(1) {
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
            width: 60px;
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
.page_button > button {
    border-style: none;
    margin: 10px;
    padding: 10px 10px;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    color: #432;
}

.page_button > button:nth-child(${pi.page+2}){
    background-color: rgb(135, 211, 124);
}

         .basic {
            border: 1px lightgray solid;
            border-radius: 5px;
            height: 30px;
            margin-bottom: 10px;
            width: 200px;

        }

        .board_ul {
	cursor:pointer;
}
    </style>

</head>

<%@ include file="/WEB-INF/views/common/menubar.jsp"%>
<div class="home-content wrapper">

    <nav>
        <ul class="admin_nav">
            <li>
                <a href="${ contextPath }/report/list">
                    ????????????
                </a>
            </li>
            <li>
                <a href="${ contextPath }/ad/list">
                    ??????/?????? ??????
                </a>
            </li>
            <li>
                 <a href="${ contextPath }/userSearch">
                    ??????????????????
                </a>
            </li>

        </ul>

    </nav>

    <div class="wrap">

        <div class="report_list">
            <ul class="board_header">
                <li class="id">?????????</li>
                <li class="title">????????????</li>
                <li class="writer">?????????</li>
                <li class="read">??????</li>
                <li class="date">?????????</li>
            </ul>
           <c:forEach var="report" items="${reportList}">
            <ul class="board_ul" onclick="reportDetail(${ report.rid },'${report.rTitle }');">
                <li class="id">${ report.rid }</li>
                <li class="title">[ ${ report.rTitle } ]</li>
                <li class="writer">${ report.rnickName }</li>
                   <c:if test="${fn:contains(report.status,'N')}"><li class="read">?????????</li></c:if>
                   <c:if test="${fn:contains(report.status,'Y')}"><li class="read">??????</li></c:if>
                <li class="date">${ report.reportDate }</li>
            </ul>
          	</c:forEach>
          
        </div>
    </div>
     <div class="page_button">
        
            <button onclick="location.href='${ contextPath }/report/list?page=1'">&lt;&lt;</button>
            
            <c:choose>
               <c:when test="${ pi.page > 1 }">
               <button onclick="location.href='${ contextPath }/report/list?page=${ pi.page - 1 }'">&lt;</button>
            	</c:when>
                <c:otherwise><button onclick="location.href='#'">&lt;</button></c:otherwise>
            </c:choose>
            
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <c:choose>
            	<c:when test="${ p eq pi.page }">
            	<button onclick="location.href='#'" class="current_page">${ p }</button>
            	</c:when>
            	<c:otherwise>
            	<button onclick="location.href='${ contextPath }/report/list?page=${ p }'">${ p }</button>
            	</c:otherwise>
            </c:choose>
            </c:forEach>
           
            <c:choose>
               <c:when test="${ pi.page < pi.maxPage }">
               <button onclick="location.href='${ contextPath }/report/list?page=${ pi.page + 1 }'">&gt;</button>
               </c:when>
               <c:otherwise>
               <button onclick="location.href='#'">&gt;</button>
               </c:otherwise>
            </c:choose>
           
           <button onclick="location.href='${ contextPath }/report/list?page=${ pi.maxPage }'">&gt;&gt;</button>

      </div>

</div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		function reportDetail(rid,title){
		
			if(title.substr(1,2)=='??????'){
				location.href='${contextPath}/report/note/detail?rid='+rid;
			} else {
				location.href='${contextPath}/report/detail?rid='+rid;
				
			}
		}
	</script>

</body>

</html>