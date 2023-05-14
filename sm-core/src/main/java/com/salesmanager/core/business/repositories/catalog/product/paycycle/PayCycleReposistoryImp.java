package com.salesmanager.core.business.repositories.catalog.product.paycycle;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;

@Repository
public class PayCycleReposistoryImp implements PayCycleReposistory {

	@Autowired
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<PayCycleDescription> getAll() {
		String query = "selec distinct pcd from PayCycleDescription as pcd";
		return (List<PayCycleDescription>) entityManager.createQuery(query).getResultList();
	}

	@Override
	public PayCycleDescription getPayCycleByCode(String code) {
		String query = "selec distinct pcd from PayCycleDescription as pcd where pcd.code=:code";
		return (PayCycleDescription) entityManager.createQuery(query).setParameter("code", code).getSingleResult();
	}

}
