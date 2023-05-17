package com.salesmanager.core.model.catalog.product.position;

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
@Table(name = "POSITION_DESCRIPTION")
public class PositionDescription {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_POSITION;

	@Column(name = "CODE")
	private String code;

	@Column(name = "NAME")
	private String name;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	@ManyToMany(mappedBy = "positionDescriptions")
	Set<Product> products = new HashSet<Product>();

	public Long getID_POSITION() {
		return ID_POSITION;
	}

	public void setID_POSITION(Long iD_POSITION) {
		ID_POSITION = iD_POSITION;
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

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
