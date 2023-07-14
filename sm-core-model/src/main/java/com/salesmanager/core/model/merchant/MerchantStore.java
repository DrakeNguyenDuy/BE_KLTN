package com.salesmanager.core.model.merchant;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.salesmanager.core.constants.MeasureUnit;
import com.salesmanager.core.model.catalog.product.attribute.ProductAttribute;
import com.salesmanager.core.model.common.audit.AuditSection;
import com.salesmanager.core.model.common.audit.Auditable;
import com.salesmanager.core.model.generic.SalesManagerEntity;
import com.salesmanager.core.model.reference.country.Country;
import com.salesmanager.core.model.reference.currency.Currency;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.reference.zone.Zone;
import com.salesmanager.core.utils.CloneUtils;

@Entity
@Table(name = "MERCHANT_STORE", indexes = @Index(columnList = "LINEAGE"))
public class MerchantStore extends SalesManagerEntity<Integer, MerchantStore> implements Auditable {

	private static final long serialVersionUID = 1L;

	public final static String DEFAULT_STORE = "DEFAULT";

	public MerchantStore(Integer id, String code, String name) {
		this.id = id;
		this.code = code;
		this.storename = name;

	}

	public MerchantStore(Integer id, String code, String name, String storeEmailAddress) {
		this.id = id;
		this.code = code;
		this.storename = name;
		this.storeEmailAddress = storeEmailAddress;
	}

	@Id
	@Column(name = "MERCHANT_ID", unique = true, nullable = false)
	@TableGenerator(name = "TABLE_GEN", table = "SM_SEQUENCER", pkColumnName = "SEQ_NAME", valueColumnName = "SEQ_COUNT", pkColumnValue = "STORE_SEQ_NEXT_VAL")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "TABLE_GEN")
	private Integer id;

	@Embedded
	private AuditSection auditSection = new AuditSection();

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "PARENT_ID")
	private MerchantStore parent;

	@JsonIgnore
	@OneToMany(mappedBy = "parent", cascade = CascadeType.REMOVE)
	private Set<MerchantStore> stores = new HashSet<MerchantStore>();

	@Column(name = "IS_RETAILER")
	private Boolean retailer = false;

	@NotEmpty
	@Column(name = "STORE_NAME", nullable = false, length = 100)
	private String storename;

	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z0-9_]*$")
	@Column(name = "STORE_CODE", nullable = false, unique = true, length = 100)
	private String code;

	@Column(name = "LINEAGE")
	private String lineage;

	@NotEmpty
	@Column(name = "STORE_PHONE", length = 50)
	private String storephone;

	@Column(name = "STORE_ADDRESS")
	private String storeaddress;

	@NotEmpty
	@Column(name = "STORE_CITY", length = 100)
	private String storecity;

	@NotEmpty
	@Column(name = "STORE_POSTAL_CODE", length = 15)
	private String storepostalcode;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Country.class)
	@JoinColumn(name = "COUNTRY_ID", nullable = false, updatable = true)
	private Country country;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Zone.class)
	@JoinColumn(name = "ZONE_ID", nullable = true, updatable = true)
	private Zone zone;

	@Column(name = "STORE_STATE_PROV", length = 100)
	private String storestateprovince;

	@Column(name = "WEIGHTUNITCODE", length = 5)
	private String weightunitcode = MeasureUnit.LB.name();

	@Column(name = "SEIZEUNITCODE", length = 5)
	private String seizeunitcode = MeasureUnit.IN.name();

	@Temporal(TemporalType.DATE)
	@Column(name = "IN_BUSINESS_SINCE")
	private Date inBusinessSince = new Date();

	@Transient
	private String dateBusinessSince;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Language.class)
	@JoinColumn(name = "LANGUAGE_ID", nullable = true)
	private Language defaultLanguage;

	@JsonIgnore
	@NotEmpty
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "MERCHANT_LANGUAGE")
	private List<Language> languages = new ArrayList<Language>();

	@Column(name = "USE_CACHE")
	private boolean useCache = false;

	@Column(name = "STORE_TEMPLATE", length = 25)
	private String storeTemplate;

	@Column(name = "INVOICE_TEMPLATE", length = 25)
	private String invoiceTemplate;

	@Column(name = "DOMAIN_NAME", length = 80)
	private String domainName;

	@JsonIgnore
	@Column(name = "CONTINUESHOPPINGURL", length = 150)
	private String continueshoppingurl;

	@Email
	@NotEmpty
	@Column(name = "STORE_EMAIL", length = 60, nullable = false)
	private String storeEmailAddress;

//	Long add some lines here(17/5/2023)
//	@JsonIgnore
//	@Column(name = "STORE_LOGO", length = 255)
//	private String storeLogo;
//	end

	@Lob
	@Column(name = "STORE_LOGO")
	private byte[] storeLogo;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = Currency.class)
	@JoinColumn(name = "CURRENCY_ID", nullable = false)
	private Currency currency;

	@Column(name = "CURRENCY_FORMAT_NATIONAL")
	private boolean currencyFormatNational;

	@Column(name = "TOTAL_RATING")
	private Double totalRating;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "employer")
	private Set<EmployerReview> employerReviews = new HashSet<EmployerReview>();

	@Column(name = "DESCRIPTION", columnDefinition = "TEXT")
	private String description;

	public MerchantStore() {
	}

	public boolean isUseCache() {
		return useCache;
	}

	public void setUseCache(boolean useCache) {
		this.useCache = useCache;
	}

	@Override
	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public Integer getId() {
		return this.id;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getStorephone() {
		return storephone;
	}

	public void setStorephone(String storephone) {
		this.storephone = storephone;
	}

	public String getStoreaddress() {
		return storeaddress;
	}

	public void setStoreaddress(String storeaddress) {
		this.storeaddress = storeaddress;
	}

	public String getStorecity() {
		return storecity;
	}

	public void setStorecity(String storecity) {
		this.storecity = storecity;
	}

	public String getStorepostalcode() {
		return storepostalcode;
	}

	public void setStorepostalcode(String storepostalcode) {
		this.storepostalcode = storepostalcode;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public Zone getZone() {
		return zone;
	}

	public void setZone(Zone zone) {
		this.zone = zone;
	}

	public String getStorestateprovince() {
		return storestateprovince;
	}

	public void setStorestateprovince(String storestateprovince) {
		this.storestateprovince = storestateprovince;
	}

	public Currency getCurrency() {
		return currency;
	}

	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	public String getWeightunitcode() {
		return weightunitcode;
	}

	public void setWeightunitcode(String weightunitcode) {
		this.weightunitcode = weightunitcode;
	}

	public String getSeizeunitcode() {
		return seizeunitcode;
	}

	public void setSeizeunitcode(String seizeunitcode) {
		this.seizeunitcode = seizeunitcode;
	}

	public Date getInBusinessSince() {
		return CloneUtils.clone(inBusinessSince);
	}

	public void setInBusinessSince(Date inBusinessSince) {
		this.inBusinessSince = CloneUtils.clone(inBusinessSince);
	}

	public Language getDefaultLanguage() {
		return defaultLanguage;
	}

	public void setDefaultLanguage(Language defaultLanguage) {
		this.defaultLanguage = defaultLanguage;
	}

	public List<Language> getLanguages() {
		return languages;
	}

	public void setLanguages(List<Language> languages) {
		this.languages = languages;
	}

//	Long add some lines here(17/6/2023)
//	public String getStoreLogo() {
//		return storeLogo;
//	}
//
//	public void setStoreLogo(String storeLogo) {
//		this.storeLogo = storeLogo;
//	}
//	end

	public String getStoreTemplate() {
		return storeTemplate;
	}

	public void setStoreTemplate(String storeTemplate) {
		this.storeTemplate = storeTemplate;
	}

	public String getInvoiceTemplate() {
		return invoiceTemplate;
	}

	public void setInvoiceTemplate(String invoiceTemplate) {
		this.invoiceTemplate = invoiceTemplate;
	}

	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}

	public String getContinueshoppingurl() {
		return continueshoppingurl;
	}

	public void setContinueshoppingurl(String continueshoppingurl) {
		this.continueshoppingurl = continueshoppingurl;
	}

	public String getStoreEmailAddress() {
		return storeEmailAddress;
	}

	public void setStoreEmailAddress(String storeEmailAddress) {
		this.storeEmailAddress = storeEmailAddress;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setDateBusinessSince(String dateBusinessSince) {
		this.dateBusinessSince = dateBusinessSince;
	}

	public String getDateBusinessSince() {
		return dateBusinessSince;
	}

	public void setCurrencyFormatNational(boolean currencyFormatNational) {
		this.currencyFormatNational = currencyFormatNational;
	}

	public boolean isCurrencyFormatNational() {
		return currencyFormatNational;
	}

	@Override
	public AuditSection getAuditSection() {
		return this.auditSection;
	}

	@Override
	public void setAuditSection(AuditSection audit) {
		this.auditSection = audit;

	}

	public MerchantStore getParent() {
		return parent;
	}

	public void setParent(MerchantStore parent) {
		this.parent = parent;
	}

	public Set<MerchantStore> getStores() {
		return stores;
	}

	public void setStores(Set<MerchantStore> stores) {
		this.stores = stores;
	}

	public Boolean isRetailer() {
		return retailer;
	}

	public void setRetailer(Boolean retailer) {
		this.retailer = retailer;
	}
	// Long add some lines here(17/6/2023)

	public byte[] getStoreLogo() {
		return storeLogo;
	}

	public void setStoreLogo(byte[] storeLogo) {
		this.storeLogo = storeLogo;
	}

	public Double getTotalRating() {
		return totalRating;
	}

	public void setTotalRating(Double totalRating) {
		this.totalRating = totalRating;
	}

	public Set<EmployerReview> getEmployerReviews() {
		return employerReviews;
	}

	public void setEmployerReviews(Set<EmployerReview> employerReviews) {
		this.employerReviews = employerReviews;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

//	end

}
