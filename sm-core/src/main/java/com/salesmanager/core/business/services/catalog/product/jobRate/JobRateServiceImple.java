package com.salesmanager.core.business.services.catalog.product.jobRate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.jobRate.JobRateRepository;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.core.model.customer.JobRateStatus;

@Service
public class JobRateServiceImple implements JobRateService {

	@Autowired
	private JobRateRepository jobRateRepository;

	@Override
	public void likeOrUnlike(JobRate jobRate) {
		jobRateRepository.save(jobRate);
	}

	@Override
	public List<JobRate> findByAlumnus(Customer alumnus) {
		return jobRateRepository.findByAlumnusAndJobRateStatus(alumnus, JobRateStatus.LIKED);
	}

	@Override
	public List<JobRate> findByJob(Product job) {
		return jobRateRepository.findByJobAndJobRateStatus(job, JobRateStatus.LIKED);
	}

	@Override
	public JobRate findByJobAndAlumnus(Product job, Customer alumnus) {
		return jobRateRepository.findByJobAndAlumnus(job, alumnus);
	}

}
