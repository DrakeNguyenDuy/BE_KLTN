package com.salesmanager.core.model.merchant;

import java.util.Date;
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

import org.hibernate.annotations.GenericGenerator;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.address.Province;
import com.salesmanager.core.model.address.Ward;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.common.audit.AuditSection;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.recruitment.StatusProcess;

@Entity
@Table(name = "EMPLOYER_REVIEW")
public class EmployerReview {
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	private String id;

	@ManyToOne
	@JoinColumn(name = "EMPLOYER_ID", nullable = false)
	private MerchantStore employer;

	@ManyToOne
	@JoinColumn(name = "ALUMNUS_ID", nullable = false)
	private Customer alumnus;

	@Column(name = "RATING", nullable = false)
	private Double rating;

	@Column(name = "CREATE_AT", nullable = false)
	private Date createAt;

	@Column(name = "UPDATE_AT", nullable = false)
	private Date updateAt;
}
