package com.salesmanager.shop.store.api.v2.position;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.position.ReadablePostion;
import com.salesmanager.shop.store.facade.position.PositionFacade;

@RestController
@RequestMapping(value = "/api/v2" )
public class PositionApi {
	
	@Autowired
	private PositionFacade positionFacade;

	@GetMapping(value = "/private/positions")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadablePostion> getAllPositions(){
		return positionFacade.getAll();
	}
}
