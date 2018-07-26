package com.jsm.pojo.pay;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 支付订单信息
 * @author jack
 *
 */
@Entity
@Table(name="p_user_info")
public class UserInfo implements Serializable{

	private static final long serialVersionUID = -8995587747281734116L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	/**微信openid*/
	@Column(name="p_wechat_id")
	private String wechatId;
	
	/**支付宝数据id*/
	@Column(name="p_alipay_id")
	private String alipayId;
	
	/**对应数据id*/
	@Column(name="p_data_id")
	private String dataId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getWechatId() {
		return wechatId;
	}

	public void setWechatId(String wechatId) {
		this.wechatId = wechatId;
	}

	public String getAlipayId() {
		return alipayId;
	}

	public void setAlipayId(String alipayId) {
		this.alipayId = alipayId;
	}

	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	
}
