package com.yeye.ohmykids;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;


@ComponentScan(basePackages = "com.yeye.ohmykids")   // com.yeye.ohmykids 패키지 아래에 있는 스프링빈들 탐색
@SpringBootApplication
public class OhmykidsApplication {

	public static void main(String[] args) {
		SpringApplication.run(OhmykidsApplication.class, args);
	}

}
