package com.salesmanager.shop.store.api.v2.paycycle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.paycircle.ReadablePaycycle;
import com.salesmanager.shop.store.facade.paycycle.PaycycleFacade;

@RestController
@RequestMapping(value = "/api/v2")
public class PaycycleApi {

	@Autowired
	private PaycycleFacade paycycleFacade;

	@GetMapping(value = "/private/paycycles")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadablePaycycle> getAll() {
		{
			return paycycleFacade.findAll();
		}
	}
}
