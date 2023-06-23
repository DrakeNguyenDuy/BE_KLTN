package com.salesmanager.shop.store.facade.customer.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.customer.profile.CVService;
import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.shop.mapper.customer.profile.CVMapper;
import com.salesmanager.shop.model.customer.profile.CVDto;

@Component
public class CVFacadeImpl implements CVFacade {

	@Autowired
	private CVService cvService;

	@Autowired
	private CVMapper cvMapper;

	@Override
	public CVDto findCVByAlumnusName(String nickName) {
		CV cv = cvService.findByCustomerNickName(nickName);
		if(cv==null) return null;
		return cvMapper.convertToDto(cv);
	}

	@Override
	public CVDto saveOrUpdate(String nickName, CVDto cvDto) {
		CV cv = cvMapper.convertToEntity(nickName, cvDto);
		cv = cvService.saveOrUpdate(nickName, cvMapper.convertToEntity(nickName, cvDto));
		return cvMapper.convertToDto(cv);
	}

	@Override
	public void delete(String id) {
		cvService.delete(id);
	}

}
