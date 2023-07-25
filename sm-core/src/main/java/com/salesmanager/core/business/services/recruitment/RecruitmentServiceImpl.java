package com.salesmanager.core.business.services.recruitment;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.recruitment.RecruitmentRepository;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.business.services.utils.SystemService;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.core.model.system.SystemNotification;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

	@Autowired
	private RecruitmentRepository recruitmentReposistory;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@Autowired
	private SystemService systemService;

	@Override
	@Transactional
	public String appy(Recruitment r) {
		Optional<Recruitment> isExist = recruitmentReposistory.checkExist(r.getAlumnus().getId(), r.getJob().getId());
		if (isExist.isPresent()) {
			return Constants.APPLY_DUPLICATE;
		}
		recruitmentReposistory.saveAndFlush(r);
		SystemNotification notification = new SystemNotification();
		notification.setOpened(false);
		notification.setStartDate(new Date());
		notification.setReciever(r.getAlumnus());
		notification.setValue(
				"Bạn vừa ứng tuyển thành công vào công việc: " + r.getJob().getProductDescription().getName());
		SystemNotification notificationAnother = new SystemNotification();
		notificationAnother.setOpened(false);
		notificationAnother.setStartDate(new Date());
		notificationAnother.setMerchantStore(r.getJob().getMerchantStore());
		notificationAnother.setValue(r.getAlumnus().getFirstName() + " " + r.getAlumnus().getLastName()
				+ " vừa ứng tuyển vào công việc: " + r.getJob().getProductDescription().getName());
		systemService.insertNotification(notificationAnother);
		systemService.insertNotification(notification);
		return Constants.APPLY_SUCCESS;
	}

	@Override
	public List<Recruitment> findApplyByJob(String codeJob) {
		Product job;
		try {
			job = productService.getBySku(codeJob);
		} catch (ServiceException e) {
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

	@Override
	public boolean existByAlumnusAndJob(Customer alumnus, Product job) {
		Optional<Recruitment> isExist = recruitmentReposistory.checkExist(alumnus.getId(), job.getId());
		if (isExist.isPresent()) {
			return true;
		}
		return false;
	}

}
