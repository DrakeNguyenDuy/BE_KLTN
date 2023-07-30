package com.salesmanager.core.business.repositories.system;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.SystemNotification;

public interface SystemNotificationRepository extends JpaRepository<SystemNotification, Long> {
	List<SystemNotification> findByRecieverOrderByAuditSectionDateCreated(Customer alumnus);

	List<SystemNotification> findByMerchantStoreOrderByAuditSectionDateCreated(MerchantStore employer);
	
	List<SystemNotification> findByRecieverAndIsOpenedOrderByAuditSectionDateCreated(Customer alumnus, boolean isOpened);
	
	List<SystemNotification> findByMerchantStoreAndIsOpenedOrderByAuditSectionDateCreated(MerchantStore employer, boolean isOpened);
}
