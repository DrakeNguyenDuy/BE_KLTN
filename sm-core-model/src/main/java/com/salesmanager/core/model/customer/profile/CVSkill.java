package com.salesmanager.core.model.customer.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "CV_SKILL")
public class CVSkill {
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROFILE_ID", nullable = false)
	private Profile profile;

	@Column(name = "SKILL")
	private String skill;

	@Column(name = "RATE")
	private Double rate;

	@Column(name = "description", columnDefinition = "TEXT")
	private String description;

	@ManyToOne
	@JoinColumn(name = "CV_ID")
	private CV cv;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
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
