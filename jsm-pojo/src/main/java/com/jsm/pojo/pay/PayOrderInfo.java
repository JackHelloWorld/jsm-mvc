package com.jsm.pojo.pay;

import java.io.Serializable;
import java.util.Date;

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
@Table(name="pay_order_info")
public class PayOrderInfo implements Serializable{

	private static final long serialVersionUID = 8333950565687146295L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	/**订单编号*/
	@Column(name="p_order_number")
	private String orderNumber;

	/**支付发起用户id*/
	@Column(name="p_data_id")
	private Long userInfoId;
	
	/**支付类型{1:微信,2:支付宝,3:银联支付}*/
	@Column(name="p_pay_type")
	private Integer payType;
	
	/**订单创建时间*/
	@Column(name="p_create_time")
	private Date createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
