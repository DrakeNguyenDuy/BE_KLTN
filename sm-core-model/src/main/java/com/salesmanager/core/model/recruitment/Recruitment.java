package com.salesmanager.core.model.recruitment;

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
import com.salesmanager.core.model.customer.Customer;

@Entity
@Table(name = "RECRUITMENT")
public class Recruitment {

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

	@Column(name = "APPLY_DATE", nullable = false)
	private Date applyDate;

	@Column(name = "STATUS", nullable = false)
	private StatusProcess statusProcess;

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

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public StatusProcess getStatusProcess() {
		return statusProcess;
	}

	public void setStatusProcess(StatusProcess statusProcess) {
		this.statusProcess = statusProcess;
	}

}
