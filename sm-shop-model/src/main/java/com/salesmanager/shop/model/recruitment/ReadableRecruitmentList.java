package com.salesmanager.shop.model.recruitment;

import java.util.ArrayList;
import java.util.List;
import com.salesmanager.shop.model.entity.ReadableList;

public class ReadableRecruitmentList extends ReadableList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<RecruitmentDto> recruitments = new ArrayList<RecruitmentDto>();

	public List<RecruitmentDto> getRecruitments() {
		return recruitments;
	}

	public void setRecruitments(List<RecruitmentDto> recruitments) {
		this.recruitments = recruitments;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
