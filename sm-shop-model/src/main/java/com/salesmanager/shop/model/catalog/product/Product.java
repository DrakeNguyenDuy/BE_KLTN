package com.salesmanager.shop.model.catalog.product;

import java.io.Serializable;

import com.salesmanager.shop.model.entity.Entity;


public class Product extends Entity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	Long hide some lines here(13/05/2023)
//	private boolean productShipeable = false;
//	end
	
	private boolean available;
	
//	Long hide some lines here(13/5/2023)
//	private boolean visible = true;
//	end

	private int sortOrder;
	private String dateAvailable;
//	Long add some lines here(13/5/2023)
	private String dateExperience;
//	end
//	private String creationDate;
	
	
//	Long hide some lines here
//	public boolean isProductShipeable() {
//		return productShipeable;
//	}
//	public void setProductShipeable(boolean productShipeable) {
//		this.productShipeable = productShipeable;
//	}
//	end
	
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public String getDateAvailable() {
		return dateAvailable;
	}
	public void setDateAvailable(String dateAvailable) {
		this.dateAvailable = dateAvailable;
	}
	
//	Long hide some lines here(13/5/2023)
//	public String getCreationDate() {
//		return creationDate;
//	}
//	public void setCreationDate(String creationDate) {
//		this.creationDate = creationDate;
//	}
//	
//	public boolean isVisible() {
//		return visible;
//	}
//	public void setVisible(boolean visible) {
//		this.visible = visible;
//	}
//	end

//	Long add some lines here
	public String getDateExperience() {
		return dateExperience;
	}
	public void setDateExperience(String dateExperience) {
		this.dateExperience = dateExperience;
	}
//	end

}
