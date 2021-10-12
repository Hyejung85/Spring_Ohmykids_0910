package com.yeye.ohmykids.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yeye.ohmykids.common.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") //url로 접근하고 싶은 path
		.addResourceLocations("file:///C:\\Users\\82109\\Desktop\\spring\\spring_test\\upload\\ohmykids\\images/");
		//.addResourceLocations("file:/home/ec2-user/upload_images/");
	}
	
	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**") //어느 경로에 들어갈때 interceptor를 거쳐가게 할지
		.excludePathPatterns("/static/**", "/user/sign_out");
	}
}
