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
@Table(name = "CERTIFICATE")
public class Certificate {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "LINK_REFERENCE")
	private String linkReference;

	@ManyToOne
	@JoinColumn(name = "CV_ID")
	private CV cv;

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

	public String getLinkReference() {
		return linkReference;
	}

	public void setLinkReference(String linkReference) {
		this.linkReference = linkReference;
	}

	public CV getCv() {
		return cv;
	}

	public void setCv(CV cv) {
		this.cv = cv;
	}

}
