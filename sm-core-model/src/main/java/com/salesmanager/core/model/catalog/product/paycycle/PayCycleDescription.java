package com.salesmanager.core.model.catalog.product.paycycle;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "PAY_CYCLE_DESCRIPTION")
public class PayCycleDescription {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_PAY_CIRCLE;
	
	@Column
	private String code;
	@Column
	private String name;
	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getID() {
		return ID_PAY_CIRCLE;
	}

	public void setID(Long iD) {
		ID_PAY_CIRCLE = iD;
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
