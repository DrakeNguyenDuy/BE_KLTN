package com.salesmanager.core.business.repositories.customer.profile;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.Certificate;

public interface CertificateRepository extends JpaRepository<Certificate, String> {
	
	@Modifying
    @Query("DELETE FROM Certificate WHERE cv = :cv")
	void deleteByCv(CV cv);
}
