package com.care.root;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

//@Configuration
@EnableScheduling // 스케쥴러 사용하겠다
public class MyScheduler {
	//@Scheduled(cron="*/10*****") //10초 마다 기능 실행
	public void test() {
		System.out.println("10초마다 실행");
	} // Spring Scheduler 검색해서 필요할 때 해당 기능 사용
}
