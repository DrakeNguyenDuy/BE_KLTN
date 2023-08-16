package com.salesmanager.recommender.beans;

public class Item {
private Long id;
private String skill;
private String ward;
private String distinct;
private String province;

public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}

public String getSkill() {
	return skill;
}

public void setSkill(String skill) {
	this.skill = skill;
}

public String getWard() {
	return ward;
}

public void setWard(String ward) {
	this.ward = ward;
}

public String getDistinct() {
	return distinct;
}

public void setDistinct(String distinct) {
	this.distinct = distinct;
}

public String getProvince() {
	return province;
}

public void setProvince(String province) {
	this.province = province;
}
}
