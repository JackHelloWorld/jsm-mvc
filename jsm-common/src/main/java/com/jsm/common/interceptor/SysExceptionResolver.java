package com.jsm.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.jsm.common.config.ResultDic;
import com.jsm.common.config.ResultTools;
import com.jsm.common.exception.BusinessException;

@Component("SysExceptionResolver")
public class SysExceptionResolver implements HandlerExceptionResolver{

	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) {

		if(exception != null){
			//打印错误信息
			exception.printStackTrace();
			ResultTools resultTools = null;
			if(exception instanceof BusinessException)
				resultTools = ((BusinessException)exception).getResultTools();
			else 
				resultTools = ResultTools.ERROR(ResultDic.SYS_ERROR);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json;charset=utf-8");
			try {
				String json = JSONObject.valueToString(resultTools);
				response.getWriter().write(json);
				response.getWriter().flush();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ModelAndView();
		}
		return new ModelAndView();
	}
}
