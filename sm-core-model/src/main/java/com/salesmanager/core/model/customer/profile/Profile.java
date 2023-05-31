package com.salesmanager.core.model.customer.profile;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;
import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.englishlevel.EnglishLevel;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.skill.SkillDescription;

@Entity
@Table(name = "PROFILE")
public class Profile {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "YEAR_OF_BIRTH")
	private String yearOfBirth;
	
	@Column(name ="AVATAR")
	private String avatar;

	@ManyToOne(fetch = FetchType.LAZY,cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name = "ENGLISH_LEVEL_ID",referencedColumnName = "ID", nullable = false)
	private EnglishLevel englishLevel;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name = "PRODUCT_TYPE_ID")
	private ProductType career;// careers

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinTable(name = "PROFILE_SKILL_ENTRY", joinColumns = @JoinColumn(referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(referencedColumnName = "ID_SKILL"))
	private Set<SkillDescription> skills = new HashSet<SkillDescription>();

	@OneToOne
	@JoinColumn(name = "ID_FORM_WORK")
	private Category category;

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinTable(name = "PROFILE_AREA_WORK_ENTRY", joinColumns = @JoinColumn(referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(referencedColumnName = "ID_DISTRICT"))
	private Set<District> districts = new HashSet<District>();

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name="PAY_CYCLE_ID" , nullable = true)
	private PayCycleDescription payCycle;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinColumn(name="EXPERIENCE_ID" , nullable = true)
	private ExperienceDescription experience;

	@OneToOne()
	@JoinColumn(name = "CUSTOMER_ID", nullable = false, unique = true)
	private Customer customer;
	
	@Column(columnDefinition = "TEXT")
	private String introduce;
	
	@Column(columnDefinition = "TEXT")
	private String goal;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getYearOfBirth() {
		return yearOfBirth;
	}

	public void setYearOfBirth(String yearOfBirth) {
		this.yearOfBirth = yearOfBirth;
	}

	public EnglishLevel getEnglishLevel() {
		return englishLevel;
	}

	public void setEnglishLevel(EnglishLevel englishLevel) {
		this.englishLevel = englishLevel;
	}

	public Set<SkillDescription> getSkills() {
		return skills;
	}

	public void setSkills(Set<SkillDescription> skills) {
		this.skills = skills;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<District> getDistricts() {
		return districts;
	}

	public void setDistricts(Set<District> districts) {
		this.districts = districts;
	}

	public PayCycleDescription getPayCycle() {
		return payCycle;
	}

	public void setPayCycle(PayCycleDescription payCycle) {
		this.payCycle = payCycle;
	}

	public ProductType getCareer() {
		return career;
	}

	public void setCareers(ProductType career) {
		this.career = career;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setCareer(ProductType career) {
		this.career = career;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public ExperienceDescription getExperience() {
		return experience;
	}

	public void setExperience(ExperienceDescription experience) {
		this.experience = experience;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

}
