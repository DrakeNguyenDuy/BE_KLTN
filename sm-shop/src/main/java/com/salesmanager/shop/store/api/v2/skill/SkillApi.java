package com.salesmanager.shop.store.api.v2.skill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.experience.PersistableExperience;
import com.salesmanager.shop.model.experience.ReadableExperience;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;
import com.salesmanager.shop.store.facade.skill.SkillFacade;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/api/v2")
public class SkillApi {

	@Autowired
	private SkillFacade skillFacade;

	@GetMapping(value = "/skills")
	@ResponseStatus(HttpStatus.OK)
	@ApiOperation(httpMethod = "GET", value = "Get all skill", notes = "", response = ReadableEntityList.class)
	public ReadableEntityListV2<ReadableSkillDescription> getSkills() {
		return skillFacade.getSkills();
	}

	@PostMapping(value = "/private/skill/create")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableSkillDescription create(@RequestBody PersistableSkillDescription persistableSkillDescription) {
		return skillFacade.save(persistableSkillDescription);
	}

	@PutMapping(value = "/private/skill/{id}/update")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableSkillDescription update(@PathVariable Long id,
			@RequestBody PersistableSkillDescription persistableSkillDescription) {
		return skillFacade.update(id, persistableSkillDescription);
	}

	@DeleteMapping(value = "/private/skill/{id}/delete")
	@ResponseStatus(code = HttpStatus.OK)
	public void delete(@PathVariable Long id) {
		skillFacade.delete(id);
	}
}
