package com.salesmanager.shop.store.facade.recruitment;

import java.util.List;

import com.salesmanager.shop.model.recruitment.RecruitmentDto;

public interface RecruitmentFacade {

	String apply(String customerName, Long jobId);
	
	//get list apply by job
	public List<RecruitmentDto> findApplyByJob(Long productId);
	
	//get list apply by nick name of alumnus
	public List<RecruitmentDto> findRecruitmentByAlumnus(String nickname);
}
