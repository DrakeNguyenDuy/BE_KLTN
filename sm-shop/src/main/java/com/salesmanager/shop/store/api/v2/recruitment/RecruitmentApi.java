package com.salesmanager.shop.store.api.v2.recruitment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.model.recruitment.RecruitmentStatusDto;
import com.salesmanager.shop.model.recruitment.StatusProcessDto;
import com.salesmanager.shop.store.api.exception.RestApiException;
import com.salesmanager.shop.store.facade.recruitment.RecruitmentFacade;

@RestController
@RequestMapping(value = "/api/v1")
public class RecruitmentApi {

	@Autowired
	private RecruitmentFacade recruitmentFacade;

	@PostMapping(value = "/auth/recruitment/apply/{jobId}")
	public ResponseEntity<String> apply(@PathVariable Long jobId, HttpServletRequest request) {
		String customerName = request.getUserPrincipal().getName();// is nick name of customer
		try {
			return ResponseEntity.ok(recruitmentFacade.apply(customerName, jobId));
		} catch (NullPointerException e) {
			throw new RestApiException(e.getMessage());
		}
	}

	//get list alumnus applied a job
	@GetMapping(value = "/private/recruitment/{jobId}")
	public ResponseEntity<List<RecruitmentDto>> findRecruitmentByJob(@PathVariable Long jobId) {
		try {
			return ResponseEntity.ok(recruitmentFacade.findApplyByJob(jobId));
		} catch (NullPointerException e) {
			throw new RestApiException(e.getMessage());
		}
	}

	
	@GetMapping(value = "/auth/recruitment")
	public ResponseEntity<List<RecruitmentDto>> findRecruitmentByAlumnus(HttpServletRequest request) {
		String customerName = request.getUserPrincipal().getName();// is nick name of customer
		try {
			return ResponseEntity.ok(recruitmentFacade.findRecruitmentByAlumnus(customerName));
		} catch (NullPointerException e) {
			throw new RestApiException(e.getMessage());
		}
	}
	
	@PostMapping(value = "/private/recruitment/change")
	public ResponseEntity<String> changeStatus(@RequestBody RecruitmentStatusDto recruitmentStatusDto) {
		try {
			return ResponseEntity.ok(recruitmentFacade.changeStatus(recruitmentStatusDto));
		} catch (NullPointerException e) {
			throw new RestApiException(e.getMessage());
		}
	}
	
	@GetMapping(value = "/status-process")
	public ResponseEntity<List<StatusProcessDto>> getStatusProject() {
		try {
			return ResponseEntity.ok(recruitmentFacade.getListStatusProcess());
		} catch (NullPointerException e) {
			throw new RestApiException(e.getMessage());
		}
	}
}
