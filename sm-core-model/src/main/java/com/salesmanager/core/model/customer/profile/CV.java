package com.salesmanager.core.model.customer.profile;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.salesmanager.core.model.customer.Customer;

@Entity
@Table(name = "CV")
public class CV {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "ADDRESS")
	private String address;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<WorkExperience> workExperiences;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<Education> educations;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<Certificate> certificate;

	@ManyToOne
	@JoinColumn(name = "ALUMNUS_ID", nullable = false)
	private Customer alumnus;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<WorkExperience> getWorkExperiences() {
		return workExperiences;
	}

	public void setWorkExperiences(List<WorkExperience> workExperiences) {
		this.workExperiences = workExperiences;
	}

	public List<Education> getEducations() {
		return educations;
	}

	public void setEducations(List<Education> educations) {
		this.educations = educations;
	}

	public List<Certificate> getCertificate() {
		return certificate;
	}

	public void setCertificate(List<Certificate> certificate) {
		this.certificate = certificate;
	}

	public Customer getAlumnus() {
		return alumnus;
	}

	public void setAlumnus(Customer alumnus) {
		this.alumnus = alumnus;
	}

}