package com.salesmanager.shop.store.facade.product;

import java.util.List;

import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.shop.model.catalog.product.jobRate.JobRateDto;

public interface JobRateFacade {
	public void likeOrUnlike(String nickname, Long jobId);
	
	public List<JobRateDto> findByAlumnusId(String nickname);
	
	public List<JobRateDto> findByJobId(Long jobId);
}
