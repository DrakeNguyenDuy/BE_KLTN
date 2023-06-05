package com.salesmanager.core.business.repositories.catalog.product.englishLevel;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.englishlevel.EnglishLevel;

public interface EnglishLevelReposistory extends JpaRepository<EnglishLevel, Long> {
	Optional<EnglishLevel> findByCode(String code);
}
