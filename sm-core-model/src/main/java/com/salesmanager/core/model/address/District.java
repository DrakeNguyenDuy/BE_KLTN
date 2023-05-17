package com.salesmanager.core.model.address;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "DISTRICT_DESCRIPTION")
public class District {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID_DISTRICT")
	private Long idDistrict;

	@Column(name = "NAME")
	private String name;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_PROVINCE")
	private Province province;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getIdDistrict() {
		return idDistrict;
	}

	public void setIdDistrict(Long idDistrict) {
		this.idDistrict = idDistrict;
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

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

}
