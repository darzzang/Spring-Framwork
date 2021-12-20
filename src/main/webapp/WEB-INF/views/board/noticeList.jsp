<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#tb:hover tbody tr:hover td{
		background: lightgreen;
		color: white;
	}
</style>
<!-- jQuery 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../home/menu.jsp"/>
<div align="center">
	<div><h1>공지사항 목록</h1></div>
	<div>
		<form id="frm">
			<select id="key" name="key">
				<option value="" selected="selected">전 체</option>
				<option value="title">제 목</option>
				<option value="subject">내 용</option>
				<option value="wdate">작성일자</option>
			</select>&nbsp;
			<input type="text" id="val" name="val" placeholder="검색할 내용을 입력하세요.">
			<input type="button" value="검색" onclick="BoardSearch();">
		</form>
	</div><br>
	<div>
		<table border="1" id="tb">
			<thead>
				<tr>
					<th width="100">글번호</th>
					<th width="300">제 목</th>
					<th width="150">작성자</th>
					<th width="150">작성일자</th>
					<th width="70">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boards}" var="board">
					<tr onclick="BoardRead(${board.no})">
						<td align="center">${board.no}</td>
						<td align="center">${board.title}</td>
						<td align="center">${board.name}</td>
						<td>${board.wdate}</td>
						<td>${board.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><br>
	<div>
		<c:if test="${id != null}">
			<button type="button" onclick="location.href='boardForm.do'">글쓰기</button>
		</c:if>
	</div>
	<div>
		<form id="readForm" method="post">
			<input type="hidden" id="no" name="no">
		</form>
	</div>
</div>
<script type="text/javascript">
	function BoardRead(n) {
		readForm.no.value = n;
		readForm.action = "boardRead.do";
		readForm.submit();
	}
	function BoardSearch() {
		var key = $("#key").val();
		var val = $("#val").val();
		$.ajax({
			url : "ajaxBoardSearch.do",
			type : "post",
			data : {"key" : key, "val" : val},
			dataType : "json",
			success : function(data) {
				console.log(data);
				if(data.length > 0){
					resultHtml(data);
				}else{
					alert("해당되는 데이터가 존재하지 않습니다.");
				}
			},
			error : function() {
				alert("데이터 검색이 실패했습니다.");
			}
		});
	}
	
	function resultHtml(data){
		// 데이터 출력
		$("tbody").empty();
		$(data).each(function(index, item) {
			var row = $("<tr onclick='BoardRead(" + item.no + ")'/>");
			row.append(
				$("<td align='center'/>").text(item.no),
				$("<td/>").text(item.title),
				$("<td align='center'/>").text(item.name),
				$("<td align='center'/>").text(item.wdate),
				$("<td align='center'/>").text(item.hit),
			);
			
			$("tbody").append(row);
		});
	}
	
</script>
</body>
</html>