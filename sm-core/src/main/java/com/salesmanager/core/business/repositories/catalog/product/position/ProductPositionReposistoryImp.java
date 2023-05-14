package com.salesmanager.core.business.repositories.catalog.product.position;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.catalog.product.position.PositionDescription;

@Repository
public class ProductPositionReposistoryImp implements ProductPositionReposistory {

	@Autowired
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<PositionDescription> getAll() {
		String query = "select distinct pd from PositionDescription as pd";
		return entityManager.createQuery(query).getResultList();
	}

	@Override
	public PositionDescription getPositionBycode(String code) {
		String query = "select distinct pd from PositionDescription as pd where pd.code=:code";
		return (PositionDescription) entityManager.createQuery(query).setParameter("code", code).getSingleResult();
	}

}
