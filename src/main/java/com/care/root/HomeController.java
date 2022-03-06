package com.care.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 * view 파일 내의 코드 파일들 전반적으로 control
 * url에 매핑한 이름 작성하면 (ex. non_ajax, ajax02, rest01...) 해당 페이지 사이트로 이동함!!! 
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@GetMapping("non_ajax")
	public String nonAjax() {
		System.out.println("nonAjax 실행");
		return "non_ajax";
	}
	@GetMapping("ajax")
	public String ajax() {
		System.out.println("ajax 실행");
		return "ajax";
	}
	@GetMapping("ajax02")
	public String ajax02() {
		System.out.println("ajax02 실행");
		return "ajax02";
	}
	static int cnt= 0;
	@GetMapping("ajax_result") // ajax_02에서 버튼 클릭 시 여기로 이동
	@ResponseBody // 데이터를 돌려주겠다는 의미 (페이지로 이동 X >> ajax02.jsp에 ++cnt +""(ajax02에서는 data로 받음)값을 돌려준다!)
	// ResponseBody는 문자열 데이터를 돌려주는 기능의 어노테이션
	public String ajaxResult() {
		return ++cnt +"";
	}
	@GetMapping("ajax03")
	public String ajax03() {
		System.out.println("ajax03 실행");
		return "ajax03";
	}
	@PostMapping(value="ajax_result03", produces="application/json; charset=utf8") //produces : 이 형식으로 받을 것이다!
	@ResponseBody
	public InfoDTO ajaxResult03(@RequestBody InfoDTO dto) {
		System.out.println("name : "+dto.getName());
		System.out.println("age : "+dto.getAge());
		dto.setName("서버에서 변경 이름");
		dto.setAge(22222);
		return dto;
	}
	
	@GetMapping("ajax04")
	public String ajax04() {
		System.out.println("ajax04 실행");
		return "ajax04";
	}
	@PostMapping(value="ajax_result04", produces="application/json; charset=utf8") //produces : 이 형식으로 받을 것이다!
	@ResponseBody
	public Map<String, Object> ajaxResult04(@RequestBody Map<String,Object> map) {
		System.out.println("map.name : "+map.get("name"));
		System.out.println("map.addr : "+map.get("addr"));
		System.out.println("map.age : "+map.get("age"));
		return map;
	}
	
	@GetMapping("rest01")
	public String rest01(){
		return "rest01";
	}
	
	@GetMapping("getuser")
	public String getUser() {
		return "getuser";
	}
	
}
