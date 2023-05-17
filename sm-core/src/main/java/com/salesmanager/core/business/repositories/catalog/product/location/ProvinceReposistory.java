package com.salesmanager.core.business.repositories.catalog.product.location;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.address.Province;

@Repository
public interface ProvinceReposistory extends JpaRepository<Province, Long>{
	Province findByIdProvince(Long id);
}
