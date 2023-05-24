package com.salesmanager.shop.model.catalog.product.type;

import java.io.Serializable;

import com.salesmanager.shop.model.entity.Entity;

public class ProductTypeEntity extends Entity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String code;
//	Long add some lines here(24/5/2023)
	private String name;
//	end
	private boolean visible;
	boolean allowAddToCart;

	public boolean isAllowAddToCart() {
		return allowAddToCart;
	}

	public void setAllowAddToCart(boolean allowAddToCart) {
		this.allowAddToCart = allowAddToCart;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

//	Long add some lines here(24/5/2023)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
//	end

}
