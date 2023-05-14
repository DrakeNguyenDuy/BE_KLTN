package com.salesmanager.core.business.repositories.catalog.product.skill;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.salesmanager.core.model.skill.SkillDescription;

@Repository
public class ProductSkillReposistoryImpl implements ProductSkillReposistory {
	private static final String HQL_GET_LOCATION_DESCRIPTION_BY_CODE = "select distinct sd from SkillDescription as sd where sd.code=:code";

	@Autowired
	private EntityManager entityManager;

	@Override
	public SkillDescription getSkillDescriptionByCode(String code) {
		return (SkillDescription) entityManager.createQuery(HQL_GET_LOCATION_DESCRIPTION_BY_CODE)
				.setParameter("code", code).getSingleResult();
	}

}
