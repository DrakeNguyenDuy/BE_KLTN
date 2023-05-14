package com.salesmanager.core.business.repositories.catalog.product.location;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductLocationEntryReposistoryImpl implements ProductLocationEntryReposistory {

	@Autowired
	private EntityManager entityManager;

	@Override
	public void delete(Long idProduct, Long idLocation) {
		String query = "delete from location_product_entry as lpe where ple.PRODUCTION_ID=:idProduct and ple.ID_LOCATION=:idLocation ";
		entityManager.createQuery(query).setParameter("idProduct", idProduct).setParameter(":idLocation", idLocation)
				.executeUpdate();
	}

}
