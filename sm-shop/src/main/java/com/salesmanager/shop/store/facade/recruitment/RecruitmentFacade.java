package com.salesmanager.shop.store.facade.recruitment;

import java.util.List;
import java.util.Map;

import com.salesmanager.shop.model.recruitment.ReadableRecruitmentList;
import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.model.recruitment.RecruitmentStatusDto;
import com.salesmanager.shop.model.recruitment.StatusProcessDto;

public interface RecruitmentFacade {

	String apply(String customerName, String codeJob);

	// get list apply by job
	public List<RecruitmentDto> findApplyByJob(String codeJob);

	// get list apply by nick name of alumnus
	public List<RecruitmentDto> findRecruitmentByAlumnus(String nickname);

	public String changeStatus(RecruitmentStatusDto recruitmentStatusDto);

	public List<StatusProcessDto> getListStatusProcess();

	public ReadableRecruitmentList findAlumnusByEmployer(String emailEmployer, Integer page, Integer size,
			Map<String, String> map);
}
