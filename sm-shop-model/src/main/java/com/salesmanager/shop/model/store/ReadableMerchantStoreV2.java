package com.salesmanager.shop.model.store;

import java.io.Serializable;

public class ReadableMerchantStoreV2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String codeStore;
	private String phoneNumber;
	private String storeName;
	private String logo;

	public String getCodeStore() {
		return codeStore;
	}

	public void setCodeStore(String codeStore) {
		this.codeStore = codeStore;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

}
