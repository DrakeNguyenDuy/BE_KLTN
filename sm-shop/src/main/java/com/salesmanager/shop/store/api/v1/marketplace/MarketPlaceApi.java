package com.salesmanager.shop.store.api.v1.marketplace;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.merchant.MerchantStoreService;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.store.StoreMapper;
import com.salesmanager.shop.mapper.user.UserMapper;
import com.salesmanager.shop.model.marketplace.ReadableMarketPlace;
import com.salesmanager.shop.model.marketplace.SignupStore;
import com.salesmanager.shop.model.store.PersistableMerchantStore;
import com.salesmanager.shop.model.user.PersistableUser;
import com.salesmanager.shop.model.user.ReadableUser;
import com.salesmanager.shop.store.api.exception.OperationNotAllowedException;
import com.salesmanager.shop.store.api.exception.ResourceNotFoundException;
import com.salesmanager.shop.store.controller.marketplace.facade.MarketPlaceFacade;
import com.salesmanager.shop.store.controller.store.facade.StoreFacade;
import com.salesmanager.shop.store.controller.user.facade.UserFacade;
import com.salesmanager.shop.utils.LanguageUtils;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/api/v1")
public class MarketPlaceApi {

	@Autowired
	private MarketPlaceFacade marketPlaceFacade;

	@Autowired
	private UserFacade userFacade;

	@Inject
	private StoreFacade storeFacade;

	@Inject
	private LanguageUtils languageUtils;
	
	//Long add some lines here (3/5/2023)
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private MerchantStoreService merchantStoreService;
	//end

	/**
	 * Get a marketplace from storeCode returns market place details and
	 * merchant store
	 */
	@GetMapping("/private/marketplace/{store}")
	@ApiOperation(httpMethod = "GET", value = "Get market place meta-data", notes = "", produces = "application/json", response = ReadableMarketPlace.class)
	public ReadableMarketPlace marketPlace(@PathVariable String store,
			@RequestParam(value = "lang", required = false) String lang) {

		Language language = languageUtils.getServiceLanguage(lang);
		return marketPlaceFacade.get(store, language);
	}

	// signup new merchant
	@PostMapping("/store/signup")
	@ApiOperation(httpMethod = "POST", value = "Signup store", notes = "", produces = "application/json", response = Void.class)
	public String signup(@RequestBody SignupStore store, @ApiIgnore Language language) {

		ReadableUser user = null;
		try {
			// check if user exists
			user = userFacade.findByUserName(store.getEmail());

		} catch (ResourceNotFoundException ignore) {//that is what will happen if user does not exists
		}

		if (user != null) {
//			throw new OperationNotAllowedException(
//					"User [" + store.getEmail() + "] already exist and cannot be registered");
			return "Email đã được sử dụng";
		}

		// check if store exists
		if (storeFacade.existByCode(store.getCode())) {
//			throw new OperationNotAllowedException(
//					"Store [" + store.getCode() + "] already exist and cannot be registered");
			return "Mã nhà hàng(code) đã tồn tại";
		}
		
		// create store
		
		//Long add some lines here (3/5/2023)
		PersistableMerchantStore merchantStore = storeMapper.convert(store, null, null);
		storeFacade.create(merchantStore);
		
		// create user
		PersistableUser persistableUser = userMapper.convert(store, null, null);
		persistableUser.setStore(merchantStore.getCode());
//		MerchantStore merchantStore2 = storeMapper.convert(store);
		MerchantStore merchantStore2=null;
		try {
			merchantStore2 = merchantStoreService.getByCode(store.getCode());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		userFacade.create(persistableUser, merchantStore2);
		// send notification
		return "OK";

	}
	
	@ResponseStatus(HttpStatus.OK)
	@GetMapping(value = { "/store/{store}/signup/{token}" }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiOperation(httpMethod = "GET", value = "Validate store signup token", notes = "", response = Void.class)
	@ApiImplicitParams({ @ApiImplicitParam(name = "store", dataType = "String", defaultValue = "DEFAULT"),
			@ApiImplicitParam(name = "lang", dataType = "String", defaultValue = "en") })
	public void storeSignupVerify(@PathVariable String store, @PathVariable String token,
			@ApiIgnore MerchantStore merchantStore, 
			@ApiIgnore Language language) {

		/**
		 * Receives signup token. Needs to validate if a store
		 * to validate if token has expired
		 * 
		 * If no problem void is returned otherwise throw OperationNotAllowed
		 */

		//TBD

	}
}
