package com.salesmanager.core.business.repositories.catalog.product.jobRate;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.core.model.customer.JobRateStatus;

public interface JobRateRepository extends JpaRepository<JobRate, String> {

	List<JobRate> findByAlumnusAndJobRateStatus(Customer alumnus, JobRateStatus status);

	List<JobRate> findByJobAndJobRateStatus(Product job, JobRateStatus status);

	JobRate findByJobAndAlumnus(Product job, Customer alumnus);
}
