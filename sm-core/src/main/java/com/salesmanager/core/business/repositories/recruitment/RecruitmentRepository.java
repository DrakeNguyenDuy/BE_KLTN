package com.salesmanager.core.business.repositories.recruitment;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.recruitment.Recruitment;

public interface RecruitmentRepository extends JpaRepository<Recruitment, String> {
	List<Recruitment> findByJob(Product job);
	
	List<Recruitment> findByAlumnus(Customer alumnus);
	
	@Query("select r from Recruitment r where r.alumnus.id=:alumnusId and job.id=:jobId")
	Optional<Recruitment> checkExist(Long alumnusId, Long jobId);
	
}
