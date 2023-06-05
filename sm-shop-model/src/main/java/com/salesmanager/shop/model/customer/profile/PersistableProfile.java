package com.salesmanager.shop.model.customer.profile;

import java.util.List;

import com.salesmanager.shop.model.catalog.category.PersistableCategory;
import com.salesmanager.shop.model.catalog.product.type.PersistableProductType;
import com.salesmanager.shop.model.englishLevel.PersistableEnglishLevel;
import com.salesmanager.shop.model.experience.PersistableExperience;
import com.salesmanager.shop.model.location.PersistableDistrict;
import com.salesmanager.shop.model.paycircle.PersistablePaycycle;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;

public class PersistableProfile {
	private Long id;
	private String lastName;
	private String firstName;
	private String introduce;
	private String goal;
	private String gender;
	private String englishLevel;
	private String carreer;
	private List<String> skills;
	private String formWork;
	private List<Long> districts;
	private String paycycle;
	private String experience;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEnglishLevel() {
		return englishLevel;
	}

	public void setEnglishLevel(String englishLevel) {
		this.englishLevel = englishLevel;
	}

	public String getCarreer() {
		return carreer;
	}

	public void setCarreer(String carreer) {
		this.carreer = carreer;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

	public String getFormWork() {
		return formWork;
	}

	public void setFormWork(String formWork) {
		this.formWork = formWork;
	}

	public List<Long> getDistricts() {
		return districts;
	}

	public void setDistricts(List<Long> districts) {
		this.districts = districts;
	}

	public String getPaycycle() {
		return paycycle;
	}

	public void setPaycycle(String paycycle) {
		this.paycycle = paycycle;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

}
