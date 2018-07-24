package com.jsm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jsm.common.config.ResultTools;
import com.jsm.controller.utils.BaseController;
import com.jsm.service.utils.IgnoreToken;

@RestController
public class SysController extends BaseController{
	
	@IgnoreToken
	@GetMapping("/")
	public ResultTools toIndex(HttpServletRequest request){
		return ResultTools.SUCCESS("The service is running...");
	}

}
