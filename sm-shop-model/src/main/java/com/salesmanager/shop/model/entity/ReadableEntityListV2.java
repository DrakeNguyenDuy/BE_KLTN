package com.salesmanager.shop.model.entity;

import java.io.Serializable;
import java.util.List;

public class ReadableEntityListV2<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<T> data;

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

}
