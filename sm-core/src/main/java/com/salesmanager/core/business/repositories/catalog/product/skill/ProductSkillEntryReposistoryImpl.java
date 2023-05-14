package com.salesmanager.core.business.repositories.catalog.product.skill;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductSkillEntryReposistoryImpl implements ProductSkillEntryReposistory {

	@Autowired
	private EntityManager entityManager;

	@Override
	public void delete(Long idProduct, Long idSkill) {
		String query = "delete from skill_product_entry as pse where pse.PRODUCT_ID=:idProduct and pse.ID_SKILL=:idSkill";
		entityManager.createQuery(query).setParameter("idProduct", idProduct).setParameter("idSkill", idSkill)
				.executeUpdate();
	}

}
