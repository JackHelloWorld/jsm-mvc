package com.jsm.pojo.pay.alipay;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.jsm.common.config.alipay.AliPayApi;
import com.jsm.common.config.alipay.AliPayFieldType;

/**
 * 支付宝订单公共参数信息<a href="https://docs.open.alipay.com/203/107090/">查看详情</a>
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
	@AliPayApi(value="app_id",require=true)
	private String appId;
	
	/**接口名称*/
	@Column(name="method")
	@AliPayApi(value="app_id",require=true)
	private String method;
	
	/**仅支持JSON*/
	@Column(name="format")
	@AliPayApi(value="app_id")
	private String format = "JSON";
	
	/**返回地址*/
	@Column(name="return_url")
	@AliPayApi(value="return_url")
	private String returnUrl;
	
	/**编码,默认utf-8*/
	@Column(name="charset")
	@AliPayApi(value="charset",require=true)
	private String charset = "utf-8";
	
	/**商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2*/
	@Column(name="sign_type")
	@AliPayApi(value="sign_type",require=true)
	private String signType = "RSA2";
	
	/**商户请求参数的签名串*/
	@Column(name="sign")
	@AliPayApi(value="sign",require=true)
	private String sign;
	
	/**发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"*/
	@Column(name="timestamp")
	@AliPayApi(value="timestamp",require=true)
	private String timestamp;
	
	/**调用的接口版本，固定为：1.0*/
	@Column(name="version")
	@AliPayApi(value="version",require=true)
	private String version = "1.0";
	
	/**支付宝服务器主动通知商户服务器里指定的页面http/https路径。*/
	@Column(name="notify_url")
	@AliPayApi(value="notify_url",require=true)
	private String notifyUrl;
	
	/**biz_content*/
	@Column(name="biz_content")
	@AliPayApi(value="biz_content",require=true,type=AliPayFieldType.PARAMETERS)
	private String bizContent;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
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

	public String getReturnUrl() {
		return returnUrl;
	}

	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public String getSignType() {
		return signType;
	}

	public void setSignType(String signType) {
		this.signType = signType;
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

	public String getNotifyUrl() {
		return notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}

	public String getBizContent() {
		return bizContent;
	}

	public void setBizContent(String bizContent) {
		this.bizContent = bizContent;
	}

	
}
