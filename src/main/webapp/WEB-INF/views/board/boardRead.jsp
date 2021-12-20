<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
<jsp:include page="../home/menu.jsp"/>
<div align="center">
	<div><h1>게시글 상세</h1></div>
	<div>
		<c:if test="${message eq null }">
			<div>
				<table border="1">
					<tr>
						<th width="100">글번호</th>
						<td width="100" align="center">${board.no }</td>
						<th width="100">작성자</th>
						<td width="150" align="center">${board.name }</td>
						<th width="100">작성일자</th>
						<td width="150" align="center">${board.wdate }</td>
					</tr>
					<tr>
						<th>제 목</th>
						<td colspan="5">${board.title }</td>
					</tr>
					<tr>
						<th>내 용</th>
						<td colspan="5">
							<textarea rows="10" cols="80">${board.subject}</textarea>
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<button type="button" onclick="location.href='noticeList.do'">목록가기</button>&nbsp;&nbsp;
				<c:if test="${id eq board.writer}">
					<button type="button" onclick="editFunction(${board.no})">글 수정</button>&nbsp;&nbsp;
					<button type="button" onclick="deleteFunction(${board.no})">글 삭제</button>
				</c:if>
				<c:if test="${author eq 'ADMIN' }">
					<button type="button" onclick="deleteFunction(${board.no})">글 삭제</button>
				</c:if>
			</div>
		</c:if>
		<c:if test="${message != null }">
			<div><h1>${message }</h1></div>
			<button type="button" onclick="location.href='noticeList.do'">목록가기</button>
		</c:if>
		<div>
			<form id="frm" method="post">
				<input type="hidden" id="no" name="no">
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function deleteFunction(no) {
		frm.no.value = no;
		frm.action = "boardDelete.do";
		frm.submit();
	}
	
	function editFunction(no) {
		frm.no.value = no;
		frm.action = "boardUpdate.do";
		frm.submit();
	}
</script>
</body>
</html>