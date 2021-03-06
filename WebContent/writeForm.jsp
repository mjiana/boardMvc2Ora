<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/view/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="${bodyback_c}" onload="writeform.writer.focus()">
<div align="center"><b>BOARD</b></div>
<br>
<form method="post" name="writeform" 
	action="/boardMvc2Ora/writePro.do" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">
<input type="hidden" name="re_level" value="${re_level}">

<table class="write">
	<tr>
		<td bgcolor="${value_c}" colspan="2"><b>글 쓰기</b></td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">이름</th>
		<td><input type="text" maxlength="10" name="writer"> </td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">제목</th>
		<td>
			<c:if test="${num == 0}">
				<input type="text" maxlength="50" name="subject"> 
			</c:if>
			<c:if test="${num != 0}">
				<input type="text" maxlength="50" name="subject" value="[답변]"> 
			</c:if>
		</td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">이메일</th>
		<td><input type="text" maxlength="30" name="email"> </td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">내용</th>
		<td><textarea name="content"></textarea> </td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">비밀번호</th>
		<td><input type="password" maxlength="12" name="passwd"> </td>
	</tr>
	<tr>
		<td bgcolor="${value_c}" colspan="2">
			<input type="submit" value="작성">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록" onclick="window.location.href='/boardMvc2Ora/list.do'">
		</td>
	</tr>
</table>
</form>
</body>
</html>