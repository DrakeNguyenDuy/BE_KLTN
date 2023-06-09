package com.salesmanager.core.model.experience;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.salesmanager.core.model.common.audit.AuditSection;
import com.salesmanager.core.model.customer.profile.Profile;

@Entity
@Table(name = "EXPERIENCE_DESCRIPTION")
public class ExperienceDescription {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID_EXPERIENCE")
	private Long id;
	@Column
	private String NAME;
	@Column
	private String CODE;
	@Embedded
	private AuditSection auditSection = new AuditSection();
	
	//Long add some lines here(31/5/2023)
	@OneToMany(mappedBy = "experience")
	private List<Profile> profiles;
	//	end

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public AuditSection getAuditSection() {
		return auditSection;
	}

	public void setAuditSection(AuditSection auditSection) {
		this.auditSection = auditSection;
	}

}
