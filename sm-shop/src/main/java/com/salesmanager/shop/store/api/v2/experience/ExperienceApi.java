package com.salesmanager.shop.store.api.v2.experience;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.experience.PersistableExperience;
import com.salesmanager.shop.model.experience.ReadableExperience;
import com.salesmanager.shop.store.facade.experience.ExperienceFacade;

@RestController
@RequestMapping(value = "/api/v2")
public class ExperienceApi {

	@Autowired
	private ExperienceFacade experienceFacade;

	@GetMapping(value = "/experiences")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadableExperience> getAll() {
		return experienceFacade.findAll();
	}

	@PostMapping(value = "/private/experience/create")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableExperience create(@RequestBody PersistableExperience persistableExperience) {
		return experienceFacade.crearte(persistableExperience);
	}

	@PutMapping(value = "/private/experience/{id}/update")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableExperience update(@PathVariable Long id, @RequestBody PersistableExperience persistableExperience) {
		return experienceFacade.update(id, persistableExperience);
	}

	@DeleteMapping(value = "/private/experience/{id}/delete")
	@ResponseStatus(code = HttpStatus.OK)
	public void delete(@PathVariable Long id) {
		experienceFacade.delete(id);
	}
}
