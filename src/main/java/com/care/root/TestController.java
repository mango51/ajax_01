package com.care.root;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController	// ResponseBody 어노테이션 생략 가능한 기능
// 페이지를 리턴(이동)해주는 것이 아니라 "데이터"를 이동하는 것!! >> RestController
public class TestController {
	@GetMapping(value="rest", produces="application/json; charset=utf-8")
	public String get() {
		return "{\"execute\":\"get.데이터요청시\"}";
		// select (request)
	}
	@PostMapping(value="rest", produces="application/json; charset=utf-8")
	public String post() {
		return "{\"execute\":\"post.데이터추가\"}";
		// insert
	}
	@PutMapping(value="rest", produces="application/json; charset=utf-8")
	public String put() {
		return "{\"execute\":\"put.데이터수정시\"}";
		// update
	}
	@DeleteMapping(value="rest", produces="application/json; charset=utf-8")
	public String delete() {
		return "{\"execute\":\"delete.데이터삭제시\"}";
		// delete
	}
	
	static int cnt = 0;
	static Map<String, InfoDTO> DB = new HashMap<String, InfoDTO>();
	@GetMapping(value="users", produces="application/json; charset=utf-8")
	public ArrayList<InfoDTO> users(){
		ArrayList<InfoDTO> list= new ArrayList<InfoDTO>();
		for(int i =cnt; i<cnt+10;i++) {
			InfoDTO dto = new InfoDTO();
			dto.setName("홍길동"+i);
			dto.setAge(10+i);
			list.add(dto);
			DB.put("홍길동"+i, dto);
		}
		cnt+=10;
		return list;
	}
	
	@GetMapping(value="user", produces="application/json; charset=utf-8")
	public InfoDTO user1(@RequestParam String userId) { //@RequestParam String userId : 경로 받을 때 사용
		//service 연결 후 mapper > mapper.xml > select * from table where id=userId
		return DB.get(userId);
	}
	
	@GetMapping(value="user/{userId}", produces="application/json; charset=utf-8") // value 이 경로 "user/{userId}"로 받아옴
	// value="user/{u}" 로 들어올 경우 밑의 코드 매개변수 @PathVariable("u") String userId 로 작성하기 >> 가변적
	public InfoDTO user2(@PathVariable String userId) { 
		return DB.get(userId);
	}
	
	@PutMapping(value="modify", produces="application/json; charset=utf-8")
	public InfoDTO modify(@RequestBody InfoDTO dto) {
// service > mapper > update into table values(name, age) > dto = select * from table where name=name > return dto
		DB.replace(dto.getName(), dto);
		return DB.get(dto.getName());
	}
	
	@PostMapping(value="save", produces="application/json; charset=utf-8")
	public String save(@RequestBody Map<String,Object> map) {
		// Object로 불러오는 이유는 어떤 value값이 올 지 "모르니까" >> key값은 우선 string타입이니 우선 String 타입으로 가져오기
		/*
		 * insert into table values(...)
		 */
		System.out.println("======= 사용자가 입력한 값 출력 =========");
		System.out.println("id : "+map.get("uId"));
		System.out.println("name : "+map.get("uName"));
		System.out.println("age : "+map.get("uAge"));
		System.out.println("addr : "+map.get("uAddr"));
		System.out.println("phone : "+map.get("uPhone"));
		return "{\"result\":true}"; // true 반환 (우선 이렇게 둠)
		
		// 나중에 DB에서 가져와 insert하는데 primary key로 지정된 아이디값으로 중복될 수 없으니 나중에 false로 리턴함 
	}
}
