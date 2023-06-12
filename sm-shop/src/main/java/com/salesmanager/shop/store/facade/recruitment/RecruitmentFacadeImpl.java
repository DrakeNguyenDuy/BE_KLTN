package com.salesmanager.shop.store.facade.recruitment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.recruitment.RecruitmentService;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.shop.mapper.recruitment.RecruitmentMapper;
import com.salesmanager.shop.model.recruitment.RecruitmentDto;

@Service
public class RecruitmentFacadeImpl implements RecruitmentFacade {
	@Autowired
	private RecruitmentMapper recruitmentMapper;

	@Autowired
	private RecruitmentService recruitmentService;

	@Override
	public String apply(String customerName, Long jobId) {
		Recruitment recruitment = recruitmentMapper.convertToEntity(customerName, jobId);
		return recruitmentService.appy(recruitment);
	}

	@Override
	public List<RecruitmentDto> findApplyByJob(Long productId) {
		return recruitmentMapper.convertToDtos(recruitmentService.findApplyByJob(productId));
	}

	@Override
	public List<RecruitmentDto> findRecruitmentByAlumnus(String nickname) {
		return recruitmentMapper.convertToDtos(recruitmentService.findRecruitmentByAlumnus(nickname));
	}

}
