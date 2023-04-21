package com.salesmanager.core.model.skill;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "SKILL_DESCRIPTION")
public class SkillDescription {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_SKILL;
	@Column
	private String CODE;
	@Column
	private String NAME;
	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getID_SKILL() {
		return ID_SKILL;
	}

	public void setID_SKILL(Long iD_SKILL) {
		ID_SKILL = iD_SKILL;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public AuditSection getAuditSection() {
		return auditSection;
	}

	public void setAuditSection(AuditSection auditSection) {
		this.auditSection = auditSection;
	}

//	@ManyToMany(mappedBy = "skillDescriptions")
	@ManyToMany(targetEntity = Product.class)
	@JoinColumn(name = "PRODUCT_ID", nullable = false)
	private Set<Product> products = new HashSet<Product>();
}
