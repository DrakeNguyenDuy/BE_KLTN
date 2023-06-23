package com.salesmanager.core.business.repositories.customer.profile;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;

public interface ProfileSkillRepository extends JpaRepository<ProfileSkillEntry, String> {

}
