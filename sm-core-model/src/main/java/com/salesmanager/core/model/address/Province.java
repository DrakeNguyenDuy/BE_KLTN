package com.salesmanager.core.model.address;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "PROVINCE_DESCRIPTION")
public class Province {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID_PROVINCE")
	private Long idProvince;

	@Column(name = "NAME")
	private String name;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getIdProvince() {
		return idProvince;
	}

	public void setIdProvince(Long idProvince) {
		this.idProvince = idProvince;
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
