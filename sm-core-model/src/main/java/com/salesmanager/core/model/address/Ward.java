package com.salesmanager.core.model.address;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "WARD_DESCRIPTION")
public class Ward {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID_WARD")
	private Long idWard;

	@Column(name = "NAME")
	private String name;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_DISTRICT")
	private District district;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getIdWard() {
		return idWard;
	}

	public void setIdWard(Long idWard) {
		this.idWard = idWard;
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

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

}
