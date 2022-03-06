<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function getF(){
	$.ajax({
		url:"rest", //모두가 rest(TestController 안에 있는 rest)에 도착 (물론 버튼에 따라 다른 함수 적용 >> 하지만 같은 공간 도착)
		type:"GET", // 여기서 달라짐 > 방식에 따라 적용되는 함수가 다르다!!!
		dataType:"json",
		success:function(data){
			$("#label").text(data.execute)
			// get() 함수 실행
		}
	})
}
function postF(){
	$.ajax({
		url:"rest", //모두가 rest에 도착
		type:"POST", // 여기서 달라짐 > 방식에 따라 적용되는 함수가 다르다!!!
		dataType:"json",
		success:function(data){
			$("#label").text(data.execute)
			// post() 함수 실행
		}
	})
}
function putF(){
	$.ajax({
		url:"rest", //모두가 rest에 도착
		type:"PUT", // 여기서 달라짐 > 방식에 따라 적용되는 함수가 다르다!!!
		dataType:"json",
		success:function(data){
			$("#label").text(data.execute)
			// put() 함수 실행
		}
	})
}
function deleteF(){
	$.ajax({
		url:"rest", //모두가 rest에 도착
		type:"DELETE", // 여기서 달라짐 > 방식에 따라 적용되는 함수가 다르다!!!
		dataType:"json",
		success:function(data){
			$("#label").text(data.execute)
			// delete() 함수 실행
		}
	})
}
	
</script>
</head>
<body>
<label id="label">	</label>
<br>
<button onclick="getF()">get방식</button>
<button onclick="postF()">post방식</button>
<button onclick="putF()">put방식</button>
<button onclick="deleteF()">delete방식</button>

</body>
</html>