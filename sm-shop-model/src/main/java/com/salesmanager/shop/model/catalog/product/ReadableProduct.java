package com.salesmanager.shop.model.catalog.product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.manufacturer.ReadableManufacturer;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductAttribute;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductOption;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductProperty;
import com.salesmanager.shop.model.catalog.product.product.ProductEntity;
import com.salesmanager.shop.model.catalog.product.product.variant.ReadableProductVariant;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.location.ReadableLocationDescription;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

public class ReadableProduct extends ProductEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	private ProductDescription description;

	// Long add some lines here(17/6/2023)
	private String name;
	private String title;
	private String payCycle;
	// end

//	Long hide some lines here(13/05/2023)
//	private ReadableProductPrice productPrice;
//	end

	private String finalPrice = "0";
	private String originalPrice = null;
//	private boolean discounted = false;
	private ReadableImage image;
	private String logo;
	private List<ReadableImage> images = new ArrayList<ReadableImage>();

//	Long hide some lines here(13/5/2023)
//	private ReadableManufacturer manufacturer;
//	end

//	private List<ReadableProductAttribute> attributes = new ArrayList<ReadableProductAttribute>();
//	private List<ReadableProductOption> options = new ArrayList<ReadableProductOption>();
//	private List<ReadableProductVariant> variants = new ArrayList<ReadableProductVariant>();
//	private List<ReadableProductProperty> properties = new ArrayList<ReadableProductProperty>();
	private List<ReadableCategory> categories = new ArrayList<ReadableCategory>();
	private ReadableProductType type;

//	Long hide some lines here(13/5/2023)
//	private boolean canBePurchased = false;
//	end

//	Long hide some lines here(13/5/2023)
//	// RENTAL
//	private RentalOwner owner;
//	end

	// Long add some lines here (21/4/2023)
	private List<ReadableSkillDescription> skillsDecription = new ArrayList<ReadableSkillDescription>();
	private List<ReadableLocationDescription> locationsDecription = new ArrayList<ReadableLocationDescription>();
	// end

//	Long add some lines here(13/05/2023)
	private String nameCompany;
//	end

	// Long hide some lines here (21/4/2023)
//	public ProductDescription getDescription() {
//		return description;
//	}
//
//	public void setDescription(ProductDescription description) {
//		this.description = description;
//	}
	// end

	public String getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(String finalPrice) {
		this.finalPrice = finalPrice;
	}

	public String getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(String originalPrice) {
		this.originalPrice = originalPrice;
	}

//	public boolean isDiscounted() {
//		return discounted;
//	}
//
//	public void setDiscounted(boolean discounted) {
//		this.discounted = discounted;
//	}

	public void setImages(List<ReadableImage> images) {
		this.images = images;
	}

	public List<ReadableImage> getImages() {
		return images;
	}

	public void setImage(ReadableImage image) {
		this.image = image;
	}

	public ReadableImage getImage() {
		return image;
	}
	// Long add some lines here (21/4/2023)
//	public void setAttributes(List<ReadableProductAttribute> attributes) {
//		this.attributes = attributes;
//	}
//
//	public List<ReadableProductAttribute> getAttributes() {
//		return attributes;
//	}
	// end

//	Long hide some lines here(13/5/2023)
//	public void setManufacturer(ReadableManufacturer manufacturer) {
//		this.manufacturer = manufacturer;
//	}
//
//	public ReadableManufacturer getManufacturer() {
//		return manufacturer;
//	}
//
//	public boolean isCanBePurchased() {
//		return canBePurchased;
//	}
//
//	public void setCanBePurchased(boolean canBePurchased) {
//		this.canBePurchased = canBePurchased;
//	}
//
//	public RentalOwner getOwner() {
//		return owner;
//	}
//
//	public void setOwner(RentalOwner owner) {
//		this.owner = owner;
//	}
//	end

	public List<ReadableCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<ReadableCategory> categories) {
		this.categories = categories;
	}

	// Long add some lines here (21/4/2023)
//	public List<ReadableProductOption> getOptions() {
//		return options;
//	}
//
//	public void setOptions(List<ReadableProductOption> options) {
//		this.options = options;
//	}
//	 end

	public ReadableProductType getType() {
		return type;
	}

	public void setType(ReadableProductType type) {
		this.type = type;
	}

//	Long hide some lines here
//	public ReadableProductPrice getProductPrice() {
//		return productPrice;
//	}
//
//	public void setProductPrice(ReadableProductPrice productPrice) {
//		this.productPrice = productPrice;
//	}
//	end

	// Long add some lines here (21/4/2023)
//	public List<ReadableProductProperty> getProperties() {
//		return properties;
//	}
//
//	public void setProperties(List<ReadableProductProperty> properties) {
//		this.properties = properties;
//	}
//
//	public List<ReadableProductVariant> getVariants() {
//		return variants;
//	}
//
//	public void setVariants(List<ReadableProductVariant> variants) {
//		this.variants = variants;
//	}
	// end
	public List<ReadableSkillDescription> getSkillsDecription() {
		return skillsDecription;
	}

	// Long add some lines here (21/4/2023)
	public void setSkillsDecription(List<ReadableSkillDescription> skillsDecription) {
		this.skillsDecription = skillsDecription;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<ReadableLocationDescription> getLocationsDecription() {
		return locationsDecription;
	}

	public void setLocationsDecription(List<ReadableLocationDescription> locationsDecription) {
		this.locationsDecription = locationsDecription;
	}
	// end

//	Long add some lines here(13/05/2023)
	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

//	end

	// Long add some lines here (17/6/2023)
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

	public String getPayCycle() {
		return payCycle;
	}

	public void setPayCycle(String payCycle) {
		this.payCycle = payCycle;
	}

//	end
}
