package com.salesmanager.shop.model.location;

import java.io.Serializable;

public class ReadableLocationDescription implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long locationID;
	private String detailAddress;
	private Long idWard;
	private String ward;
	private Long idDistinct;
	private String district;
	private Long idProvince;
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

	public Long getIdWard() {
		return idWard;
	}

	public void setIdWard(Long idWard) {
		this.idWard = idWard;
	}

	public Long getIdDistinct() {
		return idDistinct;
	}

	public void setIdDistinct(Long idDistinct) {
		this.idDistinct = idDistinct;
	}

	public Long getIdProvince() {
		return idProvince;
	}

	public void setIdProvince(Long idProvince) {
		this.idProvince = idProvince;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setLocationID(Long locationID) {
		this.locationID = locationID;
	}

}
