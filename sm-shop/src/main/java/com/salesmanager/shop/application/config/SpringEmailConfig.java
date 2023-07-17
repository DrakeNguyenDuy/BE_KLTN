package com.salesmanager.shop.application.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration

public class SpringEmailConfig {

//	@Value("${spring.mail.host}")
//	private String host;
//	
//	@Value("${spring.mail.username}")
//	private String userName;
//	
//	@Value("${spring.mail.password}")
//	private String password;
//	
//	@Value("${spring.mail.default-encoding}")
//	private String defualtEncoding;
//	
//	@Value("${spring.mail.port}")
//	private int port;
//	
//	@Value("${spring.mail.protocol}")
//	private String protocol;

	@Bean
	@Primary
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setUsername("ndlong28@gmail.com");
		mailSender.setPassword("gdajvxzcajgusfat");
		mailSender.setDefaultEncoding("UTF-8");
		mailSender.setPort(587);
		mailSender.setProtocol("smtp");
//		Properties properties = new Properties();
//		properties.put("mail.smtp.starttls.enable", true);
//		mailSender.setJavaMailProperties(properties);
		
		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		return mailSender;
	}

}
