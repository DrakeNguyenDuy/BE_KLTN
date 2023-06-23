package com.salesmanager.core.business.services.customer.profile;

import java.util.List;

import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;

public interface ProfileSkillService {

	List<ProfileSkillEntry> saveAll(List<ProfileSkillEntry> entries);
}
