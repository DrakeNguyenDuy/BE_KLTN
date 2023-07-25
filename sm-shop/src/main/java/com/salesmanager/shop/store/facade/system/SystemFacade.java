package com.salesmanager.shop.store.facade.system;

import java.util.List;

import com.salesmanager.shop.util.NotificationDto;

public interface SystemFacade {
	List<NotificationDto> findByRecieverNick(String nick);

	List<NotificationDto> findByMerchantStoreCode(String code);
	
	String changeIsOpenedAlumnus(String nickname);
	
	String changeIsOpenedEmployer(String storeCode);
}
