package com.jsm.service.utils;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.jsm.common.config.SerialNumberNoConfig;
import com.jsm.common.utils.DatePattern;
import com.jsm.common.utils.FtpUtils;
import com.jsm.common.utils.Tools;
import com.jsm.dao.repository.SerialNumberRepository;
import com.jsm.pojo.sys.SerialNumber;

public class BaseService {
	
	protected static final Logger logger = Logger.getLogger(BaseService.class);

	@Resource
	FtpUtils ftpUtils;
	
	@Resource
	SerialNumberRepository serialNumberRepository;
	
	private static final Character[] DIC = new Character[]{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0'};
	
	private static final Character[] DIC_NUMBER = new Character[]{'1','2','3','4','5','6','7','8','9','0'};

	protected static final ThreadLocal<Random> random = new ThreadLocal<Random>(){
		protected Random initialValue() {
			return new Random();
		};
	};

	/**
	 * 生成加密基数
	 * @param len 基数长度
	 * @return 结果字符串
	 */
	protected String generateEncry(int len){
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < len; i++) {
			result.append(DIC[random.get().nextInt(36)]);
		}
		return result.toString();
	}
	
	/**
	 * 根据生成随机数字
	 * @param len 基数长度
	 * @return 结果字符串
	 */
	protected String generateNumber(int len){
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < len; i++) {
			result.append(DIC_NUMBER[random.get().nextInt(10)]);
		}
		return result.toString();
	}

	/**
	 * 生成编号
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	protected String generateNo(SerialNumberNoConfig config) {
		StringBuffer result = new StringBuffer(config.getPrefix());
		result.append(Tools.getDateToStr(DatePattern.YYYYMMDDD));
		serialNumberRepository.save(new SerialNumber(config.getColumnName()));
		Long count = serialNumberRepository.countByColumnName(config.getColumnName());
		result.append(String.format("%06d", count));
		return result.toString();
	}


	/**
	 * 文件上传,
	 * @param b byte数组
	 * @param fileName 文件名称
	 * @return 文件路径
	 */
	public String upload(byte[] b,String fileName){
		try {
			InputStream input = new ByteArrayInputStream(b);
			ftpUtils.uploadFile(fileName, input);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected void dosDbAction(int result) throws Exception{
		if(result != 1){
			throw new Exception("操作错误");
		}
	}
	
}
