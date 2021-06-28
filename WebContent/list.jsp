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
	<div class="title"><b><a href="/boardMvc2Ora/list.do">�۸��</a></b></div>
	<div class="link_write">
		<a href="/boardMvc2Ora/writeForm.do">�۾���</a>
	</div>
</div>
<div class="right">�� ${count}���� ��</div>
<c:if test="${count == 0}">
	<table class="list">
		<tr>
			<td>�Խ��ǿ� ����� ���� �����ϴ�.</td>
		</tr>
	</table>
</c:if>
<c:if test="${count > 0}">
	<table class="list">
		<thead>
			<tr bgcolor="${value_c}">
				<th>��ȣ</th>
				<th class="subject">����</th>
				<th class="writer">�ۼ���</th>
				<th class="date">�ۼ���</th>
				<th>��ȸ</th>
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
		<a href="/boardMvc2Ora/list.do?pageNum=${startPage-10}">[����]</a>
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
		<a href="/boardMvc2Ora/list.do?pageNum=${startPage+10}">[����]</a>
	</c:if>
</c:if>
</div>
<br>
<div id="search">
<form method="post" name="searchForm" action="/boardMvc2Ora/search.do" onsubmit="return searchSave()">
	<select name="find" class="searchClass">
		<option value="0">�˻�</option>
		<option value="subject">����</option>
		<option value="writer">�ۼ���</option>
		<option value="content">����</option>
	</select>
	<input type="text" name="keyword" class="searchClass" value="${keyword}">
	<input type="submit" value="�˻�" class="searchClass">
</form>
</div>
</body>
</html>