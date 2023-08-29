package com.salesmanager.shop.store.api.v2.system;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.merchant.MerchantStoreService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.recommender.main.Main;
import com.salesmanager.recommender.main.MainForAlumnus;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.mapper.store.StoreMapper;
import com.salesmanager.shop.mapper.user.UserMapper;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.customer.PersistableCustomer;
import com.salesmanager.shop.model.marketplace.SignupStore;
import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.model.store.PersistableMerchantStore;
import com.salesmanager.shop.model.user.PersistableUser;
import com.salesmanager.shop.model.user.ReadableUser;
import com.salesmanager.shop.populator.customer.ReadableCustomerList;
import com.salesmanager.shop.store.api.exception.ResourceNotFoundException;
import com.salesmanager.shop.store.api.exception.RestApiException;
import com.salesmanager.shop.store.api.exception.UnauthorizedException;
import com.salesmanager.shop.store.controller.customer.facade.CustomerFacade;
import com.salesmanager.shop.store.controller.store.facade.StoreFacade;
import com.salesmanager.shop.store.controller.user.facade.UserFacade;
import com.salesmanager.shop.store.facade.customer.profile.ProfileFacade;
import com.salesmanager.shop.store.facade.system.SystemFacade;
import com.salesmanager.shop.util.NotificationDto;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "/api/v1")
public class SystemApi {
	private static final Logger LOGGER = LoggerFactory.getLogger(SystemApi.class);

	@Inject
	private UserFacade userFacade;

	@Inject
	private StoreFacade storeFacade;

	@Autowired
	private SystemFacade facade;

	@Inject
	private CustomerFacade customerFacade;

	@Autowired
	private ProfileFacade profileFacade;

	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private MerchantStoreService merchantStoreService;

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
	public ResponseEntity<String> updateAvartar(@PathVariable(name = "user_name") String userName,
			@RequestParam("file") MultipartFile avatar) throws Exception {

		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));
		profileFacade.uploadAvatar(userName, avatar);
		return ResponseEntity.ok("Upload Success");
	}

	@PutMapping("/private/employer/{user_name}/is_block")
	public ResponseEntity<String> isBlockEmployer(@PathVariable(name = "user_name") String userName) throws Exception {
		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));
		return ResponseEntity.ok(customerFacade.unlockOrBlock(userName));
	}

	@PostMapping("/private/employer/add")
	public ResponseEntity<String> addEmployer(@RequestBody SignupStore store) throws Exception {
		store.setSuperAdmin(true);
		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}
		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));
		ReadableUser user = null;
		try {
			// check if user exists
			user = userFacade.findByUserName(store.getEmail());

		} catch (ResourceNotFoundException ignore) {// that is what will happen if user does not exists
		}
		if (user != null) {
			throw new RestApiException("409", "Email đã sử dụng");
		}
		if (storeFacade.existByCode(store.getCode())) {
			throw new RestApiException("409", "Mã nhà hàng đã tồn tại đã sử dụng");
		}
		PersistableMerchantStore merchantStore = storeMapper.convert(store, null, null);
		storeFacade.create(merchantStore);
		PersistableUser persistableUser = userMapper.convert(store, null, null);
		persistableUser.setStore(merchantStore.getCode());
		MerchantStore merchantStore2 = null;
		try {
			merchantStore2 = merchantStoreService.getByCode(store.getCode());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userFacade.create(persistableUser, merchantStore2);
		return ResponseEntity.ok("Tạo thành công");
	}

	@PutMapping("/private/employer/{user_id}/update")
	public ResponseEntity<String> updateEmployer(@PathVariable(name = "user_id") Long userId,
			@RequestBody SignupStore store) throws Exception {
		store.setSuperAdmin(true);
		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}
		return ResponseEntity.ok(userFacade.update(userId, store));
	}

	@PostMapping("/private/employer/{user_name}/avatar")
	public ResponseEntity<String> updateAvartarEmployer(@PathVariable(name = "user_name") String userName,
			@RequestParam("file") MultipartFile avatar) throws Exception {

		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}

		userFacade.authorizedGroup(authenticatedUser, Stream.of("SUPERADMIN").collect(Collectors.toList()));
		storeFacade.addStoreLogo(userName, avatar);
		return ResponseEntity.ok("Upload Success");
	}

	/**
	 * Creates a new user
	 *
	 * @param store
	 * @param user
	 * @return
	 */
	@ResponseStatus(HttpStatus.OK)
	@PostMapping(value = { "/private/admin/add" }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(httpMethod = "POST", value = "Creates a new admin", notes = "", response = ReadableUser.class)
	public ReadableUser create(@RequestBody PersistableUser user, HttpServletRequest request) {
		/** Must be superadmin or admin */
		String authenticatedUser = userFacade.authenticatedUser();
		if (authenticatedUser == null) {
			throw new UnauthorizedException();
		}
		// only admin and superadmin allowed
		userFacade.authorizedGroup(authenticatedUser,
				Stream.of(Constants.GROUP_SUPERADMIN)
						.collect(Collectors.toList()));

		return userFacade.create(user);
	}
	
	@GetMapping("/auth/recommender/job/{idAlumnus}")
	public ResponseEntity<List<ReadableProduct>> a(@PathVariable Long idAlumnus) {
		List<Long> idJob = Main.rs(idAlumnus);
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.getProductsRecommender(idJob));
	}
	@GetMapping("/auth/recommender/alumnus/{idJob}")
	public ResponseEntity<List<RecruitmentDto>> rsAlumnus(@PathVariable Long idJob) {
		List<Long> idAlumnus = MainForAlumnus.rs(idJob);
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.getAlumnusRecommender(idAlumnus));
	}
}
