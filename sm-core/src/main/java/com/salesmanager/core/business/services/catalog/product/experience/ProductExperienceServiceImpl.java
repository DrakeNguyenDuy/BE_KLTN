package com.salesmanager.core.business.services.catalog.product.experience;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.experience.ProductExperienceReposistory;
import com.salesmanager.core.model.experience.ExperienceDescription;

@Service
public class ProductExperienceServiceImpl implements ProductExperienceService{
	@Autowired
	private ProductExperienceReposistory experienceReposistory;
	
	@Override
	public ExperienceDescription getExperienceByCode(String code) {
		return experienceReposistory.getExperienceByCode(code);
	}

}
