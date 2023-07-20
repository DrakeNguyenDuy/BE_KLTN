package com.salesmanager.shop.model.recruitment;

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

}
