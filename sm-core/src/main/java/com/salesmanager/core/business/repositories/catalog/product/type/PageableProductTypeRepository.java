package com.salesmanager.core.business.repositories.catalog.product.type;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.salesmanager.core.model.catalog.product.type.ProductType;

public interface PageableProductTypeRepository extends PagingAndSortingRepository<ProductType, Long> {
	
//	Long hide some lines here(24/5/2023)
//	@Query(value = "select distinct p from ProductType p left join fetch p.descriptions pd left join fetch p.merchantStore pm where pm.id=?1",
//		 countQuery = "select count(p) from ProductType p left join p.merchantStore pm where pm.id = ?1")
//	end
	
//	Long add some lines here(24/5/2023)
	@Query(value = "select distinct p from ProductType p left join fetch p.merchantStore pm where pm.id=?1",
			 countQuery = "select count(p) from ProductType p left join p.merchantStore pm where pm.id = ?1")
//	end
	Page<ProductType> listByStore(Integer storeId, Pageable pageable);
	
//	Long add some lines here(24/5/2023))
	@Query(value = "select distinct p from ProductType p",
			 countQuery = "select count(p) from ProductType p")
	Page<ProductType> findAll(Pageable pageable);
//	end

}
