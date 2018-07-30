package com.jsm.pojo.pay.alipay;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.jsm.common.config.alipay.AliPayApi;

/**
 * 支付宝支付参数信息<br>
 * <a href="https://docs.open.alipay.com/203/107090/">查看详情</a>
 * 支付宝订单支付提交提交参数
 * @author jack
 *
 */
@Entity
@Table(name="pay_alipay_param")
public class PayParam implements Serializable{

	private static final long serialVersionUID = 6987188192645984574L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	/**对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。*/
	@Column(name="p_body")
	@AliPayApi(value="body")
	private String body;
	
	/**商品的标题/交易标题/订单标题/订单关键字等*/
	@Column(name="p_subject")
	@AliPayApi(value="subject",require=true)
	private String subject;
	
	/**商户网站唯一订单号*/
	@Column(name="p_out_trade_no")
	@AliPayApi(value="out_trade_no",require=true)
	private String outTradeNo;
	
	/**该笔订单允许的最晚付款时间，逾期将关闭交易。
	 * 取值范围：1m～15d。m-分钟，h-小时，d-天，
	 * 1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 
	 * 该参数数值不接受小数点， 如 1.5h，可转换为 90m。注：若为空，则默认为15d。*/
	@Column(name="p_timeout_express")	
	@AliPayApi(value="timeout_express")
	private String timeoutExpress;
	
	/**绝对超时时间，格式为yyyy-MM-dd HH:mm。 注：1）
	 * 以支付宝系统时间为准；2）如果和timeout_express参数同时传入，以time_expire为准。*/
	@Column(name="p_time_expire")
	@AliPayApi(value="time_expire")
	private String timeExpire;
	
	/**订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]*/
	@Column(name="p_total_amount")
	@AliPayApi(value="total_amount",require=true)
	private String totalAmount;
	
	/**针对用户授权接口，获取用户相关数据时，用于标识用户授权关系注：
	 * 若不属于支付宝业务经理提供签约服务的商户，暂不对外提供该功能，该参数使用无效。*/
	@Column(name="p_auth_token")
	@AliPayApi(value="auth_token")
	private String authToken;
	
	/**销售产品码，商家和支付宝签约的产品码。该产品请填写固定值：QUICK_WAP_WAY*/
	@Column(name="p_product_code")
	@AliPayApi(value="product_code",require=true)
	private String productCode;
	
	/**商品主类型：0—虚拟类商品，
	 * 1—实物类商品注：虚拟类商品不支持使用花呗渠道*/
	@Column(name="p_goods_type")
	@AliPayApi(value="goods_type")
	private String goodsType;
	
	/**公用回传参数，如果请求时传递了该参数，则返回给商户时会回传该参数。
	 * 支付宝会在异步通知时将该参数原样返回。
	 * 本参数必须进行UrlEncode之后才可以发送给支付宝*/
	@Column(name="p_passback_params")
	@AliPayApi(value="passback_params")
	private String passbackParams;
	
	/**优惠参数注：仅与支付宝协商后可用	*/
	@Column(name="p_promo_params")
	@AliPayApi(value="promo_params")
	private String promoParams;
	
	/**业务扩展参数	*/
	@Column(name="p_extend_params")
	@AliPayApi(value="extend_params")
	private String extendParams;
	
	/**可用渠道，用户只能在指定渠道范围内支付当有多个渠道时用“,”分隔注：与disable_pay_channels互斥*/
	@Column(name="p_enable_pay_channels")
	@AliPayApi(value="enable_pay_channels")
	private String enablePayChannels;
	
	/**禁用渠道，用户不可用指定渠道支付当有多个渠道时用“,”分隔注：与enable_pay_channels互斥*/
	@Column(name="p_disable_pay_channels")
	@AliPayApi(value="disable_pay_channels")
	private String disablePayChannels;
	
	/**商户门店编号。该参数用于请求参数中以区分各门店，非必传项。*/
	@Column(name="p_store_id")
	@AliPayApi(value="store_id")
	private String storeId;
	
	/**添加该参数后在h5支付收银台会出现返回按钮，可用于用户付款中途退出并返回到该参数指定的商户网站地址。注：该参数对支付宝钱包标准收银台下的跳转不生效。*/
	@Column(name="p_quit_url")
	@AliPayApi(value="quit_url")
	private String quitUrl;
	
	/**外部指定买家*/
	@Column(name="p_ext_user_info")
	@AliPayApi(value="ext_user_info")
	private String extUserInfo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getOutTradeNo() {
		return outTradeNo;
	}

	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	public String getTimeoutExpress() {
		return timeoutExpress;
	}

	public void setTimeoutExpress(String timeoutExpress) {
		this.timeoutExpress = timeoutExpress;
	}

	public String getTimeExpire() {
		return timeExpire;
	}

	public void setTimeExpire(String timeExpire) {
		this.timeExpire = timeExpire;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getAuthToken() {
		return authToken;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getPassbackParams() {
		return passbackParams;
	}

	public void setPassbackParams(String passbackParams) {
		this.passbackParams = passbackParams;
	}

	public String getPromoParams() {
		return promoParams;
	}

	public void setPromoParams(String promoParams) {
		this.promoParams = promoParams;
	}

	public String getExtendParams() {
		return extendParams;
	}

	public void setExtendParams(String extendParams) {
		this.extendParams = extendParams;
	}

	public String getEnablePayChannels() {
		return enablePayChannels;
	}

	public void setEnablePayChannels(String enablePayChannels) {
		this.enablePayChannels = enablePayChannels;
	}

	public String getDisablePayChannels() {
		return disablePayChannels;
	}

	public void setDisablePayChannels(String disablePayChannels) {
		this.disablePayChannels = disablePayChannels;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getQuitUrl() {
		return quitUrl;
	}

	public void setQuitUrl(String quitUrl) {
		this.quitUrl = quitUrl;
	}

	public String getExtUserInfo() {
		return extUserInfo;
	}

	public void setExtUserInfo(String extUserInfo) {
		this.extUserInfo = extUserInfo;
	}

}
