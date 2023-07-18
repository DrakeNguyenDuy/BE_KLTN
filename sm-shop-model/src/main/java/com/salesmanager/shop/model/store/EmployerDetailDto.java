package com.salesmanager.shop.model.store;

import java.util.List;

import com.salesmanager.shop.model.catalog.product.ReadableProduct;

public class EmployerDetailDto {
	private Integer id;
	private String code;
	private String name;
	private Integer numOfEmployee;
	private String logo;
	private String background;
	private String sologan;
	private String description;
	private String address;
	private String phoneNumber;
	private List<ReadableProduct> jobs;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNumOfEmployee() {
		return numOfEmployee;
	}

	public void setNumOfEmployee(Integer numOfEmployee) {
		this.numOfEmployee = numOfEmployee;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getSologan() {
		return sologan;
	}

	public void setSologan(String sologan) {
		this.sologan = sologan;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<ReadableProduct> getJobs() {
		return jobs;
	}

	public void setJobs(List<ReadableProduct> jobs) {
		this.jobs = jobs;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}
