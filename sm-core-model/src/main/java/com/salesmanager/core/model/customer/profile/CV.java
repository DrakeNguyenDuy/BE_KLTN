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

	@Column(name = "EMAIL")
	private String email;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<WorkExperience> workExperiences;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<SocialContact> socialContacts;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<Education> educations;

	@OneToMany(mappedBy = "cv", cascade = CascadeType.ALL)
	private List<Certificate> certificate;

	@OneToMany(mappedBy = "skill", cascade = CascadeType.ALL)
	private List<CVSkill> cvSkills;

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

	public List<SocialContact> getSocialContacts() {
		return socialContacts;
	}

	public void setSocialContacts(List<SocialContact> socialContacts) {
		this.socialContacts = socialContacts;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<CVSkill> getCvSkills() {
		return cvSkills;
	}

	public void setCvSkills(List<CVSkill> cvSkills) {
		this.cvSkills = cvSkills;
	}

}
