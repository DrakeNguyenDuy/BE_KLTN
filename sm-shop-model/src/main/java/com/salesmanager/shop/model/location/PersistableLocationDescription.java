package com.salesmanager.shop.model.location;

import java.io.Serializable;

public class PersistableLocationDescription implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long idLocation;
	private String detailAddress;
	private Long ward;
	private Long district;
	private Long province;

	public Long getIdLocation() {
		return idLocation;
	}

	public void setIdLocation(Long idLocation) {
		this.idLocation = idLocation;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public Long getWard() {
		return ward;
	}

	public void setWard(Long ward) {
		this.ward = ward;
	}

	public Long getDistrict() {
		return district;
	}

	public void setDistrict(Long district) {
		this.district = district;
	}

	public Long getProvince() {
		return province;
	}

	public void setProvince(Long province) {
		this.province = province;
	}

}
