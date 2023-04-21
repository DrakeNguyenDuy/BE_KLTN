package com.salesmanager.shop.model.skill;

import java.io.Serializable;

public class ReadableSkillDescription implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long idSkill;
	private String code;
	private String name;

	public Long getIdSkill() {
		return idSkill;
	}

	public void setIdSkill(Long idSkill) {
		this.idSkill = idSkill;
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

}
