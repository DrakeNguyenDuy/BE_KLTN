package com.salesmanager.core.business.services.catalog.product.skill;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.skill.ProductSkillReposistory;
import com.salesmanager.core.model.skill.SkillDescription;

@Service
public class ProductSkillServiceImpl implements ProductSkillService {

	@Autowired
	private ProductSkillReposistory productSkillReposistory;

	@Override
	public SkillDescription getSkillDescriptionByCode(String code) {
		return productSkillReposistory.getSkillDescriptionByCode(code);
	}

	@Override
	public List<SkillDescription> getSkills() {
		return productSkillReposistory.getSkills();
	}

}
