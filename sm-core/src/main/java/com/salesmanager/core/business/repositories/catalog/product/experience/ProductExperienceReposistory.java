package com.salesmanager.core.business.repositories.catalog.product.experience;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.experience.ExperienceDescription;

@Repository
public interface ProductExperienceReposistory extends JpaRepository<ExperienceDescription, Long>, CrudRepository<ExperienceDescription, Long> {
	ExperienceDescription findByCODE(String code);
	
	List<ExperienceDescription> findAll();
	
	Optional<ExperienceDescription> findById(Long id);
}
