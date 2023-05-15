package com.salesmanager.shop.store.facade.skill;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.skill.ProductSkillService;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

@Service
public class SkillFacadeImpl implements SkillFacade{

	@Autowired
	private ProductSkillService productSkillService;
	
	@Override
	public ReadableEntityList<ReadableSkillDescription> getSkills() {
		List<ReadableSkillDescription> readableSkillDescriptions = productSkillService.getSkills().stream().map(item->this.convertToReadleSkill(item) ).toList();
		ReadableEntityList<ReadableSkillDescription> entityList = new ReadableEntityList<ReadableSkillDescription>();
		entityList.setItems(readableSkillDescriptions);
		return entityList;
	}
	
	private ReadableSkillDescription convertToReadleSkill(SkillDescription sd) {
		ReadableSkillDescription readableSkillDescription = new ReadableSkillDescription();
		readableSkillDescription.setCode(sd.getCode());
		readableSkillDescription.setName(sd.getName());
		return readableSkillDescription;
	}

}
