package com.salesmanager.shop.store.api.v2.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.PUT;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.store.facade.system.SystemFacade;
import com.salesmanager.shop.util.NotificationDto;

@RestController
@RequestMapping(value = "/api/v1")
public class SystemApi {

	@Autowired
	private SystemFacade facade;

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
	ResponseEntity<String> changeIsOpenedAlumnus(String nickname) {
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.changeIsOpenedAlumnus(nickname));
	}

	@PutMapping("/private/notification/opened")
	ResponseEntity<String> changeIsOpenedEmployer(String storeCode) {
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(facade.changeIsOpenedEmployer(storeCode));
	}
}
