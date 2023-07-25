package com.salesmanager.core.business.services.utils;

import java.util.List;

import com.salesmanager.core.model.system.SystemNotification;

public interface SystemService {

	void insertNotification(SystemNotification systemNotification);

	List<SystemNotification> findByRecieverNick(String nick);

	List<SystemNotification> findByMerchantStoreCode(String code);
	
	String changeIsOpenedAlumnus(String nickname);
	
	String changeIsOpenedEmployer(String storeCode);
}
