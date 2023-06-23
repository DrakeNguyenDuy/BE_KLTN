package com.salesmanager.core.model.customer.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "SOCIAL_CONTACT")
public class SocialContact {
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@Column(name = "NAME_SOCIAL", nullable = false)
	private String nameSocial;

	@Column(name = "LINK", nullable = false)
	private String LINK;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameSocial() {
		return nameSocial;
	}

	public void setNameSocial(String nameSocial) {
		this.nameSocial = nameSocial;
	}

	public String getLINK() {
		return LINK;
	}

	public void setLINK(String lINK) {
		LINK = lINK;
	}

	@ManyToOne
	@JoinColumn(name = "CV_ID")
	private CV cv;

	public CV getCv() {
		return cv;
	}

	public void setCv(CV cv) {
		this.cv = cv;
	}

}
