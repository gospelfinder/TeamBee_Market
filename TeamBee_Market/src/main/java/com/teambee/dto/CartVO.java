package com.teambee.dto;

public class CartVO {

	private int CART_BNO;
	private String MEMBER_ID;
	private String MEMBER_NAME;
	private int PRODUCT_BNO;
	private String PRODUCT_TITLE;
	private int AMOUNT;
	private int MONEY;
	private int PRODUCT_PRICE;
	private String PRODUCT_IMG;
	
	
	
	
	
	public String getPRODUCT_TITLE() {
		return PRODUCT_TITLE;
	}
	public void setPRODUCT_TITLE(String pRODUCT_TITLE) {
		PRODUCT_TITLE = pRODUCT_TITLE;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public int getCART_BNO() {
		return CART_BNO;
	}
	public void setCART_BNO(int cART_BNO) {
		CART_BNO = cART_BNO;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getPRODUCT_BNO() {
		return PRODUCT_BNO;
	}
	public void setPRODUCT_BNO(int pRODUCT_BNO) {
		PRODUCT_BNO = pRODUCT_BNO;
	}
	public int getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(int aMOUNT) {
		AMOUNT = aMOUNT;
	}

	public int getMONEY() {
		return MONEY;
	}
	public void setMONEY(int mONEY) {
		MONEY = mONEY;
	}
	public int getPRODUCT_PRICE() {
		return PRODUCT_PRICE;
	}
	public void setPRODUCT_PRICE(int pRODUCT_PRICE) {
		PRODUCT_PRICE = pRODUCT_PRICE;
	}
	public String getPRODUCT_IMG() {
		return PRODUCT_IMG;
	}
	public void setPRODUCT_IMG(String pRODUCT_IMG) {
		PRODUCT_IMG = pRODUCT_IMG;
	}
	
	
}
