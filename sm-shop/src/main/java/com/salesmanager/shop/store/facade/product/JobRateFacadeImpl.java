package com.salesmanager.shop.store.facade.product;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.catalog.product.jobRate.JobRateService;
import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.core.model.customer.JobRateStatus;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.mapper.catalog.product.JobRateMapper;
import com.salesmanager.shop.model.catalog.product.jobRate.JobRateDto;

@Component
public class JobRateFacadeImpl implements JobRateFacade {

	@Autowired
	private JobRateService jobRateService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private JobRateMapper jobRateMapper;

	@SuppressWarnings("null")
	@Override
	public void likeOrUnlike(String nickname, Long jobId) {
		Customer alumnus = customerService.getByNick(nickname);
		if (Objects.isNull(alumnus)) {
			throw new NullPointerException(Constants.NOT_FOUND_CUSTOMER_WHILE_CREATE_RATE);
		}
		Product job = productService.getById(jobId);
		if (Objects.isNull(job)) {
			throw new NullPointerException(Constants.NOT_FOUND_JOB_WHILE_CREATE_RATE);
		}

		JobRate jobRate = jobRateService.findByJobAndAlumnus(job, alumnus);

		Date now = new Date();
		if (Objects.isNull(jobRate)) {
			jobRate = new JobRate();
			jobRate.setAlumnus(alumnus);
			jobRate.setDateModified(now);
			jobRate.setJob(job);
			jobRate.setDateRating(now);
			jobRate.setJobRateStatus(JobRateStatus.LIKED);
		} else {
			jobRate.setDateModified(now);
			if(jobRate.getJobRateStatus().equals(JobRateStatus.REJECTLIKED)) {
				jobRate.setJobRateStatus(JobRateStatus.LIKED);
			}else {	
				jobRate.setJobRateStatus(JobRateStatus.REJECTLIKED);
			}				
		}
		jobRateService.likeOrUnlike(jobRate);
	}

	@Override
	public List<JobRateDto> findByAlumnusId(String nickname) {
		Customer alumnus = customerService.getByNick(nickname);
		if (Objects.isNull(alumnus)) {
			throw new NullPointerException(Constants.NOT_FOUND_CUSTOMER_WHILE_CREATE_RATE);
		}
		return jobRateMapper.convertToDtos(jobRateService.findByAlumnus(alumnus));
	}

	@Override
	public List<JobRateDto> findByJobId(Long jobId) {
		Product job = productService.getById(jobId);
		if (Objects.isNull(job)) {
			throw new NullPointerException(Constants.NOT_FOUND_JOB_WHILE_CREATE_RATE);
		}
		return jobRateMapper.convertToDtos(jobRateService.findByJob(job));
	}

}
