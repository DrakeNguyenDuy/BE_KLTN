package com.salesmanager.shop.model.catalog.product.product.definition;

import com.salesmanager.shop.model.entity.Entity;

/**
 * Applies to product version 2 management
 * @author carlsamson
 *
 */
public class ProductDefinition extends Entity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	private boolean visible = true;
	
//	Long hide some lines here (3/5/2023)
//	private boolean shipeable = true;
//	private boolean virtual = false;
//	private boolean canBePurchased = true;
//	end
	
//	Long hide some lines here(5/5/2023)
//	private String dateAvailable;
//	end
	
//	Long add some lines here(6/5/2023)
	private String dateExperience;
//	end
	
	private String identifier;
	private String sku; //to match v1 api
	
//	Long hide some lines here (4/5/2023)
//	private ProductSpecification productSpecifications;
//	end
	
	private int sortOrder;
	
	
//	Long hide some lines here(5/5/2023)
//	public boolean isVisible() {
//		return visible;
//	}
//	public void setVisible(boolean visible) {
//		this.visible = visible;
//	}
//	public String getDateAvailable() {
//		return dateAvailable;
//	}
//	public void setDateAvailable(String dateAvailable) {
//		this.dateAvailable = dateAvailable;
//	}
//	end
	
	public String getIdentifier() {
		return identifier;
	}
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
	
//	Long hide some lines here(4/5/2023)
//	public ProductSpecification getProductSpecifications() {
//		return productSpecifications;
//	}
//	public void setProductSpecifications(ProductSpecification productSpecifications) {
//		this.productSpecifications = productSpecifications;
//	}
//	end
	
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	
//	Long hide some lines here(3/5/2023)
//	public boolean isShipeable() {
//		return shipeable;
//	}
//	public void setShipeable(boolean shipeable) {
//		this.shipeable = shipeable;
//	}
//	public boolean isVirtual() {
//		return virtual;
//	}
//	public void setVirtual(boolean virtual) {
//		this.virtual = virtual;
//	}
//	public boolean isCanBePurchased() {
//		return canBePurchased;
//	}
//	public void setCanBePurchased(boolean canBePurchased) {
//		this.canBePurchased = canBePurchased;
//	}
//	end
	
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}

//	Long add some lines here(6/5/2023)
	public String getDateExperience() {
		return dateExperience;
	}
	public void setDateExperience(String dateExperience) {
		this.dateExperience = dateExperience;
	}
//	end

}
