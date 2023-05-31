package com.salesmanager.core.model.catalog.product.paycycle;

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
@Table(name = "PAY_CYCLE_DESCRIPTION")
public class PayCycleDescription {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ID_PAY_CIRCLE;

	@Column(unique = true)
	private String code;
	@Column
	private String name;
	@Embedded
	private AuditSection auditSection = new AuditSection();
	
	//Long add some lines here(30/5/2023)
	@OneToMany(mappedBy = "payCycle")
	private List<Profile> profiles;
	//	end

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

	public Long getId() {
		return ID_PAY_CIRCLE;
	}

	public void setId(Long id) {
		ID_PAY_CIRCLE = id;
	}

}
