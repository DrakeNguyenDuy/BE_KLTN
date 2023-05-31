package com.salesmanager.core.business.repositories.customer.profile;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.customer.profile.Profile;

public interface ProfileRepository extends JpaRepository<Profile, Long> {
	
	@Query("select p from Profile p where p.customer.id=:idCustomer")
	Optional<Profile> findProfileByCustomerId(Long idCustomer);
}
