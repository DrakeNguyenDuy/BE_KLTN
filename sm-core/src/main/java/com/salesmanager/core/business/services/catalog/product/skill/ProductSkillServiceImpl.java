package com.salesmanager.core.business.services.catalog.product.skill;

import java.util.List;

import javax.transaction.Transactional;

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
		return productSkillReposistory.findByCode(code);
	}

	@Override
	public List<SkillDescription> getSkills() {
		return productSkillReposistory.findAll();
	}

	@Override
	@Transactional
	public SkillDescription saveOrUpdate(SkillDescription skillDescription) {
		return productSkillReposistory.saveAndFlush(skillDescription);
	}

	@Override
	@Transactional
	public void delete(Long id) {
		productSkillReposistory.deleteById(id);
	}

	@Override
	public List<SkillDescription> findByCodeIn(List<String> codes) {
		return productSkillReposistory.findByCodeIn(codes);
	}

}
