package com.salesmanager.shop.model.location;

import java.io.Serializable;

public class ReadableLocationDescription implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long locationID;
	private String detailAddress;
	private String ward;
	private String district;
	private String province;

	public Long getLocationID() {
		return locationID;
	}

	public void setIdLocation(Long locationID) {
		this.locationID = locationID;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

}
