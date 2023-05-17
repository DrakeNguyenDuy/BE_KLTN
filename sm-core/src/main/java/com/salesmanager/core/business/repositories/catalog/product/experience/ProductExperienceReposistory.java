package com.salesmanager.core.business.repositories.catalog.product.experience;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.experience.ExperienceDescription;

public interface ProductExperienceReposistory extends JpaRepository<ExperienceDescription, Long> {
	ExperienceDescription findByCODE(String code);
	
	List<ExperienceDescription> findAll();
}
