package com.salesmanager.core.model.experience;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "EXPERIENCE_DESCRIPTION")
public class ExperienceDescription {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_EXPERIENCE;
	@Column
	private String NAME;
	@Column
	private String CODE;
	@Embedded
	private AuditSection auditSection = new AuditSection();
	public Long getEXPERIENCE() {
		return ID_EXPERIENCE;
	}
	public void setEXPERIENCE(Long ID_EXPERIENCE) {
		this.ID_EXPERIENCE = ID_EXPERIENCE;
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
