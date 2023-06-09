package com.salesmanager.core.business.repositories.catalog.product.type;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.catalog.product.type.ProductType;

public interface ProductTypeRepository extends JpaRepository<ProductType, Long> {

	Optional<ProductType> findByCode(String code);

//	Long hide some lines here(24/5/2023)
//	@Query(value = "select p from ProductType p left join fetch p.descriptions pd left join fetch p.merchantStore pm where p.code=?1 and (pm is null or pm.id=?2)")
//	ProductType findByCode(String code, Integer store);
//	end
	
//	Long add some lines here(24/5/2023)
	@Query(value = "select p from ProductType p left join fetch p.merchantStore pm where p.code=?1 and (pm is null or pm.id=?2)")
	ProductType findByCode(String code, Integer store);
//	end
	
//	Long hide some lines here(24/5/2023)
//	@Query(value = "select p from ProductType p left join fetch p.descriptions pd left join fetch p.merchantStore pm where p.id=?1 and (pm is null or pm.id=?2)")
//	ProductType findById(Long id, Integer store, int language);
//	end
	
//	Long add some lines here(24/5/2023)
	@Query(value = "select p from ProductType p left join fetch p.merchantStore pm where p.id=?1 and (pm is null or pm.id=?2)")
	ProductType findById(Long id, Integer store, int language);
//	end
	
//	Long hide some lines here(24/5/2023)
//	@Query(value = "select p from ProductType p left join fetch p.descriptions pd left join fetch p.merchantStore pm where p.id=?1 and (pm is null or pm.id=?2)")
//	ProductType findById(Long id, Integer store);
//	end
	
//	Long add some lines here(24/5/2023)
	@Query(value = "select p from ProductType p left join fetch p.merchantStore pm where p.id=?1 and (pm is null or pm.id=?2)")
	ProductType findById(Long id, Integer store);
//	end
	
//	Long hide some lines here(24/5/2023)
//	@Query(value = "select p from ProductType p left join fetch p.descriptions pd join fetch p.merchantStore pm where p.id in ?1 and (pm is null or pm.id=?2)")
//	List<ProductType> findByIds(List<Long> id, Integer store, int language);
//	end
	
//	Long add some lines here(24/5/2023)
	@Query(value = "select p from ProductType p join fetch p.merchantStore pm where p.id in ?1 and (pm is null or pm.id=?2)")
	List<ProductType> findByIds(List<Long> id, Integer store, int language);
//	end

}
