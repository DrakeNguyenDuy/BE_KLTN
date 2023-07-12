package com.salesmanager.core.business.repositories.customer.profile;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.CVSkill;

public interface CvSkillRepository extends JpaRepository<CVSkill, String> {
	
	@Modifying
    @Query("DELETE FROM CVSkill WHERE cv = :cv")
	void deleteByCv(CV cv);
}
