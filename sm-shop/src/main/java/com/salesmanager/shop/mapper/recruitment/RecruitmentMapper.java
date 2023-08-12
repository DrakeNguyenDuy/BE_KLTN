package com.salesmanager.shop.mapper.recruitment;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

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

	public Recruitment convertToEntity(String customerName, String codeJob) {
		Customer alumnus = customerRepository.findByNick(customerName);
		if (Objects.isNull(codeJob)) {
			throw new NullPointerException("Job not found when apply");
		}

		List<Product> jobs = productRepository.findBySku(codeJob);
		if (jobs.size()==0) {
			throw new NullPointerException("Can not found job when apply");
		}

		Product job = jobs.get(0);

		Recruitment recruitment = new Recruitment();
		recruitment.setAlumnus(alumnus);
		recruitment.setApplyDate(new Date());
		recruitment.setJob(job);
		recruitment.setStatusProcess(StatusProcess.APPLIED);
		return recruitment;
	}

	public List<RecruitmentDto> convertToDtos(List<Recruitment> recruitments) {
		return recruitments.stream().map(item -> convertToDto(item)).collect(Collectors.toList());
	}

	public RecruitmentDto convertToDto(Recruitment recruitment) {
		RecruitmentDto destination = new RecruitmentDto();
		destination.setId(recruitment.getId());
		destination.setApplyDate(ConverterDate.convertDateToString(recruitment.getApplyDate().toString()));
		destination.setCvId(recruitment.getAlumnus().getCvs().get(0).getId());
		destination.setIdJob(recruitment.getJob().getId());
		destination.setCodeJob(recruitment.getJob().getSku());
		destination
				.setNameAlumnus(recruitment.getAlumnus().getLastName() + " " + recruitment.getAlumnus().getFirstName());
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
