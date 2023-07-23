package com.salesmanager.core.business.services.utils;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;

import com.salesmanager.core.business.repositories.system.SystemNotificationRepository;
import com.salesmanager.core.model.system.SystemNotification;

public class SystemServiceImple implements SystemService{
	
	@Autowired
	private SystemNotificationRepository systemNotificationRepository;

	@Override
	@Transactional
	public void insertNotification(SystemNotification systemNotification) {
		systemNotificationRepository.save(systemNotification);
	}

}
