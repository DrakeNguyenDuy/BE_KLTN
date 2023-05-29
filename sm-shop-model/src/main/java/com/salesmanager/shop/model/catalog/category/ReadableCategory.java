package com.salesmanager.shop.model.catalog.category;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

//Long add some lines here(30/5/2023)
@JsonInclude(JsonInclude.Include.NON_NULL)
//end
public class ReadableCategory extends CategoryEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CategoryDescription description;//one category based on language
	private int productCount;
//	Long add some lines here(30/5/2023)
	private String name;
//	end
	private String store;
	private List<ReadableCategory> children = new ArrayList<ReadableCategory>();
	
	
	public void setDescription(CategoryDescription description) {
		this.description = description;
	}
	public CategoryDescription getDescription() {
		return description;
	}

	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public List<ReadableCategory> getChildren() {
		return children;
	}
	public void setChildren(List<ReadableCategory> children) {
		this.children = children;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}

//	Long add some lines here(30/5/2023)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	end
}
