package com.salesmanager.core.model.customer.profile;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "WORK_EXPERIENCE")
public class WorkExperience {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@Column(name = "TITILE_POSITION", nullable = false)
	private String titlePosition;

	@Column(name = "COMPANY_NAME", nullable = false)
	private String companyName;

	@Column(name = "START_DATE", nullable = false)
	private Date startDate;

	@Column(name = "END_DATE", nullable = true)
	private Date endDate;

	@Column(name = "DESCRIPTION", nullable = false, columnDefinition = "TEXT")
	private String description;
	
	@ManyToOne
	@JoinColumn(name="CV_ID")
	private CV cv;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitlePosition() {
		return titlePosition;
	}

	public void setTitlePosition(String titlePosition) {
		this.titlePosition = titlePosition;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public CV getCv() {
		return cv;
	}

	public void setCv(CV cv) {
		this.cv = cv;
	}
	
}
