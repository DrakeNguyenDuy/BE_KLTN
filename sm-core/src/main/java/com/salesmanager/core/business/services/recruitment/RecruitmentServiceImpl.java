package com.salesmanager.core.business.services.recruitment;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.repositories.recruitment.RecruitmentRepository;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.recruitment.Recruitment;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

	@Autowired
	private RecruitmentRepository recruitmentReposistory;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@Override
	@Transactional
	public String appy(Recruitment r) {
		Optional<Recruitment> isExist = recruitmentReposistory.checkExist(r.getAlumnus().getId(), r.getJob().getId());
		if (isExist.isPresent()) {
			return Constants.APPLY_DUPLICATE;
		}
		recruitmentReposistory.saveAndFlush(r);
		return Constants.APPLY_SUCCESS;
	}

	@Override
	public List<Recruitment> findApplyByJob(Long productId) {
		Product job = productService.getById(productId);
		if (Objects.isNull(job)) {
			throw new NullPointerException(Constants.CAN_NOT_FOUND_JOB_WHEN_FIND_RECRUITMENT_BY_JOB);
		}
		return recruitmentReposistory.findByJob(job);
	}

	@Override
	public List<Recruitment> findRecruitmentByAlumnus(String nickname) {
		Customer alumus = customerService.getByNick(nickname);
		if (Objects.isNull(alumus)) {
			throw new NullPointerException(Constants.CAN_NOT_FOUND_ALUMNUS_WHEN_FIND_RECRUITMENT_BY_ALUMNUS);
		}
		return recruitmentReposistory.findByAlumnus(alumus);
	}

	@Override
	public String changeStatus(Recruitment recruitment) {
		recruitmentReposistory.save(recruitment);
		return Constants.CHANGE_STATUS_SUCCESS;
	}

	@Override
	public Optional<Recruitment> findById(String id) {
		return recruitmentReposistory.findById(id);
	}

	@Override
	public void update(Recruitment r) {
		recruitmentReposistory.save(r);
	}

}
