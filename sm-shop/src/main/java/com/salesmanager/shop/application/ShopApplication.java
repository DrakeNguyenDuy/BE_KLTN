package com.salesmanager.shop.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.groovy.template.GroovyTemplateAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;


//@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@EnableScheduling
@SpringBootApplication(exclude = {
		GroovyTemplateAutoConfiguration.class})
public class ShopApplication {
    public static void main(String[] args) {
        SpringApplication.run(ShopApplication.class, args);
    }

}
