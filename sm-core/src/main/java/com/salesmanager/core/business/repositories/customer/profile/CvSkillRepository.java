package com.salesmanager.core.business.repositories.customer.profile;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.CVSkill;

public interface CvSkillRepository extends JpaRepository<CVSkill, String> {
	void deleteByCv(CV cv);
}
