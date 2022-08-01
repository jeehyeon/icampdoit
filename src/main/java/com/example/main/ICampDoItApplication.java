package com.example.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan( basePackages = { "com.example.model1", "com.example.controller", "com.exam.login" } )
public class ICampDoItApplication {

	public static void main(String[] args) {
		SpringApplication.run(ICampDoItApplication.class, args);
	}

}
