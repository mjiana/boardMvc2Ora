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
<body bgcolor="${bodyback_c}" onload="writeform.writer.focus()">
<div align="center"><b>BOARD</b></div>
<br>
<form method="post" name="writeform" 
	action="/boardMvc2Ora/updatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="${article.num}">
	<table class="write">
	<tr>
		<td bgcolor="${value_c}" colspan="2"><b>�� ����</b></td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">�̸�</th>
		<td><input type="text" maxlength="10" name="writer" value="${article.writer}"></td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">����</th>
		<td>
			<input type="text" maxlength="50" name="subject" value="${article.subject}"> 
		</td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">�̸���</th>
		<td><input type="text" maxlength="30" name="email" value="${article.email}"> </td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">����</th>
		<td><textarea name="content">${article.content}</textarea> </td>
	</tr>
	<tr>
		<th bgcolor="${value_c}">��й�ȣ</th>
		<td><input type="password" maxlength="12" name="passwd"> </td>
	</tr>
	<tr>
		<td bgcolor="${value_c}" colspan="2">
			<input type="submit" value="����">
			<input type="reset" value="�ٽ� �ۼ�">
			<input type="button" value="���" onclick="window.location.href='/boardMvc2Ora/list.do?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>
</body>
</html>