package com.salesmanager.core.business.services.utils;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.repositories.customer.CustomerRepository;
import com.salesmanager.core.business.repositories.merchant.MerchantRepository;
import com.salesmanager.core.business.repositories.system.SystemNotificationRepository;
import com.salesmanager.core.business.repositories.user.UserRepository;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.system.SystemNotification;
import com.salesmanager.core.model.user.User;

@Service
public class SystemServiceImple implements SystemService {

	@Autowired
	private SystemNotificationRepository systemNotificationRepository;

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private MerchantRepository merchantRepository;

	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional
	public void insertNotification(SystemNotification systemNotification) {
		systemNotificationRepository.save(systemNotification);
	}

	@Override
	public List<SystemNotification> findByRecieverNick(String nick) {
		Customer alumnus = customerRepository.findByNick(nick);
		if (!Objects.isNull(alumnus)) {
			return systemNotificationRepository.findByReciever(alumnus);
		}
		return Collections.emptyList();
	}

	@Override
	public List<SystemNotification> findByMerchantStoreCode(String mail) {
		Optional<User> employerOpt = userRepository.findByAdminEmail(mail);
		if (!employerOpt.isPresent()) {
			return Collections.emptyList();
		}
		if (!Objects.isNull(employerOpt.get().getMerchantStore())) {
			return systemNotificationRepository.findByMerchantStore(employerOpt.get().getMerchantStore());
		}
		return Collections.emptyList();
	}

	@Override
	public String changeIsOpenedAlumnus(String nickname) {
		Customer alumnus = customerRepository.findByNick(nickname);
		if (alumnus != null) {
			List<SystemNotification> systemNotifications = systemNotificationRepository
					.findByRecieverAndIsOpened(alumnus, false);
			for (SystemNotification systemNotification : systemNotifications) {
				systemNotification.setOpened(true);
			}
			systemNotificationRepository.saveAll(systemNotifications);
			return Constants.CHANGE_STATUS_SUCCESS;
		}
		return Constants.CHANGE_STATUS_FAIL;
	}

	@Override
	public String changeIsOpenedEmployer(String mail) {
		Optional<User> employerOpt = userRepository.findByAdminEmail(mail);
		if (!employerOpt.isPresent()) {
			return Constants.CHANGE_STATUS_FAIL;
		}
		if (!Objects.isNull(employerOpt.get().getMerchantStore())) {
			List<SystemNotification> systemNotifications = systemNotificationRepository
					.findByMerchantStoreAndIsOpened(employerOpt.get().getMerchantStore(), false);
			for (SystemNotification systemNotification : systemNotifications) {
				systemNotification.setOpened(true);
			}
			systemNotificationRepository.saveAll(systemNotifications);
			return Constants.CHANGE_STATUS_SUCCESS;
		}
		return Constants.CHANGE_STATUS_FAIL;
	}

}
