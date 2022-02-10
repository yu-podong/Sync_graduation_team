package com.vms.app.config;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
public class UtilConfig {

	@Bean
	@Scope("prototype")
	public ArrayList<String> stringList() {
		return new ArrayList<String>();
	}

	@Bean
	@Scope("prototype")
	public ArrayList<Boolean> booleanList() {
		return new ArrayList<Boolean>();
	}

	@Bean
	@Scope("prototype")
	public ArrayList<Integer> integerList() {
		return new ArrayList<Integer>();
	}

	@Bean
	@Scope("prototype")
	public HashMap<String, Object> map() {
		return new HashMap<String, Object>();
	}

}
