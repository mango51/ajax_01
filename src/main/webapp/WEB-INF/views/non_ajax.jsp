<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function nonAjax(){
		location.href="non_ajax"
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
	<button onclick="nonAjax()">클릭</button>
	<!-- 클릭 시 현재 페이지 다시 새로고침됨 >> nonAjax()를 클라이언트에게 주어 스크립트 태그 브라우저에서 해석하기 -->
</body>
</html>