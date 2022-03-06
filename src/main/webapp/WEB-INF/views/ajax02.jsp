<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function ajax(){
		$.ajax({
			url : "ajax_result", type : "GET", 
			success : function(data){
				$("#count").text(data) 
				//count라는 아이디에 text형식으로 data 넣어주겠다
				console.log("성공");
			},
			error: function(){
				console.log("실패");
			}
		})
	}
</script>
</head>
<body>
	<h1>1</h1>
	<h1>2</h1>
	<h1>3</h1>
	<h1>4</h1>
	<h1>5</h1>
	<h1>6</h1>
	<button onclick="ajax()">클릭</button>
	<!-- 클라이언트에게 ajax() 스크립트 전달하기 >> 거기서 해석하여 실행함 (브라우저) -->
	<label id ="count"> 0 </label>
</body>
</html>