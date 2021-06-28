<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<title>Board</title>

<c:if test="${check == 1}">
	<script type="text/javascript">
		alert("수정되었습니다.");
	</script>
	<meta http-equiv="Refresh" content="0;url=/boardMvc2Ora/list.do?pageNum=${pageNum}">	
</c:if>
<c:if test="${check == 0}">
	<script type="text/javascript">
		alert("비밀번호가 다릅니다.");
		history.back();
	</script>
</c:if>