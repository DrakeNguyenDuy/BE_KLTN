package com.salesmanager.shop.model.catalog.product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.product.product.ProductEntity;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.experience.ReadableExperience;
import com.salesmanager.shop.model.location.ReadableLocationDescription;
import com.salesmanager.shop.model.position.ReadablePosition;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;
import com.salesmanager.shop.model.store.ReadableMerchantStoreV2;

public class ReadableProductDetail extends ProductEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private String title;

	private String finalPrice;
	private ReadableImage image;
	private List<ReadableImage> images = new ArrayList<ReadableImage>();
	private List<ReadableCategory> categories = new ArrayList<ReadableCategory>();
	private ReadableProductType type;
	private List<ReadableSkillDescription> skills = new ArrayList<ReadableSkillDescription>();
	private List<ReadableLocationDescription> locations = new ArrayList<ReadableLocationDescription>();
	private List<ReadablePosition> positions = new ArrayList<ReadablePosition>();
	private String paycycles;
	private String codePayCycle;
	private String status;
	private String codeStatus;
	private ReadableExperience experience;
	private ReadableMerchantStoreV2 merchantStore;
	private String description;
	private String logo;
	private String gender;
	private String codeGender;
	private boolean isFollow;
	private boolean isApplied;

	public String getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(String finalPrice) {
		this.finalPrice = finalPrice;
	}

	public ReadableImage getImage() {
		return image;
	}

	public void setImage(ReadableImage image) {
		this.image = image;
	}

	public List<ReadableImage> getImages() {
		return images;
	}

	public void setImages(List<ReadableImage> images) {
		this.images = images;
	}

	public List<ReadableCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<ReadableCategory> categories) {
		this.categories = categories;
	}

	public ReadableProductType getType() {
		return type;
	}

	public void setType(ReadableProductType type) {
		this.type = type;
	}

	public List<ReadableSkillDescription> getSkills() {
		return skills;
	}

	public void setSkills(List<ReadableSkillDescription> skills) {
		this.skills = skills;
	}

	public List<ReadableLocationDescription> getLocations() {
		return locations;
	}

	public void setLocations(List<ReadableLocationDescription> locations) {
		this.locations = locations;
	}

	public String getPaycycles() {
		return paycycles;
	}

	public void setPaycycles(String paycycles) {
		this.paycycles = paycycles;
	}

	public ReadableExperience getExperience() {
		return experience;
	}

	public void setExperience(ReadableExperience experience) {
		this.experience = experience;
	}

	public ReadableMerchantStoreV2 getMerchantStore() {
		return merchantStore;
	}

	public void setMerchantStore(ReadableMerchantStoreV2 merchantStore) {
		this.merchantStore = merchantStore;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<ReadablePosition> getPositions() {
		return positions;
	}

	public void setPositions(List<ReadablePosition> positions) {
		this.positions = positions;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	// Long add some lines here(17/5/2023)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isFollow() {
		return isFollow;
	}

	public void setFollow(boolean isFollow) {
		this.isFollow = isFollow;
	}

	public boolean isApplied() {
		return isApplied;
	}

	public void setApplied(boolean isApplied) {
		this.isApplied = isApplied;
	}
	// end

	public String getCodePayCycle() {
		return codePayCycle;
	}

	public void setCodePayCycle(String codePayCycle) {
		this.codePayCycle = codePayCycle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCodeStatus() {
		return codeStatus;
	}

	public void setCodeStatus(String codeStatus) {
		this.codeStatus = codeStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCodeGender() {
		return codeGender;
	}

	public void setCodeGender(String codeGender) {
		this.codeGender = codeGender;
	}
}
