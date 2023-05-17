package com.salesmanager.shop.store.api.v2.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.core.business.services.catalog.product.location.DistrictService;
import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.location.ReadableDistrict;
import com.salesmanager.shop.model.location.ReadableProvince;
import com.salesmanager.shop.model.location.ReadableWard;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;
import com.salesmanager.shop.store.facade.location.LocationFacade;
//import com.salesmanager.shop.store.facade.location.LocationFacadeImpl;
import com.salesmanager.shop.store.facade.skill.SkillFacade;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/api/v2")
public class LocationApi {

	@Autowired
	private LocationFacade locationFacade ;

	@GetMapping(value = "/private/provinces")
	@ResponseStatus(HttpStatus.OK)
	@ApiOperation(httpMethod = "GET", value = "Get provinces", notes = "", response = ReadableEntityList.class)
	public ReadableEntityListV2<ReadableProvince> getAlllProvinces() {
		return locationFacade.getProvinces();
	}
	
	@GetMapping(value = "/private/districts")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadableDistrict> getAllDistricts(@RequestParam(value = "id_province") Long idProvince){
		return locationFacade.getDistrict(idProvince);
	}
	
	@GetMapping(value = "/private/wards")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableEntityListV2<ReadableWard> getAllWards(@RequestParam(value = "id_district") Long idDistrict){
		return locationFacade.getWard(idDistrict);
	}
}
