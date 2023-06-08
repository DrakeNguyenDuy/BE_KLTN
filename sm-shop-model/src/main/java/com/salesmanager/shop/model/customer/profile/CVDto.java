package com.salesmanager.shop.model.customer.profile;

import java.util.Date;
import java.util.List;

public class CVDto {
	private String id;
	private String firstName;
	private String lastName;
	private String gender;
	private String title;
	private String dob;// date of birth
	private String address;
	private String introduce;
	private String goal;
	private List<WorkExperienceDto> workExperiences;
	private List<EducationDto> educations;
	private List<CertificateDto> certificates;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public List<WorkExperienceDto> getWorkExperiences() {
		return workExperiences;
	}

	public void setWorkExperiences(List<WorkExperienceDto> workExperiences) {
		this.workExperiences = workExperiences;
	}

	public List<EducationDto> getEducations() {
		return educations;
	}

	public void setEducations(List<EducationDto> educations) {
		this.educations = educations;
	}

	public List<CertificateDto> getCertificates() {
		return certificates;
	}

	public void setCertificates(List<CertificateDto> certificates) {
		this.certificates = certificates;
	}

}
