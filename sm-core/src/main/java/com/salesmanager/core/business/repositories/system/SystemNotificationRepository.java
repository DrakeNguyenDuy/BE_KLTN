package com.salesmanager.core.business.repositories.system;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.SystemNotification;

public interface SystemNotificationRepository extends JpaRepository<SystemNotification, Long> {
	List<SystemNotification> findByReciever(Customer alumnus);

	List<SystemNotification> findByMerchantStore(MerchantStore employer);
	
	List<SystemNotification> findByRecieverAndIsOpened(Customer alumnus, boolean isOpened);
	
	List<SystemNotification> findByMerchantStoreAndIsOpened(MerchantStore employer, boolean isOpened);
}
