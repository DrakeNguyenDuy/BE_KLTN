package com.salesmanager.core.model.englishlevel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.salesmanager.core.model.common.audit.AuditSection;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.profile.Profile;

@Entity
@Table(name = "ENGLISH_LEVEL")
public class EnglishLevel {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "CODE")
	private String code;
	@Column(name = "NAME")
	private String name;
	
	@OneToMany(mappedBy = "englishLevel")
	private List<Profile> profile;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AuditSection getAuditSection() {
		return auditSection;
	}

	public void setAuditSection(AuditSection auditSection) {
		this.auditSection = auditSection;
	}

}
