package com.salesmanager.shop.store.api.v2.profile;

import java.util.Objects;

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

import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;
import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.store.facade.customer.profile.ProfileFacade;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/api/v1")
public class ProfileApi {

	@Autowired
	private ProfileFacade profileFacade;

	@GetMapping(value = "/auth/profile/{id}")
	@ResponseStatus(HttpStatus.OK)
	@ApiOperation(httpMethod = "GET", value = "Get profile for a alumnus", notes = "", response = ReadableEntityList.class)
	public ReadableProfile getPofile(@PathVariable Long id) {
		return profileFacade.findProfile(id);
	}

	@PostMapping(value = "/auth/profile/{id}")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableProfile create(@PathVariable Long id, @RequestBody PersistableProfile persistableProfile) throws Exception {
		persistableProfile.setId(-1l);
		ReadableProfile profile = profileFacade.findProfile(id);
		if(!Objects.isNull(profile)) {
			throw new Exception("Customer had profile");
		}
		return profileFacade.saveOrUpdate(id, persistableProfile);
	}

	@PutMapping(value = "/auth/profile/{id}/update")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableProfile update(@PathVariable Long id, @RequestBody PersistableProfile persistableProfile) {
		return profileFacade.saveOrUpdate(id, persistableProfile);
	}
}
