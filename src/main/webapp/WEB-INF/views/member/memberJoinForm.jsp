<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- jQuery 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../home/menu.jsp"/>
<div align="center">
	<div><h1>회 원 가 입</h1></div>
	<div>
		<form id="frm" action="memberJoin.do" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
			<div>
				<table border="1">
					<tr>
						<th width="150">* 아 이 디</th>
						<td colspan="3" width="450">
							<input type="email" id="id" name="id" placeholder="Your E-Mail..." required="required">
							&nbsp;&nbsp;
							<button type="button" onclick="isIdCheck()" id="btn" value="NoCheck">중복체크</button>
						</td>
					</tr>
					<tr>
						<th width="150">* 패스워드</th>
						<td width="150">
							<input type="password" id="password" name="password" placeholder="Your Password..." required="required">
						</td>
						<th width="150">* 패스워드 확인</th>
						<td width="150">
							<input type="password" id="password1" name="password1" placeholder="Your Password Check..." required="required">
						</td>
					</tr>
					<tr>
						<th width="150">* 이 름</th>
						<td width="150">
							<input type="text" id="name" name="name" placeholder="Your Name..." required="required">
						</td>
						<th width="150">전화번호</th>
						<td width="150">
							<input type="text" id="tel" name="tel" placeholder="Your Password Check...">
						</td>
					</tr>
					<tr>
						<th width="150">주 소</th>
						<td colspan="3" width="450">
							<input type="text" size="69" id="address" name="address" placeholder="Your Address...">
						</td>
					</tr>
					<tr>
						<th width="150">사 진</th>
						<td colspan="3" width="450">
							<input type="file" id="file" name="file">
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<button type="submit">회원가입</button>&nbsp;&nbsp;&nbsp;
				<button type="reset">취 소</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function isIdCheck() {
		var id = $("#id").val();	// 입력된 id값을 가져옴
		if(id != '') {	// 아이디가 비어있지 않을때 동작
			$.ajax({
				url : "idCheck.do",
				type : "post",
				data : {"id" : id},	// id 변수에서 가져온 id값을 담음 
				dataType : "text",
				success : function(result) {
					if(result == '1') {
						alert("사용 가능한 아이디입니다.");
						$("#btn").val("YesCheck");
						$("#btn").hide();
						$("#password").focus();
					} else{
						alert("이미 사용하는 아이디입니다.")
						$("#id").val('');
						$("#id").focus();
					}
				}
			});
		}
	}
	
	function formCheck() {	// 폼 내용 점검
		if($("#btn").val() != 'YesCheck') {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if($("#password").val() != $("#password1").val()) {
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
		return true;
	}
</script>

</body>
</html>