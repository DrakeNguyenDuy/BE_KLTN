package com.salesmanager.core.business.repositories.catalog.product.position;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;

@Repository
public interface ProductPositionReposistory
		extends JpaRepository<PositionDescription, Long>, CrudRepository<PositionDescription, Long> {
	List<PositionDescription> findAll();

	PositionDescription findBycode(String code);
}
