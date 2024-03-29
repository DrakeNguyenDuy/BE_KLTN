package com.salesmanager.core.model.customer;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.Cascade;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.salesmanager.core.constants.SchemaConstant;
import com.salesmanager.core.model.catalog.product.review.ProductReview;
import com.salesmanager.core.model.common.Billing;
import com.salesmanager.core.model.common.CredentialsReset;
import com.salesmanager.core.model.common.Delivery;
import com.salesmanager.core.model.common.audit.AuditSection;
import com.salesmanager.core.model.common.audit.Auditable;
import com.salesmanager.core.model.customer.attribute.CustomerAttribute;
import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.core.model.generic.SalesManagerEntity;
import com.salesmanager.core.model.merchant.EmployerReview;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.user.Group;
import com.salesmanager.core.utils.CloneUtils;

@Entity
@Table(name = "CUSTOMER", uniqueConstraints = @UniqueConstraint(columnNames = {
//					Long hide some line here (20/5/2023)
//					"MERCHANT_ID",
//					end
		"CUSTOMER_NICK" }))
public class Customer extends SalesManagerEntity<Long, Customer> implements Auditable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "CUSTOMER_ID", unique = true, nullable = false)
	@TableGenerator(name = "TABLE_GEN", table = "SM_SEQUENCER", pkColumnName = "SEQ_NAME", valueColumnName = "SEQ_COUNT", pkColumnValue = "CUSTOMER_SEQ_NEXT_VAL")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "TABLE_GEN")
	private Long id;

	@JsonIgnore
	@Embedded
	private AuditSection auditSection = new AuditSection();

//	Long hide some lines here(14/5/2023)
//	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "customer")
//	private Set<CustomerAttribute> attributes = new HashSet<CustomerAttribute>();
//	end

	@Column(name = "CUSTOMER_GENDER", length = 1, nullable = true)
	@Enumerated(value = EnumType.STRING)
	private CustomerGender gender;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CUSTOMER_DOB")
	private Date dateOfBirth;

	@Email
	@NotEmpty
	@Column(name = "CUSTOMER_EMAIL_ADDRESS", length = 96, nullable = false)
	private String emailAddress;

	@Column(name = "CUSTOMER_NICK", length = 96)
	private String nick;// unique username per store

	@Column(name = "CUSTOMER_COMPANY", length = 100)
	private String company;

	@JsonIgnore
	@Column(name = "CUSTOMER_PASSWORD", length = 60)
	private String password;

	@Column(name = "CUSTOMER_ANONYMOUS")
	private boolean anonymous;

	@Column(name = "REVIEW_AVG")
	private BigDecimal customerReviewAvg;

	@Column(name = "REVIEW_COUNT")
	private Integer customerReviewCount;

	@Column(name = "PROVIDER")
	private String provider;

	// Long add some lines here(20/5/2023)
	@Column(name = "LAST_NAME")
	private String lastName;
	@Column(name = "FIRST_NAME")
	private String firstName;
	// end

	// Long add some lines here(20/5/2023)
	@OneToOne(mappedBy = "customer")
	private Profile profile;
	// end

	// Long add some lines here(20/6/2023)
	@Column(name = "PHONE_NUMBER")
	private String phoneNumber;

//	Long hide some lines here(20/5/2023)
//	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Language.class)
//	@JoinColumn(name = "LANGUAGE_ID", nullable=true
////			Long hide some lines here (25/4/2023)
////			false
////			end
//			)
//	private Language defaultLanguage;
//	end

	@OneToMany(mappedBy = "customer", targetEntity = ProductReview.class)
	private List<ProductReview> reviews = new ArrayList<ProductReview>();

//	Long hide some lines here(20/5/2023)
//	@JsonIgnore
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name="MERCHANT_ID", nullable=true
////			Long hide some lines here (25/4/2023)
////			false
////			end
//			)
//	private MerchantStore merchantStore;
//	end

//	Long hide some lines here(20/5/2023)
//	@Embedded
//	private Delivery delivery = null;
//	end

//	Long hide some lines here(20/5/2023)
//	@Valid
//	@Embedded
//	private Billing billing = null;
//	end

	@JsonIgnore
//	Long hides some lines here(4/6/2023)
//	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REFRESH })
//	end
//	Long add some lines here(4/6/2023)
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.REFRESH })
//	end
	@JoinTable(name = "CUSTOMER_GROUP", joinColumns = {
			@JoinColumn(name = "CUSTOMER_ID", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "GROUP_ID", nullable = false, updatable = false) })
	@Cascade({ org.hibernate.annotations.CascadeType.DETACH, org.hibernate.annotations.CascadeType.LOCK,
			org.hibernate.annotations.CascadeType.REFRESH, org.hibernate.annotations.CascadeType.REPLICATE

	})
	private List<Group> groups = new ArrayList<Group>();

	@JsonIgnore
	@Transient
	private String showCustomerStateList;

	@JsonIgnore
	@Transient
	private String showBillingStateList;

	@JsonIgnore
	@Transient
	private String showDeliveryStateList;

	@Embedded
	private CredentialsReset credentialsResetRequest = null;

	// Long add some lines here(6/6/2023)
	@OneToMany(mappedBy = "alumnus")
	private List<CV> cvs;
	// end

	// Long add some lines here(11/6/2023)
	@OneToMany(mappedBy = "alumnus")
	private List<Recruitment> recruitments;
	@OneToMany(mappedBy = "alumnus")
	private List<JobRate> jobRates;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "alumnus")
	private Set<EmployerReview> employerReviews = new HashSet<EmployerReview>();

	@Lob
	@Column(name = "avatar")
	private byte[] avatar;

	@Column(name = "active")
	private boolean active = true;
	// end

	public Customer() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDateOfBirth() {
		return CloneUtils.clone(dateOfBirth);
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = CloneUtils.clone(dateOfBirth);
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAnonymous() {
		return anonymous;
	}

	public void setAnonymous(boolean anonymous) {
		this.anonymous = anonymous;
	}

	public List<ProductReview> getReviews() {
		return reviews;
	}

	public void setReviews(List<ProductReview> reviews) {
		this.reviews = reviews;
	}

//	Long hide some lines here(20/5/2023)
//	public void setMerchantStore(MerchantStore merchantStore) {
//		this.merchantStore = merchantStore;
//	}
//
//	public MerchantStore getMerchantStore() {
//		return merchantStore;
//	}
//
//	public void setDelivery(Delivery delivery) {
//		this.delivery = delivery;
//	}
//
//	public Delivery getDelivery() {
//		return delivery;
//	}
//
//	public void setBilling(Billing billing) {
//		this.billing = billing;
//	}
//
//	public Billing getBilling() {
//		return billing;
//	}
//	end

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public List<Group> getGroups() {
		return groups;
	}

	public String getShowCustomerStateList() {
		return showCustomerStateList;
	}

	public void setShowCustomerStateList(String showCustomerStateList) {
		this.showCustomerStateList = showCustomerStateList;
	}

	public String getShowBillingStateList() {
		return showBillingStateList;
	}

	public void setShowBillingStateList(String showBillingStateList) {
		this.showBillingStateList = showBillingStateList;
	}

	public String getShowDeliveryStateList() {
		return showDeliveryStateList;
	}

	public void setShowDeliveryStateList(String showDeliveryStateList) {
		this.showDeliveryStateList = showDeliveryStateList;
	}

//	Long hide some lines here(20/5/2023)
//	public Language getDefaultLanguage() {
//		return defaultLanguage;
//	}
//
//	public void setDefaultLanguage(Language defaultLanguage) {
//		this.defaultLanguage = defaultLanguage;
//	}
//	end

//	Long hide some lines here(20/5/2023)
//	public void setAttributes(Set<CustomerAttribute> attributes) {
//		this.attributes = attributes;
//	}
//
//	public Set<CustomerAttribute> getAttributes() {
//		return attributes;
//	}
//	end

	public void setGender(CustomerGender gender) {
		this.gender = gender;
	}

	public CustomerGender getGender() {
		return gender;
	}

	public BigDecimal getCustomerReviewAvg() {
		return customerReviewAvg;
	}

	public void setCustomerReviewAvg(BigDecimal customerReviewAvg) {
		this.customerReviewAvg = customerReviewAvg;
	}

	public Integer getCustomerReviewCount() {
		return customerReviewCount;
	}

	public void setCustomerReviewCount(Integer customerReviewCount) {
		this.customerReviewCount = customerReviewCount;
	}

	@Override
	public AuditSection getAuditSection() {
		return auditSection;
	}

	@Override
	public void setAuditSection(AuditSection auditSection) {
		this.auditSection = auditSection;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public CredentialsReset getCredentialsResetRequest() {
		return credentialsResetRequest;
	}

	public void setCredentialsResetRequest(CredentialsReset credentialsResetRequest) {
		this.credentialsResetRequest = credentialsResetRequest;
	}
//	Long add some lines here(20/5/2023)

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

//	end
//	Long add some lines here(30/4/2023)
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
//	end
	// Long add some lines here(6/6/2023)

	public List<CV> getCvs() {
		return cvs;
	}

	public void setCvs(List<CV> cvs) {
		this.cvs = cvs;
	}
	// end

	// Long add some lines here(11/6/2023)
	public List<Recruitment> getRecruitments() {
		return recruitments;
	}

	public void setRecruitments(List<Recruitment> recruitments) {
		this.recruitments = recruitments;
	}

	public List<JobRate> getJobRates() {
		return jobRates;
	}

	public void setJobRates(List<JobRate> jobRates) {
		this.jobRates = jobRates;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Set<EmployerReview> getEmployerReviews() {
		return employerReviews;
	}

	public void setEmployerReviews(Set<EmployerReview> employerReviews) {
		this.employerReviews = employerReviews;
	}

	public byte[] getAvatar() {
		return avatar;
	}

	public void setAvatar(byte[] avatar) {
		this.avatar = avatar;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

//	end

}
