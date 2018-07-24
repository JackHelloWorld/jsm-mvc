package com.jsm.common.config;

/**
 * 参数配置常量类
 * @author liuJack
 *
 */
public class Const {

	/**
	 * Redis相关
	 * @author liuJack
	 *
	 */

	public static final class Page{

		/**默认页大小*/
		public static Integer pageSize;

		/**默认当前页*/
		public static Integer currentPage;
	}

	public static final class ServletConfig{
		/**作用域中,登录后保存用户的名称*/
		public static final String SessionUser = "session_user";
	}
	
	
	public static final class DIC_DATA{
		
		/**结算方式/类别*/
		public static final String PAY_TYPE = "DIC_PAY_TYPE";
		
		/**凭证号类型*/
		public static final String DIC_PINGZHENGHAO_TYPE = "DIC_PINGZHENGHAO_TYPE";
		
		/**出纳费用类别*/
		public static final String DIC_CHUNA_TYPE = "DIC_CHUNA_TYPE";
		
		/**出纳业务类型*/
		public static final String DIC_CHUNA_F_BUSINESS_TYPE = "DIC_CHUNA_F_BUSINESS_TYPE";
		
		/**用户自定义类别*/
		public static final String DIC_OTHER_TYPE = "DIC_OTHER_TYPE";
		
	}
	
	/**
	 * 当前发布模式
	 */
	public static final boolean IS_TEST = true;
	
	/**
	 * 公司编号长度
	 */
	public static final int COMPANY_NO_LEN = 8;
	
	/**
	 * 用户默认密码
	 */
	public static final String USER_DEFAULT_PWD = "123456";
	
	/**户号的长度*/
	public static final Integer NO_LENGTH = 12;
	
	public static final class FTP{
		
		public static final String LoginName = "";
		
		public static final String password = "";
		
		public static final String IP = "";
		
		public static final Integer PROT = 2121;
		
		public static final String staticImages = "";
		
	}
	
	/**
	 * 字典对应code编码
	 * @author liuji
	 *
	 */
	public static final class DICTCODE{
		
		/**民族*/
		public static final String NATION = "DX001";
		
		/**婚姻状况*/
		public static final String MARITAL_STATUS = "DX002";
		
		/**职业*/
		public static final String PROFESSION = "DX003";
		
		/**学历*/
		public static final String EDUCATION = "DX004";
		
		/**所学专业*/
		public static final String PROFESSIONAL = "DX005";
		
		/**星座*/
		public static final String CONSTELLATION = "DX006";
		
		/**年龄筛选*/
		public static final String AGE_SCREENING = "DX007";
		
		/**融资金额筛选*/
		public static final String SCREENING_FINANCING_AMOUNT = "DX008";
		
		/**融资项目题材*/
		public static final String FINANCING_PROJECT_SUBJECT = "DX009";
		
		/**融资项目类型*/
		public static final String TYPES_FINANCING_PROJECTS = "DX010";
		
		/**作品制作国家/地区*/
		public static final String FILMS_MAKING_COUNTRIES = "DX011";
		
		/**作品语言*/
		public static final String FILMS_LANGUAGE = "DX012";
		
		/**影视作品类型*/
		public static final String FILMS_TYPE = "DX013";
		
		
	}
	
	
}
