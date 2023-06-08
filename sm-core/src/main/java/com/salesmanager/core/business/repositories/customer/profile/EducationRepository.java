package com.salesmanager.core.business.repositories.customer.profile;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.customer.profile.Education;

public interface EducationRepository extends JpaRepository<Education, String> {
	
}
