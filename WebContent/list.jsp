<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/view/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="${bodyback_c}">
<div class="list_title">
	<div><b>BOARD</b></div>
	<br>
	<div class="title"><b><a href="/boardMvc2Ora/list.do">글목록</a></b></div>
	<div class="link_write">
		<a href="/boardMvc2Ora/writeForm.do">글쓰기</a>
	</div>
</div>
<div class="right">총 ${count}개의 글</div>
<c:if test="${count == 0}">
	<table class="list">
		<tr>
			<td>게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
</c:if>
<c:if test="${count > 0}">
	<table class="list">
		<thead>
			<tr bgcolor="${value_c}">
				<th>번호</th>
				<th class="subject">제목</th>
				<th class="writer">작성자</th>
				<th class="date">작성일</th>
				<th>조회</th>
				<th>IP</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="article" items="${articleList}">
			<tr>
				<td>
					<c:out value="${number}"/>
					<c:set var="number" value="${number-1}"/>
				</td>
				<td>
					<c:if test="${article.re_level > 0}">
						<img src="images/level.gif" width="${5*article.re_level}" class="sub_img">
						<img src="images/re.gif" class="sub_img">
					</c:if>
					<c:if test="${article.re_level == 0}">
						<img src="images/level.gif" width="${5*article.re_level}" class="sub_img">
					</c:if>
					<a href="/boardMvc2Ora/content.do?num=${article.num}&pageNum=${currentPage}">
					${article.subject}</a>
					<c:if test="${article.readcount >= 20}">
						<img src="images/hot.png" class="sub_img" >
					</c:if>
				</td>
				<td><a href="mailto:${article.email}">${article.writer}</a></td>
				<td>${fn:substring(article.reg_date,0,16)}</td>
				<td>${article.readcount}</td>
				<td>${article.ip}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</c:if>
<div id="paging">
<c:if test="${count > 0}">
	<c:set var="pageCount" value="${count/pageSize+(count%pageSize == 0? 0 : 1)}"/>
	<c:set var="startPage" value="${currentPage/pageSize+1}"/>
	<c:set var="endPage" value="${startPage+10}"/>
	
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if>
	<c:if test="${startPage > 10}">
		<a href="/boardMvc2Ora/list.do?pageNum=${startPage-10}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${currentPage == i}">
			<b style="color:#2b7c86">${i}</b>
		</c:if>
		<c:if test="${currentPage != i}">
			<a href="/boardMvc2Ora/list.do?pageNum=${i}">${i}</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/boardMvc2Ora/list.do?pageNum=${startPage+10}">[다음]</a>
	</c:if>
</c:if>
</div>
<br>
<div id="search">
<form method="post" name="searchForm" action="/boardMvc2Ora/search.do" onsubmit="return searchSave()">
	<select name="find" class="searchClass">
		<option value="0">검색</option>
		<option value="subject">제목</option>
		<option value="writer">작성자</option>
		<option value="content">내용</option>
	</select>
	<input type="text" name="keyword" class="searchClass" value="${keyword}">
	<input type="submit" value="검색" class="searchClass">
</form>
</div>
</body>
</html>