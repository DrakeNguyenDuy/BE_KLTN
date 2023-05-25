package com.salesmanager.shop.store.api.v2.paycycle;

import javax.persistence.Entity;

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
import com.salesmanager.shop.model.paycircle.PersistablePaycycle;
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
		return paycycleFacade.findAll();
	}

	@PostMapping(value = "/private/paycycle/create")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadablePaycycle create(@RequestBody PersistablePaycycle persistablePaycycle) {
		return paycycleFacade.create(persistablePaycycle);
	}

	@PutMapping(value = "/private/paycycles/{id}/update")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadablePaycycle update(@PathVariable Long id, @RequestBody PersistablePaycycle persistablePaycycle) {
		return paycycleFacade.update(id, persistablePaycycle);
	}

	@DeleteMapping(value = "/private/paycycle/{id}/delete")
	@ResponseStatus(code = HttpStatus.OK)
	public void delete(@PathVariable Long id) {
		paycycleFacade.delete(id);
	}
}
