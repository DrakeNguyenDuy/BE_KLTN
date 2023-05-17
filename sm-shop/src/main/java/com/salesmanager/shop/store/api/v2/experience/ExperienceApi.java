package com.salesmanager.shop.store.api.v2.experience;

import org.hibernate.jdbc.Expectation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.experience.ReadableExperience;
import com.salesmanager.shop.store.facade.experience.ExperienceFacade;

@RestController
@RequestMapping(value = "/api/v2")
public class ExperienceApi {

	@Autowired
	private ExperienceFacade experienceFacade;

	@GetMapping(value = "/private/experiences")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadableExperience> getAll() {
		return experienceFacade.findAll();
	}
}
