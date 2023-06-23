package com.salesmanager.shop.mapper.customer.profile;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.salesmanager.core.business.repositories.catalog.product.skill.ProductSkillReposistory;
import com.salesmanager.core.business.repositories.customer.profile.ProfileRepository;
import com.salesmanager.core.business.repositories.customer.profile.ProfileSkillRepository;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.model.customer.profile.ProfileSkillDto;

import javassist.NotFoundException;

@Component
public class ProfileSkillEntryMapper {

	@Autowired
	private ProductSkillReposistory skillReposistory;

	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired 
	private ProfileSkillRepository profileSkillRepository;

	public ProfileSkillDto convertToDto(ProfileSkillEntry profileSkillEntry) {
		ProfileSkillDto dto = new ProfileSkillDto();
		dto.setId(profileSkillEntry.getId());
		dto.setNameSkill(profileSkillEntry.getSkill().getName());
		dto.setIdSkill(profileSkillEntry.getSkill().getId());
		if (profileSkillEntry.getRate() != null) {
			dto.setRate(profileSkillEntry.getRate());
		}
		if (StringUtils.hasText(profileSkillEntry.getDescription())) {
			dto.setDes(profileSkillEntry.getDescription());
		}
		return dto;
	}

	public ProfileSkillEntry convertToEntity(Profile profile, ProfileSkillDto source) throws NotFoundException  {
		ProfileSkillEntry des = null;
		if(StringUtils.hasText(source.getId())) {
			Optional<ProfileSkillEntry> tempOpt = profileSkillRepository.findById(source.getId());
			if(tempOpt.isPresent()) {
				des = tempOpt.get();
				des.setDescription(source.getDes());
				des.setRate(source.getRate());
				return des;
			}
		}
		
		des = new ProfileSkillEntry();
		if (source.getId() != null) {
			des.setId(source.getId());
		}
		Optional<SkillDescription> skillOpt = skillReposistory.findById(source.getIdSkill());

		if (!skillOpt.isPresent()) {
			throw new NotFoundException("Can not found skill");
		}

		des.setSkill(skillOpt.get());
		des.setProfile(profile);
		if (source.getRate() != null) {
			des.setRate(source.getRate());
		}
		if (StringUtils.hasText(source.getDes())) {
			des.setDescription(source.getDes());
		}
		return des;
	}
}
