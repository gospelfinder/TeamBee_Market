package com.teambee.dto;

import java.util.Date;

public class OrderVO {

	private int ORDER_BNO;
	private String ORDER_STATUS;
	private String PRODUCT_TITLE;
	private String MEMBER_ID;
	private Date ORDER_DATE;
	private int ORDER_AMOUNT;
	private int PRODUCT_BNO;
	
	public int getORDER_BNO() {
		return ORDER_BNO;
	}
	public void setORDER_BNO(int oRDER_BNO) {
		ORDER_BNO = oRDER_BNO;
	}
	public String getORDER_STATUS() {
		return ORDER_STATUS;
	}
	public void setORDER_STATUS(String oRDER_STATUS) {
		ORDER_STATUS = oRDER_STATUS;
	}
	public String getPRODUCT_TITLE() {
		return PRODUCT_TITLE;
	}
	public void setPRODUCT_TITLE(String pRODUCT_TITLE) {
		PRODUCT_TITLE = pRODUCT_TITLE;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public Date getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(Date oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	
	public int getORDER_AMOUNT() {
		return ORDER_AMOUNT;
	}
	public void setORDER_AMOUNT(int oRDER_AMOUNT) {
		ORDER_AMOUNT = oRDER_AMOUNT;
	}
	public int getPRODUCT_BNO() {
		return PRODUCT_BNO;
	}
	public void setPRODUCT_BNO(int pRODUCT_BNO) {
		PRODUCT_BNO = pRODUCT_BNO;
	}
	
	
	
	
	
}
