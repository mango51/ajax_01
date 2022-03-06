<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function ajax1(){
		var n = document.getElementById("name").value;
		// name 값 가져와 n 변수에 넣기 >> 자바스크립트 문법 사용
		var a = $("#age").val();
		// jQuery 문법 사용, #id명 >> 으로 불러옴
		var form = {age:a, name:n}
		console.log(form)
		
		$.ajax({
			url : "ajax_result04",
			type: "post",
			data : JSON.stringify(form), //서버로 전송할 데이터
			// form은 Object 타입이라서 JSON 사용하여 문자열로 바꿔줌
			// 서버로 전송할 데이터 타입 지정해서 보내주는 것 (contentType)
			contentType : "application/json; charset=utf-8", // 내가 보내는 data인 form의 contenttype
			//json : 문자열 타입
			dataType : "json",
			//리턴으로 돌아오는 값의 데이터타입 (dataType) >> 리턴타입
			success:function(result){
				console.log('result : '+result)
				console.log('result : '+result.name)
				console.log('result : '+result.age)
				$("#label").text(result.name+result.age)
			},
			error:function(){
				alert('문제 발생')
			}
		})
	}
</script>
</head>
<body>
	name : <input type="text" id="name"><br>
	age : <input type="text" id="age"><br>
	<input type="button" onclick="ajax1()" value="클릭">
	<br>
	결과 : <label id="label"></label>
</body>
</html>