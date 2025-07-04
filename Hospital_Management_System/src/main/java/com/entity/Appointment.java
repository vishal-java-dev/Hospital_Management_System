package com.entity;

public class Appointment {
	private int id;
	private int userId;
	private String fullname;
	private String gender;
	private String age;
	private String apoinDate;
	private String email;
	private String phNo;
	private String diseases;
	private int doctorId;
	private String address;
	
	public Appointment() {
		super();
		
	}
	private String status;

	public Appointment(int userId, String fullname, String gender, String age, String apoinDate, String email,
			String phNo, String diseases, int doctorId, String address, String status) {
		super();
		this.userId = userId;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.apoinDate = apoinDate;
		this.email = email;
		this.phNo = phNo;
		this.diseases = diseases;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getApoinDate() {
		return apoinDate;
	}

	public void setApoinDate(String apoinDate) {
		this.apoinDate = apoinDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhNo() {
		return phNo;
	}

	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}

	public String getDiseases() {
		return diseases;
	}

	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
