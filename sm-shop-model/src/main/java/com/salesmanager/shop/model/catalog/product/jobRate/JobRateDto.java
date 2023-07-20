package com.salesmanager.shop.model.catalog.product.jobRate;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class JobRateDto {
	private String id;
	private Long idJob;
	private String nameJob;
	private String codeJob;
	private String dateRating;
	private String nameCompany;
	private String nameAlumnus;
	private Long alumnusId;
	private String alumnusUsername;

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

	public String getDateRating() {
		return dateRating;
	}

	public void setDateRating(String dateRating) {
		this.dateRating = dateRating;
	}

	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getNameAlumnus() {
		return nameAlumnus;
	}

	public void setNameAlumnus(String nameAlumnus) {
		this.nameAlumnus = nameAlumnus;
	}

	public Long getAlumnusId() {
		return alumnusId;
	}

	public void setAlumnusId(Long alumnusId) {
		this.alumnusId = alumnusId;
	}

	public String getCodeJob() {
		return codeJob;
	}

	public void setCodeJob(String codeJob) {
		this.codeJob = codeJob;
	}

	public String getAlumnusUsername() {
		return alumnusUsername;
	}

	public void setAlumnusUsername(String alumnusUsername) {
		this.alumnusUsername = alumnusUsername;
	}

}
