package com.salesmanager.shop.store.facade.system;

import java.util.List;
import java.util.Map;

import com.salesmanager.shop.populator.customer.ReadableCustomerList;
import com.salesmanager.shop.util.NotificationDto;

public interface SystemFacade {
	List<NotificationDto> findByRecieverNick(String nick);

	List<NotificationDto> findByMerchantStoreCode(String code);

	String changeIsOpenedAlumnus(String nickname);

	String changeIsOpenedEmployer(String storeCode);

	ReadableCustomerList getAlumnus(Integer page, Integer size, Map<String, String> map);
}
