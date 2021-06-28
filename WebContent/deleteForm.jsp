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
<body bgcolor="${bodyback_c}" onload="delform.passwd.focus()">
<div align="center"><b>BOARD</b></div>
<br>
<form method="post" name="delform" 
	action="/boardMvc2Ora/deletePro.do?pageNum=${pageNum}" onsubmit="return deleteSave()">
	<input type="hidden" name="num" value="${num}">
	<table class="write">
		<tr>
			<td bgcolor="${value_c}" colspan="2"><b>글 삭제</b></td>
		</tr>
		<tr>
			<th>비밀번호를 입력해주세요.</th>
		</tr>
		<tr>
			<td><input type="password" maxlength="12" name="passwd"></td>
		</tr>
		<tr>
			<td bgcolor="${value_c}" colspan="2">
				<input type="submit" value="삭제">
				<input type="button" value="목록" onclick="window.location.href='/boardMvc2Ora/list.do'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>