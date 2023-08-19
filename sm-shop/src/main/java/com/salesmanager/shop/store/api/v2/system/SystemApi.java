package com.salesmanager.shop.store.api.v2.system;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.salesmanager.shop.model.customer.PersistableCustomer;
import com.salesmanager.shop.populator.customer.ReadableCustomerList;
import com.salesmanager.shop.store.api.exception.UnauthorizedException;
import com.salesmanager.shop.store.controller.customer.facade.CustomerFacade;
import com.salesmanager.shop.store.controller.user.facade.UserFacade;
import com.salesmanager.shop.store.facade.customer.profile.ProfileFacade;
import com.salesmanager.shop.store.facade.system.SystemFacade;
import com.salesmanager.shop.util.NotificationDto;

@RestController
@RequestMapping(value = "/api/v1")
public class SystemApi {
	private static final Logger LOGGER = LoggerFactory.getLogger(SystemApi.class);

	@Inject
	private UserFacade userFacade;

	@Autowired
	private SystemFacade facade;

	@Inject
	private CustomerFacade customerFacade;

	@Autowired
	private ProfileFacade profileFacade;

	@GetMapping("/auth/notification")
	public ResponseEntity<List<NotificationDto>> getNofForAlumnus(HttpServletRequest request) {
		String username = request.getUserPrincipal().getName();
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.findByRecieverNick(username));
	}

	@GetMapping("/private/notification")
	public ResponseEntity<List<NotificationDto>> getNofForEmployer(HttpServletRequest request) {
		String code = request.getUserPrincipal().getName();
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.findByMerchantStoreCode(code));
	}

	@PutMapping("/auth/notification/opened")
	ResponseEntity<String> changeIsOpenedAlumnus(HttpServletRequest request) {
		String nickname = request.getUserPrincipal().getName();
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.changeIsOpenedAlumnus(nickname));
	}

	@PutMapping("/private/notification/opened")
	ResponseEntity<String> changeIsOpenedEmployer(HttpServletRequest request) {
		String mail = request.getUserPrincipal().getName();
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.changeIsOpenedEmployer(mail));
	}

	@GetMapping("/private/alumnus")
	public ResponseEntity<ReadableCustomerList> getAlumnus(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "10") Integer size, @RequestParam Map<String, String> map) {
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.getAlumnus(page, size, map));
	}

	@PostMapping("/private/alumnus/add")
	public ResponseEntity<PersistableCustomer> addAlumnus(@RequestBody PersistableCustomer customer) throws Exception {
		customer.setUserName(customer.getEmailAddress());
		customer.setRepeatPassword(customer.getPassword());
//		Validate.notNull(customer.getUserName(), "Username cannot be null");

		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));

		return ResponseEntity.ok(customerFacade.registerCustomer(customer, null, null));
	}

	@PutMapping("/private/alumnus/{user_name}/is_block")
	public ResponseEntity<String> isBlock(@PathVariable(name = "user_name") String userName) throws Exception {
		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));
		return ResponseEntity.ok(customerFacade.unlockOrBlock(userName));
	}

	@PostMapping("/private/alumnus/update")
	public ResponseEntity<PersistableCustomer> updateAlumnus(@RequestBody PersistableCustomer customer)
			throws Exception {
		customer.setRepeatPassword(customer.getPassword());

		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));

		return ResponseEntity.ok(customerFacade.updateAlumnusByAdmin(customer));
	}
	
	@PostMapping("/private/alumnus/{user_name}/avatar")
	public ResponseEntity<String> updateAvartar(@PathVariable(name = "user_name") String userName,@RequestParam("file") MultipartFile avatar)
			throws Exception {

		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));
		profileFacade.uploadAvatar(userName, avatar);
		return ResponseEntity.ok("Upload Success");
	}

//	@GetMapping("/private/employers")
//	public ResponseEntity<List<NotificationDto>> getEmployers(HttpServletRequest request) {
//		String code = request.getUserPrincipal().getName();
//		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
//				.body(facade.findByMerchantStoreCode(code));
//	}
}
