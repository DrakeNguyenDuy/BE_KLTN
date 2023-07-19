package com.salesmanager.shop.store.api.v2.jobrate;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.catalog.product.jobRate.JobRateDto;
import com.salesmanager.shop.store.facade.product.JobRateFacade;

@RestController
@RequestMapping(value = "/api/v1")
public class JobRateApi {

	@Autowired
	private JobRateFacade jobRateFacade;

	@PostMapping(value = "/auth/rating/{jobCode}")
	@ResponseStatus(code = HttpStatus.OK)
	public void likeOrRejectLike(@PathVariable String jobCode, HttpServletRequest request) {
		String username = request.getUserPrincipal().getName();
		jobRateFacade.likeOrUnlike(username, jobCode);
	}

	@GetMapping(value = "/auth/rating")
	public ResponseEntity<List<JobRateDto>> findByAlumnus(HttpServletRequest request) {
		String nickName = request.getUserPrincipal().getName();
		return ResponseEntity.ok(jobRateFacade.findByAlumnusId(nickName));
	}

	@GetMapping(value = "/auth/rating/{jobId}")
	public ResponseEntity<List<JobRateDto>> findByJob(@PathVariable Long jobId) {
		return ResponseEntity.ok(jobRateFacade.findByJobId(jobId));
	}
}
