package com.salesmanager.core.business.services.catalog.product.experience;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.experience.ProductExperienceReposistory;
import com.salesmanager.core.model.experience.ExperienceDescription;

@Service
public class ProductExperienceServiceImpl implements ProductExperienceService {
	@Autowired
	private ProductExperienceReposistory experienceReposistory;

	@Override
	public ExperienceDescription getExperienceByCode(String code) {
		return experienceReposistory.findByCODE(code);
	}

	@Override
	public List<ExperienceDescription> findALL() {
		return experienceReposistory.findAll();
	}

	@Override
	@Transactional
	public void delete(Long id) {
		experienceReposistory.deleteById(id);
	}

	@Override
	@Transactional
	public ExperienceDescription saveOrUpdate(ExperienceDescription experienceDescription) {
		return experienceReposistory.saveAndFlush(experienceDescription);
	}

}
