<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../home/menu.jsp"/>
<div align="center">
	<div><h1>회원정보 상세</h1></div>
	<div>
		<img src="resources/fileUpload/${member.pimgfile}"><br>
		${member.id}
	</div>
</div>
</body>
</html>