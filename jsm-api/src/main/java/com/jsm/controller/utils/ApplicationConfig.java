package com.jsm.controller.utils;

import javax.annotation.Resource;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.jsm.service.ApplicationService;

/**
 * 系统初始化参数<br>字典数据相关加载
 * @author Jack
 *
 */
@Component("ApplicationConfig")
public class ApplicationConfig implements ApplicationListener<ContextRefreshedEvent> {

	@Resource
	ApplicationService service;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if(event.getApplicationContext().getParent() == null){
			service.initData();
		}
	}

}
