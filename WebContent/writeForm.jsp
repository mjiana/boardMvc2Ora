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
<body bgcolor="${bodyback_c}">
<div align="center"><b>글쓰기</b></div>
<br>
<form method="post" name="writeform" 
	action="/boardMvc2Ora/writePro.do" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">
<input type="hidden" name="re_level" value="${re_level}">

<table>
	<tr>
		<td bgcolor="${value_c}" colspan="2">
			<a href="/boardMvc2Ora/list.do">글목록</a>
		</td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">이름</th>
		<td><input type="text" maxlength="10" name="writer"> </td>
	</tr>
</table>
</form>
</body>
</html>