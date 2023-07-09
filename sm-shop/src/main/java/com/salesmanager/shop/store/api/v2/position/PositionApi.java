package com.salesmanager.shop.store.api.v2.position;

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
import com.salesmanager.shop.model.position.PersistablePosition;
import com.salesmanager.shop.model.position.ReadablePosition;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.store.facade.position.PositionFacade;

@RestController
@RequestMapping(value = "/api/v2" )
public class PositionApi {
	
	@Autowired
	private PositionFacade positionFacade;

	@GetMapping(value = "/positions")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadablePosition> getAllPositions(){
		return positionFacade.getAll();
	}
	
	@PostMapping(value = "/private/position/create")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadablePosition create(@RequestBody PersistablePosition persistablePosition) {
		return positionFacade.create(persistablePosition);
	}

	@PutMapping(value = "/private/position/{id}/update")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadablePosition update(@PathVariable Long id,
			@RequestBody PersistablePosition persistablePosition) {
		return positionFacade.update(id, persistablePosition);
	}

	@DeleteMapping(value = "/private/position/{id}/delete")
	@ResponseStatus(code = HttpStatus.OK)
	public void delete(@PathVariable Long id) {
		positionFacade.delete(id);
	}
}
