package com.salesmanager.core.business.services.recruitment;

import java.util.List;
import java.util.Optional;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.recruitment.Recruitment;

public interface RecruitmentService {
	
	public String appy(Recruitment recruitment);

	// get list apply by job
	public List<Recruitment> findApplyByJob(String codeJob);

	// get list apply by nick name of alumnus
	public List<Recruitment> findRecruitmentByAlumnus(String nickname);

	public String changeStatus(Recruitment recruitment);

	public Optional<Recruitment> findById(String id);

	public void update(Recruitment r);

	public boolean existByAlumnusAndJob(Customer alumnus, Product job);
}
