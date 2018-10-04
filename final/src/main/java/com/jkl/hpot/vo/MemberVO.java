package com.jkl.hpot.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private int age;
	private String email;
	private String address;
	private String gender;
	private String approvalkey;
	private String approvalstatus;
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", age=" + age + ", email=" + email
				+ ", address=" + address + ", gender=" + gender + ", approvalkey=" + approvalkey + ", approvalstatus="
				+ approvalstatus + "]";
	}
	
	public MemberVO() {
		
	}
	
	
	public MemberVO(String id, String password, String name, int age, String email, String address, String gender, String approvalkey, String approvalstatus) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.approvalkey = approvalkey;
		this.approvalstatus = approvalstatus;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getApprovalkey() {
		return approvalkey;
	}

	public void setApprovalkey(String approvalkey) {
		this.approvalkey = approvalkey;
	}

	public String getApprovalstatus() {
		return approvalstatus;
	}

	public void setApprovalstatus(String approvalstatus) {
		this.approvalstatus = approvalstatus;
	}
}
