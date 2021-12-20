<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<!-- jQuery 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="menu.jsp"/>
<div align="center">
	<div><h1>Welcome to my Web-site</h1></div>
	<button type="button" onclick="memberList()">멤버리스트 ajax 호출</button>
	<div id="memberList"></div> <!-- 호출 결과 출력 -->
</div>

<script type="text/javascript">
	function memberList() {	// 넘어온 데이터를 가공해서 원하는 곳에 출력해줌
		$.ajax({
			url : "ajaxMemberList.do",
			dataType : "json",
			success : function(data) {
				// 데이터 존재시 html로 보여주기
				if(data.length > 0){
					viewHtml(data);
				}else{
					alert("데이터가 존재하지 않습니다.");
				}
				
			},
			error : function(){
				alert("데이터 가져오기 실패!")
			}
		});
	}
	
	function viewHtml(data) {
		var html = "<table border='1'>";
		html += "<br><tr>";
		html += "<th width='150'>아이디</th>";
		html += "<th width='150'>이 름</th>";
		html += "<th width='150'>전화번호</th>";
		html += "<th width='200'>주 소</th>";
		html += "<th width='150'>권 한</th></tr>";
		$(data).each(function(index, item) {	//	data를 item변수로 반복하겠다는 의미
			html += "<tr align='center'>";
			html += "<td>" + item.id + "</td>";
			html += "<td>" + item.name + "</td>";
			html += "<td>" + item.tel + "</td>";
			html += "<td>" + item.address + "</td>";
			html += "<td>" + item.author + "</td></tr>";
		});
		html += "</table>";
		html += "<br>";
		html += "<button type='button' onclick='closeData()'>";
		html += "데이터창 닫기</button>";
		$("#memberList").empty();
		$("#memberList").append(html);
	}
	
	function closeData() {
		$("#memberList").empty();
	}
</script>
</body>
</html>