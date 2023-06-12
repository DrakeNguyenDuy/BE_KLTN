package com.salesmanager.core.business.services.catalog.product.jobRate;

import java.util.List;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.JobRate;

public interface JobRateService {

	public void likeOrUnlike(JobRate jobRate);
	
	public List<JobRate> findByAlumnus(Customer alumnus);
	
	public List<JobRate> findByJob(Product job);
	
	public JobRate findByJobAndAlumnus(Product job, Customer alumnus);
}
