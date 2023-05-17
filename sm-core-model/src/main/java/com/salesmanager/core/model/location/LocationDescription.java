package com.salesmanager.core.model.location;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.address.Province;
import com.salesmanager.core.model.address.Ward;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.common.audit.AuditSection;

@Entity
@Table(name = "LOCATION_DESCRIPTION")
public class LocationDescription {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_LOCATION;
	@Column(name = "DETAIL_ADDRESS")
	private String DETAIL_ADDRESS;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name = "ID_WARD")
	private Ward ward;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name = "ID_DISTRICT")
	private District district;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name = "ID_PROVINCE")
	private Province province;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	public Long getID_LOCATION() {
		return ID_LOCATION;
	}

	public void setID_LOCATION(Long iD_LOCATION) {
		ID_LOCATION = iD_LOCATION;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public String getDETAIL_ADDRESS() {
		return DETAIL_ADDRESS;
	}

	public void setDETAIL_ADDRESS(String dETAIL_ADDRESS) {
		DETAIL_ADDRESS = dETAIL_ADDRESS;
	}

	public AuditSection getAuditSection() {
		return auditSection;
	}

	public void setAuditSection(AuditSection auditSection) {
		this.auditSection = auditSection;
	}

//	@ManyToMany(targetEntity = Product.class)
//	@JoinColumn(name = "PRODUCT_ID", nullable = false)
	@ManyToMany(mappedBy = "locationDescriptions")
	private Set<Product> products = new HashSet<Product>();

	public Ward getWard() {
		return ward;
	}

	public void setWard(Ward ward) {
		this.ward = ward;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

}
