package com.salesmanager.core.business.repositories.catalog.product;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.salesmanager.core.model.catalog.product.Product;

public interface ProductRepository extends JpaRepository<Product, Long>, ProductRepositoryCustom, JpaSpecificationExecutor<Product> {

	@Query(value = "SELECT " + "CASE WHEN COUNT(*) > 0 THEN true ELSE false END " + "FROM " + "Product p "
			+ "JOIN MerchantStore m ON m.id = ?2 " + "LEFT JOIN ProductVariant pv ON pv.product.id = p.id "
			+ "WHERE (pv.sku = ?1 OR p.sku = ?1)")
	boolean existsBySku(String sku, Integer store);

	@Query(

			value = "select p.PRODUCT_ID from {h-schema}PRODUCT p join {h-schema}MERCHANT_STORE m ON p.MERCHANT_ID = m.MERCHANT_ID left join {h-schema}PRODUCT_VARIANT i ON i.PRODUCT_ID = p.PRODUCT_ID where p.SKU=?1 or i.SKU=?1 and m.MERCHANT_ID=?2", nativeQuery = true)
	List<Object> findBySku(String sku, Integer consultId);

//	Long add some lines here(20/5/2023)
	@Query(value = "select p from Product as p where p.sku=:sku")
	List<Product> findBySku(String sku);
//	end

	// Long add some lines here
	@Query("SELECT p FROM Product p ORDER BY p.auditSection.dateCreated DESC")
	List<Product> findLastestAndOrderByCreateAt(Pageable pageable);
	// end

}
