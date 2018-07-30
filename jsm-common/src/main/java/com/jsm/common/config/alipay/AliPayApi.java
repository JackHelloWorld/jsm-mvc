package com.jsm.common.config.alipay;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 支付宝提交公共数据校验
 * @author jack
 *
 */
@Target({ElementType.TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AliPayApi {

	/**是否为必须项*/
	boolean require() default false;
	
	/**类型*/
	AliPayFieldType type() default AliPayFieldType.GENERAL;

	/**参数名称*/
	String value();
	
}
