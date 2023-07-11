package com.salesmanager.core.business.repositories.customer.profile;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.Certificate;

public interface CertificateRepository extends JpaRepository<Certificate, String> {
	void deleteByCv(CV cv);
}
