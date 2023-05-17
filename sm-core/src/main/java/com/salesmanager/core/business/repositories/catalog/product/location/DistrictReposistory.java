package com.salesmanager.core.business.repositories.catalog.product.location;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.address.District;

@Repository
public interface DistrictReposistory extends JpaRepository<District, Long> {
	District findByIdDistrict(Long id);
}
