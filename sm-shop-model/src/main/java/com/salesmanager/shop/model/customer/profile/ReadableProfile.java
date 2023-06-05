package com.salesmanager.shop.model.customer.profile;

import java.util.List;

import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.englishLevel.ReadableEnglishLevel;
import com.salesmanager.shop.model.experience.ReadableExperience;
import com.salesmanager.shop.model.location.ReadableDistrict;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public class ReadableProfile {
	private Long id;
	private String fullName;
	private String avatar;
	private String introduce;
	private String goal;
	private String gender;
	private ReadableEnglishLevel englishLevel;
	private ReadableProductType carreer;
	private List<ReadableSkillDescription> readableSkillDescriptions;
	private ReadableCategory formWork;
	private List<ReadableDistrict> districts;
	private ReadablePaycycle paycycle;
	private ReadableExperience experience;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public ReadableEnglishLevel getEnglishLevel() {
		return englishLevel;
	}

	public void setEnglishLevel(ReadableEnglishLevel englishLevel) {
		this.englishLevel = englishLevel;
	}

	public ReadableProductType getCarreer() {
		return carreer;
	}

	public void setCarreer(ReadableProductType carreer) {
		this.carreer = carreer;
	}

	public List<ReadableSkillDescription> getReadableSkillDescriptions() {
		return readableSkillDescriptions;
	}

	public void setReadableSkillDescriptions(List<ReadableSkillDescription> readableSkillDescriptions) {
		this.readableSkillDescriptions = readableSkillDescriptions;
	}

	public ReadableCategory getFormWork() {
		return formWork;
	}

	public void setFormWork(ReadableCategory formWork) {
		this.formWork = formWork;
	}

	public List<ReadableDistrict> getDistricts() {
		return districts;
	}

	public void setDistricts(List<ReadableDistrict> districts) {
		this.districts = districts;
	}

	public ReadablePaycycle getPaycycle() {
		return paycycle;
	}

	public void setPaycycle(ReadablePaycycle paycycle) {
		this.paycycle = paycycle;
	}

	public ReadableExperience getExperience() {
		return experience;
	}

	public void setExperience(ReadableExperience experience) {
		this.experience = experience;
	}
}
