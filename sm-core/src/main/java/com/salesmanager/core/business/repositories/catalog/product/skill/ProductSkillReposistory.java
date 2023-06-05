package com.salesmanager.core.business.repositories.catalog.product.skill;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductSkillReposistory
		extends JpaRepository<SkillDescription, Long>, CrudRepository<SkillDescription, Long> {
	SkillDescription findByCode(String code);

	public List<SkillDescription> findAll();

	public List<SkillDescription> findByCodeIn(List<String> codes);
}
