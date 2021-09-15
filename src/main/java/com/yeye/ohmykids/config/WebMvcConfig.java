package com.yeye.ohmykids.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") //url로 접근하고 싶은 path
		.addResourceLocations("file:///C:\\Users\\82109\\Desktop\\spring\\spring_test\\upload\\ohmykids\\images/");
	}
}
