package com.salesmanager.shop.store.facade.recruitment;

import java.util.List;

import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.model.recruitment.RecruitmentStatusDto;
import com.salesmanager.shop.model.recruitment.StatusProcessDto;

public interface RecruitmentFacade {

	String apply(String customerName, Long jobId);
	
	//get list apply by job
	public List<RecruitmentDto> findApplyByJob(Long productId);
	
	//get list apply by nick name of alumnus
	public List<RecruitmentDto> findRecruitmentByAlumnus(String nickname);
	
	public String changeStatus(RecruitmentStatusDto recruitmentStatusDto);
	
	public List<StatusProcessDto> getListStatusProcess();
}
