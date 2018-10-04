package com.jkl.hpot.vo;


public class UploadFile {

	private String id;
	private String fileName;
	private String saveFileName;
	private String contentType;
	private String filePath;
	private String sized;
	
	public UploadFile(){}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getSized() {
		return sized;
	}

	public void setSized(String sized) {
		this.sized = sized;
	}


	
}
