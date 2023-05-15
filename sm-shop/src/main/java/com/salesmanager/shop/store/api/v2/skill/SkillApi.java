package com.salesmanager.shop.store.api.v2.skill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;
import com.salesmanager.shop.store.facade.skill.SkillFacade;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/api/v2")
public class SkillApi {

	@Autowired
	private SkillFacade skillFacade;

	@GetMapping(value = "/private/skills")
	@ResponseStatus(HttpStatus.OK)
	@ApiOperation(httpMethod = "GET", value = "Get all skill", notes = "", response = ReadableEntityList.class)
	public ReadableEntityList<ReadableSkillDescription> getSkills() {
		return skillFacade.getSkills();
	}
}
