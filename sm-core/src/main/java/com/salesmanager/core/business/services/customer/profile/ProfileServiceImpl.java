package com.salesmanager.core.business.services.customer.profile;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.customer.profile.ProfileRepository;
import com.salesmanager.core.model.customer.profile.Profile;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileRepository profileRepository;

	@Override
	public Profile findProfile(Long customerId) {
		Optional<Profile> profileOpt = profileRepository.findProfileByCustomerId(customerId);
		if (!profileOpt.isPresent()) {
			return null;
		}
		return profileOpt.get();
	}

	@Override
	@Transactional
	public Profile saveOrUpdate(Profile profile) {
		return profileRepository.saveAndFlush(profile);
	}
}
