package com.salesmanager.shop.model.customer.profile;

public class ProfileSkillDto {

	private String id;
	private Long idSkill;
	private String nameSkill;
	private Double rate;
	private String des;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameSkill() {
		return nameSkill;
	}

	public void setNameSkill(String nameSkill) {
		this.nameSkill = nameSkill;
	}

	public String getDes() {
		return des;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Long getIdSkill() {
		return idSkill;
	}

	public void setIdSkill(Long idSkill) {
		this.idSkill = idSkill;
	}

}
