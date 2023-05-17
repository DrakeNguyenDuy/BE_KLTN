package com.salesmanager.core.business.repositories.catalog.product.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.address.District;

@Repository
public interface DistrictReposistory extends JpaRepository<District, Long> {
	District findByIdDistrict(Long id);

	//find all district belong a province
	@Query("select d from District d where d.province.idProvince=:idProvince")
	List<District> findAll(Long idProvince);
}
