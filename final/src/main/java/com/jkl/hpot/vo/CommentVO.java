package com.jkl.hpot.vo;

import java.sql.Date;

public class CommentVO {
	private String id;
	private int bNum;
	private int cNum;
	private String cContent;
	private Date cDate;
	@Override
	public String toString() {
		return "CommentVO [id=" + id + ", bNum=" + bNum + ", cNum=" + cNum + ", cContent=" + cContent + ", cDate="
				+ cDate + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	
	
	
}
