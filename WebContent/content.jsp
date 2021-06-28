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
</head>
<body bgcolor="${bodyback_c}">
<div align="center"><b>BOARD</b></div>
<br>
<form>
	<table class="content">
		<tr>
			<th colspan="4" bgcolor="${value_c}">�� ����</th>
		</tr>
		<tr>
			<th bgcolor="${value_c}">�� ��ȣ</th>
			<td>${article.num}</td>
			<th bgcolor="${value_c}">��ȸ��</th>
			<td>${article.readcount}</td>
		</tr>
		<tr>
			<th bgcolor="${value_c}">�ۼ���</th>
			<td>${article.writer}</td>
			<th bgcolor="${value_c}">�ۼ���</th>
			<td>${fn:substring(article.reg_date,0,16)}</td>
		</tr>
		<tr>
			<th bgcolor="${value_c}">��  ��</th>
			<td colspan="3"><b>${article.subject}</b></td>
		</tr>
		<tr>
			<th bgcolor="${value_c}">��  ��</th>
			<td colspan="3"><pre>${article.content}</pre></td>
		</tr>
		<tr>
			<td colspan="4" bgcolor="${value_c}">
				<input type="button" value="����"
					 onclick="document.location.href='/boardMvc2Ora/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
				<input type="button" value="����"
					 onclick="document.location.href='/boardMvc2Ora/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
				<input type="button" value="���"
					 onclick="document.location.href='/boardMvc2Ora/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
				<input type="button" value="�ڷ�"
					 onclick="history.back()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>