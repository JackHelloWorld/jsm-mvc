package com.jm.controller.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import com.jsm.common.config.ResultCode;
import com.jsm.common.config.ResultTools;
import com.jsm.common.exception.BusinessException;
import com.jsm.common.utils.Tools;

/**
 * 控制器父类
 * @author LiuJack
 * 
 * @version 1.0
 *
 */
public class BaseController {

	/**
	 * 将map数据分别设置到request作用域
	 * @param request
	 * @param result
	 */
	protected void setAttribute(HttpServletRequest request,Map<String, Object> result){
		for (String key : result.keySet()) {
			request.setAttribute(key, result.get(key));
		}
	}

	public String getBase64Param(HttpServletRequest request,String paramName){
		String value = request.getParameter(paramName);
		if(Tools.isEmpty(value)) return value;
		try {
			Class<?> clazz=Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");
			Method mainMethod= clazz.getMethod("decode", String.class);  
			mainMethod.setAccessible(true);  
			byte[] ret=(byte[])mainMethod.invoke(null, value);
			return new String(ret);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String uploadLocal(MultipartFile img) throws Exception{
		if(img!=null && img.getSize()>0){
			try {
				if(img.getOriginalFilename()==null || img.getOriginalFilename().trim().length()==0)
						throw new BusinessException(ResultTools.DIY_ERROR(ResultCode.DataErrorCode, "文件名称不能为空"));
				String newFileName = Tools.MD5(img.getBytes());
				int i = img.getOriginalFilename().trim().lastIndexOf('.');
				if(i!=-1){
					newFileName = newFileName+img.getOriginalFilename().substring(i, img.getOriginalFilename().trim().length());
				}
				String pathDirs = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/static/file/images"); 
				File dirs = new File(pathDirs);
				File file = new File(pathDirs.concat("/").concat(newFileName));
				if(!dirs.exists()){
					dirs.mkdirs();
				}
				if(!file.exists()){
					OutputStream outputStream = new FileOutputStream(file);
					outputStream.write(img.getBytes());
					outputStream.close();
				}
				return newFileName;
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception(e.getMessage());
			}
		}
		return null;
	}

}
