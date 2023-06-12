package com.salesmanager.core.business.services.recruitment;

import java.util.List;

import com.salesmanager.core.model.recruitment.Recruitment;

public interface RecruitmentService {
	public String appy(Recruitment recruitment);
	
	//get list apply by job
	public List<Recruitment> findApplyByJob(Long productId);
	
	//get list apply by nick name of alumnus
	public List<Recruitment> findRecruitmentByAlumnus(String nickname);
}
