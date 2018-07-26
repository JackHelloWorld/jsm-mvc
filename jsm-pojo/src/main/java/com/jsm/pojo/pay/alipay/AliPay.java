package com.jsm.pojo.pay.alipay;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 支付宝订单信息
 * @author jack
 *
 */
@Entity
@Table(name="pay_alipay")
public class AliPay implements Serializable{

	private static final long serialVersionUID = 9215869568077817962L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	/**支付宝分配给开发者的应用id*/
	@Column(name="app_id")
	private String app_id = "";
	
	/**接口名称*/
	@Column(name="method")
	private String method = "";
	
	/**仅支持JSON*/
	@Column(name="format")
	private String format = "JSON";
	
	/**返回地址*/
	@Column(name="return_url")
	private String return_url = "";
	
	/**编码,默认utf-8*/
	@Column(name="charset")
	private String charset = "utf-8";
	
	/**商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2*/
	@Column(name="sign_type")
	private String sign_type = "RSA2";
	
	/**商户请求参数的签名串*/
	@Column(name="sign")
	private String sign = "";
	
	/**发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"*/
	@Column(name="timestamp")
	private String timestamp = "";
	
	/**调用的接口版本，固定为：1.0*/
	@Column(name="version")
	private String version = "1.0";
	
	/**支付宝服务器主动通知商户服务器里指定的页面http/https路径。*/
	@Column(name="notify_url")
	private String notify_url = "";
	
	/**biz_content*/
	@Column(name="biz_content")
	private Object biz_content;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getReturn_url() {
		return return_url;
	}

	public void setReturn_url(String return_url) {
		this.return_url = return_url;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public String getSign_type() {
		return sign_type;
	}

	public void setSign_type(String sign_type) {
		this.sign_type = sign_type;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	public Object getBiz_content() {
		return biz_content;
	}

	public void setBiz_content(Object biz_content) {
		this.biz_content = biz_content;
	}
	
	
}
