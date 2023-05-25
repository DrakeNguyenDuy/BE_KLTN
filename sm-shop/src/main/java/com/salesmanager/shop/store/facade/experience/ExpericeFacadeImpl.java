package com.salesmanager.shop.store.facade.experience;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.experience.ProductExperienceService;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.shop.mapper.experience.PersistableExperienceMapper;
import com.salesmanager.shop.mapper.experience.ReadableExperienceMapper;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.experience.PersistableExperience;
import com.salesmanager.shop.model.experience.ReadableExperience;

@Service
public class ExpericeFacadeImpl implements ExperienceFacade {

	@Autowired
	private ProductExperienceService experienceService;

	@Autowired
	private ReadableExperienceMapper experienceMapper;

	@Autowired
	private PersistableExperienceMapper persistableExperienceMapper;

	@Override
	public ReadableEntityListV2<ReadableExperience> findAll() {
		List<ReadableExperience> experiences = experienceService.findALL().stream()
				.map(item -> experienceMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadableExperience> entityList = new ReadableEntityListV2<ReadableExperience>();
		entityList.setData(experiences);
		return entityList;
	}

	@Override
	public ReadableExperience crearte(PersistableExperience persistableExperience) {
		ExperienceDescription experienceDescription = persistableExperienceMapper.convert(persistableExperience, null,
				null);
		experienceDescription = experienceService.saveOrUpdate(experienceDescription);
		return experienceMapper.convert(experienceDescription, null, null);
	}

	@Override
	public ReadableExperience update(Long id, PersistableExperience persistableExperience) {
		ExperienceDescription experienceDescription = persistableExperienceMapper.convert(persistableExperience, null,
				null);
		experienceDescription.setId(id);
		experienceDescription = experienceService.saveOrUpdate(experienceDescription);
		return experienceMapper.convert(experienceDescription, null, null);
	}

	@Override
	public void delete(Long id) {
		experienceService.delete(id);
	}
}
