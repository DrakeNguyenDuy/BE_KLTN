package com.salesmanager.core.business.repositories.customer.profile;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.customer.profile.CV;

import ca.canadapost.cpcdp.rating.generated.discovery.Option;

public interface CVRepository extends JpaRepository<CV, String> {

	@Query("select cv from CV cv where cv.alumnus.nick=:nickName")
	Optional<CV> findByAlumnusNickName(String nickName);
}
