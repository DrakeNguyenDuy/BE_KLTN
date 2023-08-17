package com.salesmanager.shop.store.facade.system;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.business.services.utils.SystemService;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.system.SystemNotification;
import com.salesmanager.shop.mapper.customer.ReadableCustomerMapper;
import com.salesmanager.shop.mapper.system.SystemMapper;
import com.salesmanager.shop.model.customer.ReadableCustomer;
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

}
