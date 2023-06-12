package com.salesmanager.shop.mapper.recruitment;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.repositories.catalog.product.ProductRepository;
import com.salesmanager.core.business.repositories.customer.CustomerRepository;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.core.model.recruitment.StatusProcess;
import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.utils.ConverterDate;

@Component
public class RecruitmentMapper {
	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private ProductRepository productRepository;

	public Recruitment convertToEntity(String customerName, Long jobId) {
		Customer alumnus = customerRepository.findByNick(customerName);
		if (Objects.isNull(jobId)) {
			throw new NullPointerException("Customer not found when apply");
		}

		Optional<Product> jobOpt = productRepository.findById(jobId);
		if (!jobOpt.isPresent()) {
			throw new NullPointerException("Can not found job when apply");
		}

		Product job = jobOpt.get();

		Recruitment recruitment = new Recruitment();
		recruitment.setAlumnus(alumnus);
		recruitment.setApplyDate(new Date());
		recruitment.setJob(job);
		recruitment.setStatusProcess(StatusProcess.APPLIED);
		return recruitment;
	}

	public List<RecruitmentDto> convertToDtos(List<Recruitment> recruitments) {
		return recruitments.stream().map(item -> convertToDto(item)).toList();
	}

	public RecruitmentDto convertToDto(Recruitment recruitment) {
		RecruitmentDto destination = new RecruitmentDto();
		destination.setId(recruitment.getId());
		destination.setApplyDate(ConverterDate.convertDateToString(recruitment.getApplyDate().toString()));
		destination.setCvId(recruitment.getAlumnus().getCvs().get(0).getId());
		destination.setIdJob(recruitment.getJob().getId());
		if (!Objects.isNull(recruitment.getJob().getMerchantStore().getStorename())) {
			destination.setNameCompany(recruitment.getJob().getMerchantStore().getStorename());
		}
		if (recruitment.getJob().getDescriptions().iterator().hasNext()) {
			destination.setNameJob(recruitment.getJob().getDescriptions().iterator().next().getName());
		}
		destination.setStatus(recruitment.getStatusProcess().toString());
		return destination;
	}
}
