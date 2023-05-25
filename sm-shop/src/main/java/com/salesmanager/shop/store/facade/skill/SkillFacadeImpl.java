package com.salesmanager.shop.store.facade.skill;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.skill.ProductSkillService;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.mapper.skill.PersistablSkillMapper;
import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;

@Service
public class SkillFacadeImpl implements SkillFacade {

	@Autowired
	private ProductSkillService productSkillService;

	@Autowired
	private PersistablSkillMapper persistablSkillMapper;

	@Override
	public ReadableEntityListV2<ReadableSkillDescription> getSkills() {
		List<ReadableSkillDescription> readableSkillDescriptions = productSkillService.getSkills().stream()
				.map(item -> this.convertToReadleSkill(item)).toList();
		ReadableEntityListV2<ReadableSkillDescription> entityList = new ReadableEntityListV2<ReadableSkillDescription>();
		entityList.setData(readableSkillDescriptions);
		return entityList;
	}

	private ReadableSkillDescription convertToReadleSkill(SkillDescription sd) {
		ReadableSkillDescription readableSkillDescription = new ReadableSkillDescription();
		readableSkillDescription.setId(sd.getId());
		readableSkillDescription.setCode(sd.getCode());
		readableSkillDescription.setName(sd.getName());
		return readableSkillDescription;
	}

	@Override
	public ReadableSkillDescription save(PersistableSkillDescription persistableSkillDescription) {
		SkillDescription skillDescription = persistablSkillMapper.convert(persistableSkillDescription, null, null);
		skillDescription = productSkillService.saveOrUpdate(skillDescription);
		return convertToReadleSkill(skillDescription);
	}

	@Override
	public ReadableSkillDescription update(Long id, PersistableSkillDescription persistableSkillDescription) {
		SkillDescription skillDescription = persistablSkillMapper.convert(persistableSkillDescription, null, null);
		skillDescription.setId(id);
		skillDescription = productSkillService.saveOrUpdate(skillDescription);
		return convertToReadleSkill(skillDescription);
	}

	@Override
	public void delete(Long id) {
		productSkillService.delete(id);
	}

}
