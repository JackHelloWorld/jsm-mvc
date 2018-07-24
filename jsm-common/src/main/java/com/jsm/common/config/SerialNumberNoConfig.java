package com.jsm.common.config;

/**
 * 序列号配置
 * @author Jack
 *
 */
public enum SerialNumberNoConfig {

	/**个人资料修改列号配置*/
	PERSONAL_DATA_MODIFICATION("ZL","PERSONAL_DATA_MODIFICATION"),
	
	/**实名认证序列号配置*/
	REA_AUTHENTICATION_CONFIG("RA","REA_AUTHENTICATION_CONFIG"),
	
	/**企业认证序列号配置*/
	COMPANY_AUTHENTICATION_CONFIG("CA","COMPANY_AUTHENTICATION_CONFIG"),
	
	/**融资认购序列号配置*/
	FINANCING_SUBSCRIPTION_CONFIG("RG","FINANCING_SUBSCRIPTION_CONFIG");
	
	private String prefix;
	
	private String columnName;
	
	SerialNumberNoConfig(String prefix,String columnName){
		this.columnName = columnName;
		this.prefix = prefix;
	}

	public String getPrefix() {
		return prefix;
	}

	public String getColumnName() {
		return columnName;
	}
	
	
	
}
