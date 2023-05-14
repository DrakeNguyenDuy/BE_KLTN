package com.salesmanager.core.business.services.catalog.product.skill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.skill.ProductSkillEntryReposistory;

@Service
public class ProductSkillEntryServiceImpl implements ProductSkillEntryService {

	@Autowired
	private ProductSkillEntryReposistory productSkillEntryReposistory;

	@Override
	public void delete(Long idProduct, Long idSkill) {
		productSkillEntryReposistory.delete(idProduct, idSkill);
	}
}
