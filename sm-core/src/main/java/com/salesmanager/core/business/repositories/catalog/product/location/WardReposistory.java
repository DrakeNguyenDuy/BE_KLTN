package com.salesmanager.core.business.repositories.catalog.product.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.address.Ward;

@Repository
public interface WardReposistory extends JpaRepository<Ward, Long> {

	Ward findByIdWard(Long idWard);

	// find all ward belong a district
	@Query("select w from Ward w where w.district.idDistrict=:idDistrict")
	List<Ward> findAll(Long idDistrict);
}
