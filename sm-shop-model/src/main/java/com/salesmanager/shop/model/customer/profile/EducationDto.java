package com.salesmanager.shop.model.customer.profile;

public class EducationDto {
	private String id;
	private String school;
	private Boolean isGraduated;
	private String major;
	private String startDate;
	private String endDate;
	private String description;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Boolean getIsGraduated() {
		return isGraduated;
	}

	public void setIsGraduated(Boolean isGraduated) {
		this.isGraduated = isGraduated;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
