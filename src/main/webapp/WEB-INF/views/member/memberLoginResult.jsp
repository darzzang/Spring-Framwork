<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<jsp:include page="../home/menu.jsp"/>
<div align="center">
	<div>
	<c:if test="${name != null}">
		<h1>${name} ${message}</h1>
	</c:if>
	<c:if test="${name eq null}">
		<h1>${message}</h1>
	</c:if>	
	</div>
</div>
</body>
</html>