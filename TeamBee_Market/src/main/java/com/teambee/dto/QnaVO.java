package com.teambee.dto;

import java.sql.Date;

public class QnaVO {
	
	private int QNA_BNO;
	private String QNA_TITLE;
	private String QNA_CONTENT;
	private String QNA_WRITER;
	private String QNA_REPLY;
	private Date QNA_REGDATE;
	
	public int getQNA_BNO() {
		return QNA_BNO;
	}


	public void setQNA_BNO(int qNA_BNO) {
		QNA_BNO = qNA_BNO;
	}


	public String getQNA_TITLE() {
		return QNA_TITLE;
	}


	public void setQNA_TITLE(String qNA_TITLE) {
		QNA_TITLE = qNA_TITLE;
	}


	public String getQNA_CONTENT() {
		return QNA_CONTENT;
	}


	public void setQNA_CONTENT(String qNA_CONTENT) {
		QNA_CONTENT = qNA_CONTENT;
	}


	public String getQNA_WRITER() {
		return QNA_WRITER;
	}


	public void setQNA_WRITER(String qNA_WRITER) {
		QNA_WRITER = qNA_WRITER;
	}


	public String getQNA_REPLY() {
		return QNA_REPLY;
	}


	public void setQNA_REPLY(String qNA_REPLY) {
		QNA_REPLY = qNA_REPLY;
	}


	public Date getQNA_REGDATE() {
		return QNA_REGDATE;
	}


	public void setQNA_REGDATE(Date qNA_REGDATE) {
		QNA_REGDATE = qNA_REGDATE;
	}


}
