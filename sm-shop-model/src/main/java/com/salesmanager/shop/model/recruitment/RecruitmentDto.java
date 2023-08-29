package com.salesmanager.shop.model.recruitment;

import java.util.List;

public class RecruitmentDto {
	private String id;
	private Long idJob;
	private String nameJob;
	private String codeJob;
	private String nameAlumnus;
	private String nameCompany;
	private String cvId;
	private String status;
	private String applyDate;
	private String jobPosition;
	private String avartarAlumnus;
	private List<String> skills;
	private List<String> locations;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getIdJob() {
		return idJob;
	}

	public void setIdJob(Long idJob) {
		this.idJob = idJob;
	}

	public String getNameJob() {
		return nameJob;
	}

	public void setNameJob(String nameJob) {
		this.nameJob = nameJob;
	}

	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getCvId() {
		return cvId;
	}

	public void setCvId(String cvId) {
		this.cvId = cvId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getNameAlumnus() {
		return nameAlumnus;
	}

	public void setNameAlumnus(String nameAlumnus) {
		this.nameAlumnus = nameAlumnus;
	}

	public String getCodeJob() {
		return codeJob;
	}

	public void setCodeJob(String codeJob) {
		this.codeJob = codeJob;
	}

	public String getJobPosition() {
		return jobPosition;
	}

	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}

	public String getAvartarAlumnus() {
		return avartarAlumnus;
	}

	public void setAvartarAlumnus(String avartarAlumnus) {
		this.avartarAlumnus = avartarAlumnus;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

	public List<String> getLocations() {
		return locations;
	}

	public void setLocations(List<String> locations) {
		this.locations = locations;
	}

}
