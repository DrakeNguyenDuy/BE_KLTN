package com.salesmanager.core.business.repositories.catalog.product.location;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.location.LocationDescription;

@Repository
public class ProductLocationReposistoryImp implements ProductLocationReposistory {
	private static final String HQL_GET_LOCATION_DESCRIPTION_BY_CODE = "select distinct ld from LocationDescription as ld where ld.code=:code";

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public LocationDescription getLocationDescriptionByCode(String codeLocaltion) {
		try {
			return (LocationDescription) entityManager.createQuery(HQL_GET_LOCATION_DESCRIPTION_BY_CODE)
					.setParameter("code", codeLocaltion).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public List<LocationDescription> getLocations() {
		// TODO Auto-generated method stub
		return null;
	}

}
