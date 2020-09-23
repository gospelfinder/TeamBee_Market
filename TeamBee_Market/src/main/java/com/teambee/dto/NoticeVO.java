package com.teambee.dto;

import java.util.Date;

public class NoticeVO {

	private int NOTICE_BNO;
	private String NOTICE_WRITER;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private Date  NOTICE_REGDATE;
	
	public int getNOTICE_BNO() {
		return NOTICE_BNO;
	}
	public void setNOTICE_BNO(int nOTICE_BNO) {
		NOTICE_BNO = nOTICE_BNO;
	}
	public String getNOTICE_WRITER() {
		return NOTICE_WRITER;
	}
	public void setNOTICE_WRITER(String nOTICE_WRITER) {
		NOTICE_WRITER = nOTICE_WRITER;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public Date getNOTICE_REGDATE() {
		return NOTICE_REGDATE;
	}
	public void setNOTICE_REGDATE(Date nOTICE_REGDATE) {
		NOTICE_REGDATE = nOTICE_REGDATE;
	}
	
	
}
