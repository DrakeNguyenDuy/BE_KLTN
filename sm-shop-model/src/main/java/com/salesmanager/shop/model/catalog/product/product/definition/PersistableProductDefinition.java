package com.salesmanager.shop.model.catalog.product.product.definition;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.salesmanager.shop.model.catalog.category.Category;
import com.salesmanager.shop.model.catalog.product.ProductDescription;
import com.salesmanager.shop.model.location.PersistableLocationDescription;
import com.salesmanager.shop.model.location.ReadableLocationDescription;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public class PersistableProductDefinition extends ProductDefinition {

	/**
	 * type and manufacturer are String type corresponding to the unique code
	 */
	private static final long serialVersionUID = 1L;

	private List<ProductDescription> descriptions = new ArrayList<ProductDescription>();

//	Long hide some lines here(3/5/2023)
//	private List<PersistableProductAttribute> properties = new ArrayList<PersistableProductAttribute>();
//	end

	private List<Category> categories = new ArrayList<Category>();
	private String type;
	private String manufacturer;
	private BigDecimal price;
	private int quantity;

	// Long add some lines here (21/4/2023)
	private String gender;
	private String experence;
	private List<String> positionCode;
	private List<String> skillsDecription = new ArrayList<String>();
	private List<PersistableLocationDescription> locationsDecription = new ArrayList<PersistableLocationDescription>();
	private String idPayCycle;
	private String status;
	// end
	// Long add some lines here
	// end

	public List<ProductDescription> getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(List<ProductDescription> descriptions) {
		this.descriptions = descriptions;
	}

//	Long hide some lines here(3/5/2023)
//	public List<PersistableProductAttribute> getProperties() {
//		return properties;
//	}
//	public void setProperties(List<PersistableProductAttribute> properties) {
//		this.properties = properties;
//	}
//	end

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

//	Long add some lines here(3/5/2023)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getExperence() {
		return experence;
	}

	public void setExperence(String experence) {
		this.experence = experence;
	}

	public List<String> getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(List<String> positionCode) {
		this.positionCode = positionCode;
	}

	public List<String> getSkillsDecription() {
		return skillsDecription;
	}

	public void setSkillsDecription(List<String> skillsDecription) {
		this.skillsDecription = skillsDecription;
	}

	public List<PersistableLocationDescription> getLocationsDecription() {
		return locationsDecription;
	}

	public void setLocationsDecription(List<PersistableLocationDescription> locationsDecription) {
		this.locationsDecription = locationsDecription;
	}

	public String getIdPayCycle() {
		return idPayCycle;
	}

	public void setIdPayCycle(String idPayCycle) {
		this.idPayCycle = idPayCycle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

//	end

}
