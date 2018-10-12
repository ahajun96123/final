package com.jkl.hpot.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	/*--Board--*/
	private String id;
	private int bNum;
	private String bSubject;
	private String bContent;
	private Date bDate;
	private String bUrl;
	private int bReadcount;
	private double bGrade;
	private int bLikecount;
	private int bReportcount;
	private String bTag;
	private String bCategory;
	private String bWhich;
	private int bBlind;
	private String column;
	private String bThumbname;
	/*--페이징 외--*/
	private int start;
	private int end;
	private int inCate;
	private int inArray;
	private int inSearch;
	private String searchValue;
	private MultipartFile bThumb;
	private String idInfo;
	/*map 위도, 경도*/
	private String mapu;
	private String mapk;
	/*--평점,추천,신고--*/
	private double grade;
	private double gradeavg;
	private String reason;
	public BoardVO() {

	}
	
	
	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public double getGradeavg() {
		return gradeavg;
	}


	public void setGradeavg(double gradeavg) {
		this.gradeavg = gradeavg;
	}


	public double getGrade() {
		return grade;
	}


	public void setGrade(double grade) {
		this.grade = grade;
	}


	public String getIdInfo() {
		return idInfo;
	}

	public void setIdInfo(String idInfo) {
		this.idInfo = idInfo;
	}

	public MultipartFile getbThumb() {
		return bThumb;
	}

	public void setbThumb(MultipartFile bThumb) {
		this.bThumb = bThumb;
	}

	public String getbThumbname() {
		return bThumbname;
	}

	public void setbThumbname(String bThumbname) {
		this.bThumbname = bThumbname;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public int getInSearch() {
		return inSearch;
	}

	public void setInSearch(int inSearch) {
		this.inSearch = inSearch;
	}

	public int getInCate() {
		return inCate;
	}

	public void setInCate(int inCate) {
		this.inCate = inCate;
	}

	public int getInArray() {
		return inArray;
	}

	public void setInArray(int inArray) {
		this.inArray = inArray;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
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

	public String getbSubject() {
		return bSubject;
	}

	public void setbSubject(String bSubject) {
		this.bSubject = bSubject;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbUrl() {
		return bUrl;
	}

	public void setbUrl(String bUrl) {
		this.bUrl = bUrl;
	}

	public int getbReadcount() {
		return bReadcount;
	}

	public void setbReadcount(int bReadcount) {
		this.bReadcount = bReadcount;
	}

	public double getbGrade() {
		return bGrade;
	}

	public void setbGrade(double bGrade) {
		this.bGrade = bGrade;
	}

	public int getbLikecount() {
		return bLikecount;
	}

	public void setbLikecount(int bLikecount) {
		this.bLikecount = bLikecount;
	}

	public int getbReportcount() {
		return bReportcount;
	}

	public void setbReportcount(int bReportcount) {
		this.bReportcount = bReportcount;
	}

	public String getbTag() {
		return bTag;
	}

	public void setbTag(String bTag) {
		this.bTag = bTag;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getbWhich() {
		return bWhich;
	}

	public void setbWhich(String bWhich) {
		this.bWhich = bWhich;
	}

	public int getbBlind() {
		return bBlind;
	}

	public void setbBlind(int bBlind) {
		this.bBlind = bBlind;
	}

	public String getMapu() {
		return mapu;
	}

	public void setMapu(String mapu) {
		this.mapu = mapu;
	}

	public String getMapk() {
		return mapk;
	}

	public void setMapk(String mapk) {
		this.mapk = mapk;
	}

}
