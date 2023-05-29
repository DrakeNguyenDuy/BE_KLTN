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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;
import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.englishlevel.EnglishLevel;
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

	@OneToOne
	@JoinColumn(name = "id_english_level")
	private EnglishLevel englishLevel;

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinTable(name = "PROFILE_CAREER_ENTRY", joinColumns = @JoinColumn(referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(referencedColumnName = "ID"))
	private Set<ProductType> careers = new HashSet<ProductType>();// careers

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinTable(name = "PROFILE_SKILL_ENTRY", joinColumns = @JoinColumn(referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(referencedColumnName = "ID_SKILL"))
	private Set<SkillDescription> skills = new HashSet<SkillDescription>();
	
	@OneToOne
	@JoinColumn(name = "id_form_work")
	private Category category;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	@JoinTable(name = "PROFILE_AREA_WORK_ENTRY", joinColumns = @JoinColumn(referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(referencedColumnName = "ID_DISTRICT"))
	private Set<District> districts = new HashSet<District>();
	
	@OneToOne
	@JoinColumn(name = "id_pay_cycle")
	private PayCycleDescription payCycle;

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

	public Set<ProductType> getCareers() {
		return careers;
	}

	public void setCareers(Set<ProductType> careers) {
		this.careers = careers;
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
	
	
}
