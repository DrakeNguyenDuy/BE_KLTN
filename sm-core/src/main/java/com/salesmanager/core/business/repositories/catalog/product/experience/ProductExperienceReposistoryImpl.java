package com.salesmanager.core.business.repositories.catalog.product.experience;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.experience.ExperienceDescription;

@Repository
public class ProductExperienceReposistoryImpl implements ProductExperienceReposistory {
	private static final String HQL_GET_EXPERIENCE_BY_CODE = "select distinct ed from ExperienceDescription as ed where ed.CODE=:code";

	@Autowired
	private EntityManager entityManager;

	@Override
	public ExperienceDescription getExperienceByCode(String code) {
		try {
			return (ExperienceDescription) entityManager.createQuery(HQL_GET_EXPERIENCE_BY_CODE)
					.setParameter("code", code).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
