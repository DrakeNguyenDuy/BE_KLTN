package com.salesmanager.shop.store.api.v2.profile;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.customer.profile.CVDto;
import com.salesmanager.shop.store.api.exception.RestApiException;
import com.salesmanager.shop.store.facade.customer.profile.CVFacade;

@RestController
@RequestMapping(value = "/api/v1")
public class CVApi {

	@Autowired
	private CVFacade cvFacade;

	@GetMapping("/auth/cv")
	public ResponseEntity<CVDto> getCv(HttpServletRequest request) {
		String username = request.getUserPrincipal().getName();
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(cvFacade.findCVByAlumnusName(username));
	}

	@PostMapping("/auth/cv")
	public ResponseEntity<CVDto> createCv(@RequestBody CVDto cv, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String username = request.getUserPrincipal().getName();
		if (!Objects.isNull(cvFacade.findCVByAlumnusName(username))) {
			response.sendError(409, "Alumnus had a cv");
			return null;
		}
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(cvFacade.saveOrUpdate(username, cv));
	}

	@PutMapping("/auth/cv/{id}")
	public ResponseEntity<CVDto> updateCv(@PathVariable String id, @RequestBody CVDto cv, HttpServletRequest request) {
		cv.setId(id);
		String username = request.getUserPrincipal().getName();
		return ResponseEntity.status(HttpStatus.OK).contentType(MediaType.APPLICATION_JSON)
				.body(cvFacade.saveOrUpdate(username, cv));
	}

	@DeleteMapping("/auth/cv/{idCV}")
	@ResponseStatus(code = HttpStatus.OK)
	public void deleteCv(@PathVariable String idCV) {
		cvFacade.delete(idCV);
	}

	// view detail cv
	@GetMapping( "/auth/cv/{cvId}")
	public ResponseEntity<CVDto> detail(@PathVariable String cvId) {
		try {
			return ResponseEntity.ok(cvFacade.findById(cvId));
		} catch (NullPointerException e) {
			throw new RestApiException(e.getMessage());
		}
	}
}
