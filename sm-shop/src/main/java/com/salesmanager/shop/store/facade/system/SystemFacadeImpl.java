package com.salesmanager.shop.store.facade.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.utils.SystemService;
import com.salesmanager.core.model.system.SystemNotification;
import com.salesmanager.shop.mapper.system.SystemMapper;
import com.salesmanager.shop.util.NotificationDto;

@Component
public class SystemFacadeImpl implements SystemFacade {
	@Autowired
	private SystemService systemService;

	@Autowired
	private SystemMapper mapper;

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

}
