package com.salesmanager.core.business.services.catalog.product.englishLevel;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.englishLevel.EnglishLevelReposistory;
import com.salesmanager.core.model.englishlevel.EnglishLevel;

@Service
public class EnglishLevelServiceImpl implements EnglishLevelService {

	@Autowired
	private EnglishLevelReposistory englishLevelReposistory;

	@Override
	public EnglishLevel findByCode(String code) {
		Optional<EnglishLevel> englishLevelOpt = englishLevelReposistory.findByCode(code);
		if (!englishLevelOpt.isPresent()) {
			throw new NullPointerException("NOT FOUND ENGLISH LEVEL BY COED");
		}
		return englishLevelOpt.get();
	}

}
