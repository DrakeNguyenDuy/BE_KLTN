package com.salesmanager.shop.store.api.v2.profile;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;
import com.salesmanager.shop.model.entity.ReadableEntityList;
import com.salesmanager.shop.store.api.exception.RestApiException;
import com.salesmanager.shop.store.facade.customer.profile.ProfileFacade;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/api/v1")
public class ProfileApi {

	@Autowired
	private ProfileFacade profileFacade;

	@GetMapping(value = "/auth/profile")
	@ResponseStatus(HttpStatus.OK)
	@ApiOperation(httpMethod = "GET", value = "Get profile for a alumnus", notes = "", response = ReadableEntityList.class)
	public ReadableProfile getPofile(HttpServletRequest request) {
		String username = (request.getUserPrincipal().getName());
		return profileFacade.findProfile(username);
	}

	@PostMapping(value = "/auth/profile")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableProfile create(@RequestBody PersistableProfile persistableProfile, HttpServletRequest request) {
		persistableProfile.setId(-1l);
		String username = (request.getUserPrincipal().getName());
		ReadableProfile profile = profileFacade.findProfile(username);
		if (!Objects.isNull(profile)) {
			throw new RestApiException("Customer had profile");
		}
		return profileFacade.saveOrUpdate(username, persistableProfile);
	}

	@PutMapping(value = "/auth/profile")
	@ResponseStatus(code = HttpStatus.OK)
	public ReadableProfile update(@RequestBody PersistableProfile persistableProfile, HttpServletRequest request) {
		String username = (request.getUserPrincipal().getName());
		return profileFacade.saveOrUpdate(username, persistableProfile);
	}

	@PostMapping("/auth/profile/avatar")
	@ResponseStatus(code = HttpStatus.OK)	
	public void uploadAvatar(@RequestParam("file") MultipartFile avatar, HttpServletRequest request) {
		if (avatar.isEmpty()) {
			throw new RestApiException("Upload file is empty");
		}
		String username = (request.getUserPrincipal().getName());
		profileFacade.uploadAvatar(username, avatar);
	}

	@GetMapping("/profile/avatar/{username}")
	@ResponseStatus(code = HttpStatus.OK)
	public ResponseEntity<?> getAvatar(@PathVariable String username) {
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.valueOf("image/png"))
				.body(profileFacade.getAvatar(username));
	}
}
