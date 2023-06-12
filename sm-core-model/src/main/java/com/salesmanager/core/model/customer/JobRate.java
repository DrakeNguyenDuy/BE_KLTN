package com.salesmanager.core.model.customer;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.salesmanager.core.model.catalog.product.Product;

@Entity
@Table(name = "JOB_RATE")
public class JobRate {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@ManyToOne
	@JoinColumn(name = "JOB_ID", nullable = false)
	private Product job;

	@ManyToOne
	@JoinColumn(name = "ALUMNUS_ID", nullable = false)
	private Customer alumnus;

	@Column
	@JoinColumn(name = "STATUS", nullable = false)
	private JobRateStatus jobRateStatus;

	@Column(name = "DATE_RATING", nullable = false)
	private Date dateRating;

	@Column(name = "DATE_MODIFIED", nullable = false)
	private Date dateModified;

	@Column(name = "COMMENT", columnDefinition = "TEXT")
	private String comment;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Product getJob() {
		return job;
	}

	public void setJob(Product job) {
		this.job = job;
	}

	public Customer getAlumnus() {
		return alumnus;
	}

	public void setAlumnus(Customer alumnus) {
		this.alumnus = alumnus;
	}

	public JobRateStatus getJobRateStatus() {
		return jobRateStatus;
	}

	public void setJobRateStatus(JobRateStatus jobRateStatus) {
		this.jobRateStatus = jobRateStatus;
	}

	public Date getDateRating() {
		return dateRating;
	}

	public void setDateRating(Date dateRating) {
		this.dateRating = dateRating;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
