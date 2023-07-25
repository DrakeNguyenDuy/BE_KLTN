package com.salesmanager.core.business.services.customer.profile;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.customer.profile.ProfileSkillRepository;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;

@Service
public class ProfileSkillEntryServiceImpl implements ProfileSkillService {

	@Autowired
	private ProfileSkillRepository profileSkillRepository;

	@Override
	@Transactional
	public List<ProfileSkillEntry> saveAll(List<ProfileSkillEntry> entries) {
		return profileSkillRepository.saveAll(entries);
	}

	@Override
	@Transactional
	public void deleteByProfile(Profile profile) {
		profileSkillRepository.deleteByProfile(profile);
	}

}
