package com.salesmanager.shop.store.facade.system;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.business.services.utils.SystemService;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.system.SystemNotification;
import com.salesmanager.shop.mapper.catalog.product.ReadableProductMapper;
import com.salesmanager.shop.mapper.customer.ReadableCustomerMapper;
import com.salesmanager.shop.mapper.system.SystemMapper;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.customer.ReadableCustomer;
import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.populator.customer.ReadableCustomerList;
import com.salesmanager.shop.util.NotificationDto;

@Component
public class SystemFacadeImpl implements SystemFacade {
	@Autowired
	private SystemService systemService;

	@Autowired
	private SystemMapper mapper;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@Autowired
	private ReadableProductMapper readableProductMapper;

	@Autowired
	private ReadableCustomerMapper readableCustomerMapper;

	@Override
	public List<NotificationDto> findByRecieverNick(String nick) {
		List<SystemNotification> notifications = systemService.findByRecieverNick(nick);
		return mapper.convertNotifiDtos(notifications);
	}

	@Override
	public List<NotificationDto> findByMerchantStoreCode(String code) {
		List<SystemNotification> notifications = systemService.findByMerchantStoreCode(code);
		return mapper.convertNotifiDtos(notifications);
	}

	@Override
	public String changeIsOpenedAlumnus(String nickname) {
		return systemService.changeIsOpenedAlumnus(nickname);
	}

	@Override
	public String changeIsOpenedEmployer(String storeCode) {
		return systemService.changeIsOpenedEmployer(storeCode);
	}

	@Override
	public ReadableCustomerList getAlumnus(Integer page, Integer size, Map<String, String> map) {
		Page<Customer> customerPage = customerService.findAll(page, size, map);
		List<Customer> customers = customerPage.getContent();
		List<ReadableCustomer> reacCustomers = customers.stream().map(item -> readableCustomerMapper.convertToDto(item))
				.collect(Collectors.toList());
		ReadableCustomerList result = new ReadableCustomerList();
		result.setRecordsTotal(customerPage.getTotalElements());
		result.setNumber(customerPage.getNumberOfElements());
		result.setCustomers(reacCustomers);
		result.setTotalPages(customerPage.getTotalPages());
		return result;
	}

	@Override
	public List<ReadableProduct> getProductsRecommender(List<Long> idJob) {
		List<ReadableProduct> list = new ArrayList<ReadableProduct>();
		List<Product> jobRecommender = productService.getProductsRecommender(idJob);
		if (!Objects.isNull(jobRecommender)) {
			list = jobRecommender.stream().map(item -> readableProductMapper.convert(item))
					.collect(Collectors.toList());
		}
		return list;
	}

	@Override
	public List<RecruitmentDto> getAlumnusRecommender(List<Long> idAlumnus) {
		List<RecruitmentDto> dtos = new ArrayList<RecruitmentDto>();
		List<Customer> customers = customerService.getIds(idAlumnus);
		for (Customer c : customers) {
			RecruitmentDto recruitmentDto = new RecruitmentDto();
			recruitmentDto.setAvartarAlumnus("/api/v1/profile/avatar/" + c.getNick());
			recruitmentDto.setNameAlumnus(c.getFirstName() + " " + c.getLastName());
			if(!CollectionUtils.isEmpty(c.getCvs())) {
				
				recruitmentDto.setCvId(c.getCvs().get(0).getId());
			}
			recruitmentDto.setSkills(c.getProfile().getSkills().stream().map(item -> item.getSkill().getName())
					.collect(Collectors.toList()));
			recruitmentDto.setLocations(c.getProfile().getDistricts().stream().map(item-> item.getName()).collect(Collectors.toList()));
			dtos.add(recruitmentDto);
		}
		return dtos;
	}
}
