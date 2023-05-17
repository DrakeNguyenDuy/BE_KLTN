package com.salesmanager.core.business.repositories.catalog.product.location;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.address.Ward;

@Repository
public interface WardReposistory extends JpaRepository<Ward, Long> {

	Ward findByIdWard(Long idWa);
}
