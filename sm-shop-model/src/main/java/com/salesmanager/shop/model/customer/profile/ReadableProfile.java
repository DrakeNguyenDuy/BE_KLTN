package com.salesmanager.shop.model.customer.profile;

import java.util.List;

import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.englishLevel.ReadableEnglishLevel;
import com.salesmanager.shop.model.experience.ReadableExperience;
import com.salesmanager.shop.model.location.ReadableDistrict;
import com.salesmanager.shop.model.location.ReadableProvince;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public class ReadableProfile {
	private Long id;
	private String username;
	private String email;
	private String fullName;
	private String lastname;
	private String firstname;
	private String dob;
	private String phone;
	private String avatar;
	private String introduce;
	private String goal;
	private String gender;
	private ReadableEnglishLevel englishLevel;
	private ReadableProductType carreer;
//	private List<ReadableSkillDescription> readableSkillDescriptions;
	private List<ProfileSkillDto> skills;
	private ReadableCategory formWork;
	private List<ReadableDistrict> districts;
	private List<ReadableProvince> provinces;
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

//	public List<ReadableSkillDescription> getReadableSkillDescriptions() {
//		return readableSkillDescriptions;
//	}
//
//	public void setReadableSkillDescriptions(List<ReadableSkillDescription> readableSkillDescriptions) {
//		this.readableSkillDescriptions = readableSkillDescriptions;
//	}
	
	

	public ReadableCategory getFormWork() {
		return formWork;
	}

	public List<ProfileSkillDto> getSkills() {
		return skills;
	}

	public void setSkills(List<ProfileSkillDto> skills) {
		this.skills = skills;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<ReadableProvince> getProvinces() {
		return provinces;
	}

	public void setProvinces(List<ReadableProvince> provinces) {
		this.provinces = provinces;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
}
