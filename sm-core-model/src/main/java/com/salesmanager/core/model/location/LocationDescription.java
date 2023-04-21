package com.salesmanager.core.model.location;

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
@Table(name = "LOCATION_DESCRIPTION")
public class LocationDescription {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_LOCATION;
	@Column(name = "CODE")
	private String CODE;
	@Column(name = "DETAIL_ADDRESS")
	private String DETAIL_ADDRESS;
	@Column(name = "WARD")
	private String WARD;
	@Column(name = "DISTRICT")
	private String DISTRICT;
	@Column(name = "PROVINCE")
	private String PROVINCE;
	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getID_LOCATION() {
		return ID_LOCATION;
	}

	public void setID_LOCATION(Long iD_LOCATION) {
		ID_LOCATION = iD_LOCATION;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getDETAIL_ADDRESS() {
		return DETAIL_ADDRESS;
	}

	public void setDETAIL_ADDRESS(String dETAIL_ADDRESS) {
		DETAIL_ADDRESS = dETAIL_ADDRESS;
	}

	public String getWARD() {
		return WARD;
	}

	public void setWARD(String wARD) {
		WARD = wARD;
	}

	public String getDISTRICT() {
		return DISTRICT;
	}

	public void setDISTRICT(String dISTRICT) {
		DISTRICT = dISTRICT;
	}

	public String getPROVINCE() {
		return PROVINCE;
	}

	public void setPROVINCE(String pROVINCE) {
		PROVINCE = pROVINCE;
	}

	public AuditSection getAuditSection() {
		return auditSection;
	}

	public void setAuditSection(AuditSection auditSection) {
		this.auditSection = auditSection;
	}

	@ManyToMany(targetEntity = Product.class)
	@JoinColumn(name = "PRODUCT_ID", nullable = false)
	private Set<Product> products = new HashSet<Product>();

}
