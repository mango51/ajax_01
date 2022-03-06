<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function getUsers(){
	$.ajax({
		url:"users", type: "get", dataType:"json",
		success:function(list){ // 성공 시 가져온 list 사용해서 함수 실행
			//$("#users").text(list)
			console.log(list)
			let h=""
//			h+="<b> 이름 : </b>"+list[0].name+"님<br>"
//			h+="<b> 나이 : </b>"+list[0].age+"살<br>"
			
			console.log(list.length)
			/*
			for(i=0;i<list.length;i++){
				h+="<b> 이름 : </b>"+list[i].name+"님<br>"
				h+="<b> 나이 : </b>"+list[i].age+"살<br>"
			}
			 */
			 
			 $.each(list, function(index, data){
				h+="<b> 이름 : </b>"+data.name+"님<br>"
				h+="<b> 나이 : </b>"+data.age+"살<br>"
			 }) //for each문 (jQuery문) >> 위의 주석 코드와 동일함
			 
			//$("#users").html(h) //html() 통해 html 형식으로 받아들이기 >> h값을!!! (html 반영해서 보여주기)
			
			$("#users").append(h) //내용 추가 (더 보기와 같은 기능)
			
		}
	})
}
function userInfo1(){
	
	$.ajax({
		url : "user?userId="+$("#userId").val(),
		type : "get", dataType : "json",
		success : function(data){
			let h=""
			h+="<b>이름 : </b>"+data.name+"님<br>"
			h+="<b>나이 : </b>"+data.age+"살 <br>"
			$("#users").html(h)
		}
	})
}

function userInfo2(){
	
	$.ajax({
		// user/홍길동0 과 같은 경로로 들어감
		url : "user/"+$("#userId").val(),
		type : "get", dataType : "json",
		success : function(data){
			let h=""
			h+="<b>이름 : </b>"+data.name+"님<br>"
			h+="<b>나이 : </b>"+data.age+"살 <br>"
			$("#users").html(h)
		}
	})
}

function modify(){
	name=$("#name").val()
	age =$("#age").val()
	form={age:age,name:name} // form 형식으로 age, name 안에 두기 >> 값은 age안에 age값, name 안에 name값 넣기
	$.ajax({
		url:"modify", type:"PUT", // 수정하기 위한 용도인 PUT
		dataType :"json", // 문자열(json)로 리턴 타입
		data:JSON.stringify(form), // age, name 데이터 들어 있는 form은 Object형이니 문자로 변환시키기
		contentType:"application/json;charset=utf-8",
		success:function(data){
			let h=""
			h+="<b>이름 : </b>"+data.name+"님<br>"
			h+="<b>나이 : </b>"+data.age+"살 <br>"
			$("#users").html(h)
		}
	})
}

function save(){
	let form = {} // 세트 기능 (Object타입)
	let arr = $("#frm").serializeArray()
	for(i=0;i<arr.length;i++){
		form[arr[i].name] = arr[i].value
		console.log(arr[i].name+" : "+arr[i].value)
		// name(key값) : value(해당 값)
		// uId : 입력한 아이디 값
		// uName : 입력한 이름 값
		// ... for문을 통해 진행
	}
	console.log('form : ', form)
	$.ajax({
		url:"save", type:"post", dataType:"json", data:JSON.stringify(form),
		contentType:"application/json;charset=utf-8",
		success:function(re){
			if(re.result==true) //가져온 값 result
				alert('성공!')
			else
				alert('동일한 아이디 존재')
		}
	})
}
</script>
</head>
<body>
	<span id="users">
	<!-- 내용 여기다가 추가-->
	</span>
	
	<hr>
	
	<button type="button" onclick="getUsers()">
	사용자 목록 보기
	</button> <!-- 클릭 시 위의 스크립트 함수 getUsers() 적용 -->
	<hr>
	<input type="text" id="userId">
	<hr>
	<button type="button" onclick="userInfo1()">
	개인 정보 보기 -1 
	</button>
	
	<button type="button" onclick="userInfo2()">
	개인 정보 보기 -2
	</button>
	
	<hr>
	이름 : <input type="text" id="name"><br>
	수정 나이 : <input type="text" id="age"><br>
	
	<button type ="button" onclick="modify()">
	 정보 수정  </button>
	 
	 <hr>
	 
	 <h3> 회원가입 페이지 </h3>
	 <form id="frm">
	 	아이디 : <input type="text" name="uId">
	 	이름 : <input type="text" name="uName">
	 	나이 : <input type="text" name="uAge">
	 	주소 : <input type="text" name="uAddr">
	 	번호 : <input type="text" name="uPhone">
	 	<input type="button" onclick="save()" value="회원가입">
	 </form>
</body>
</html>