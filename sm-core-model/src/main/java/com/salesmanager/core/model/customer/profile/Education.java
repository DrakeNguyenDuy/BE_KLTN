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
@Table(name = "EDUCATION")
public class Education {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@Column(name = "SCHO0L", nullable = false)
	private String school;

	@Column(name = "MAJOR", nullable = false)
	private String major;

	@Column(name = "IS_GRADUATED")
	private boolean isGraduated;

	@Column(name = "START_DATE", nullable = false)
	private Date startDate;

	@Column(name = "END_DATE", nullable = true)
	private Date endDate;

	@ManyToOne(targetEntity = CV.class)
	@JoinColumn(name = "CV_ID")
	private CV cv;

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

	public boolean isGraduated() {
		return isGraduated;
	}

	public void setGraduated(boolean isGraduated) {
		this.isGraduated = isGraduated;
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

	public CV getCv() {
		return cv;
	}

	public void setCv(CV cv) {
		this.cv = cv;
	}

}
