package com.salesmanager.core.business.services.customer.profile;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.customer.profile.ProfileRepository;
import com.salesmanager.core.business.repositories.customer.profile.ProfileSkillRepository;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.profile.Profile;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private ProfileSkillRepository profileSkillRepository;

	@Override
	public Profile findProfileByCustomerName(String customerName) {
		Optional<Profile> profileOpt = profileRepository.findProfileByCustomerName(customerName);
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

	@Override
	@Transactional
	public void uploadAvatar(String username, byte[] byteAvt) {
		Optional<Profile> profileOpt = profileRepository.findByCustomerNick(username);
		if (!profileOpt.isPresent()) {
			throw new NullPointerException("Profile is null");
		}
		Profile profile = profileOpt.get();
		profile.setAvatar(byteAvt);
		profileRepository.save(profile);
	}

	@Override
	public byte[] getAvatar(String username) {
		Optional<Profile> profileOpt = profileRepository.findByCustomerNick(username);
		if (!profileOpt.isPresent()) {
			throw new NullPointerException("Profile is null");
		}
		return profileOpt.get().getAvatar();
	}
}
