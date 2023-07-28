package com.salesmanager.shop.mapper.customer.profile;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.mapper.catalog.ReadableCategoryMapper;
import com.salesmanager.shop.mapper.catalog.ReadableProductTypeMapper;
import com.salesmanager.shop.mapper.experience.ReadableExperienceMapper;
import com.salesmanager.shop.mapper.location.ReadableDistrictMapper;
import com.salesmanager.shop.mapper.location.ReadableProvinceMapper;
import com.salesmanager.shop.mapper.paycircle.ReadablePaycircleMapper;
import com.salesmanager.shop.mapper.skill.ReadableSkillMapper;
import com.salesmanager.shop.model.customer.profile.ProfileSkillDto;
import com.salesmanager.shop.model.customer.profile.ReadableProfile;
import com.salesmanager.shop.model.englishLevel.ReadableEnglishLevel;
import com.salesmanager.shop.model.location.ReadableDistrict;
import com.salesmanager.shop.model.location.ReadableProvince;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;
import com.salesmanager.shop.utils.ConverterDate;

@Component
public class ReadableProfileMapper implements Mapper<Profile, ReadableProfile> {

//	@Autowired
//	private ReadableSkillMapper readableSkillMapper;

	@Autowired
	private ProfileSkillEntryMapper profileSkillEntryMapper;

	@Autowired
	private ReadableProductTypeMapper readableProductTypeMapper;

	@Autowired
	private ReadableCategoryMapper categoryMapper;

	@Autowired
	private ReadableDistrictMapper readableDistrictMapper;

	@Autowired
	private ReadableProvinceMapper readableProvinceMapper;

	@Autowired
	private ReadablePaycircleMapper readablePaycircleMapper;

	@Autowired
	private ReadableExperienceMapper readableExperienceMapper;

	@Override
	public ReadableProfile convert(Profile source, MerchantStore store, Language language) {
		ReadableProfile readableProfile = new ReadableProfile();
		return merge(source, readableProfile, store, language);
	}

	@Override
	public ReadableProfile merge(Profile source, ReadableProfile destination, MerchantStore store, Language language) {
		Validate.notNull(source, "Source can not be null");

		destination.setId(source.getId());
		String fullName = "";

		if (StringUtils.hasText(source.getCustomer().getLastName())) {
			fullName += source.getCustomer().getLastName();
			destination.setLastname(source.getCustomer().getLastName());
		}
		if (StringUtils.hasText(source.getCustomer().getEmailAddress())) {
			destination.setEmail(source.getCustomer().getEmailAddress());
		}
		if (StringUtils.hasText(source.getCustomer().getNick())) {
			destination.setUsername(source.getCustomer().getNick());
		}
		if (StringUtils.hasText(source.getCustomer().getFirstName())) {
			fullName += " " + source.getCustomer().getFirstName();
			destination.setFirstname(source.getCustomer().getFirstName());
		}
		if (source.getCustomer().getAvatar() != null) {
			destination.setAvatar("/api/v1/profile/avatar/" + source.getCustomer().getNick());
		}
		destination.setFullName(fullName);
		if (!Objects.isNull(source.getCustomer().getGender())
				&& StringUtils.hasText(source.getCustomer().getGender().name())) {
			destination.setGender(source.getCustomer().getGender().name());
		}
		if (!Objects.isNull(source.getGoal()) && StringUtils.hasText(source.getGoal())) {
			destination.setGoal(source.getGoal());
		}
		if (!Objects.isNull(source.getIntroduce()) && StringUtils.hasText(source.getIntroduce())) {
			destination.setIntroduce(source.getIntroduce());
		}
		if (!Objects.isNull(source.getEnglishLevel())) {
			ReadableEnglishLevel englishLevel = new ReadableEnglishLevel();
			englishLevel.setId(source.getEnglishLevel().getId());
			englishLevel.setCode(source.getEnglishLevel().getCode());
			englishLevel.setName(source.getEnglishLevel().getName());
			destination.setEnglishLevel(englishLevel);
		}
		if (!Objects.isNull(source.getCareer())) {
			destination.setCarreer(readableProductTypeMapper.convert(source.getCareer()));
		}
		if (!CollectionUtils.isEmpty(source.getSkills())) {
//			List<ReadableSkillDescription> skills = source.getSkills().stream()
//					.map(item -> this.readableSkillMapper.convert(item, store, language)).toList();
//			destination.setReadableSkillDescriptions(skills);
			List<ProfileSkillDto> skills = source.getSkills().stream()
					.map(item -> profileSkillEntryMapper.convertToDto(item)).toList();
			destination.setSkills(skills);
		}
		if (!Objects.isNull(source.getCategory())) {
			destination.setFormWork(categoryMapper.convert2Readable(source.getCategory()));
		}
		if (!CollectionUtils.isEmpty(source.getDistricts())) {
			List<ReadableDistrict> districts = source.getDistricts().stream()
					.map(item -> this.readableDistrictMapper.convert(item, store, language)).toList();
			destination.setDistricts(districts);
		}
		if (!Objects.isNull(source.getPayCycle())) {
			destination.setPaycycle(this.readablePaycircleMapper.convert(source.getPayCycle(), store, language));
		}
		if (!Objects.isNull(source.getExperience())) {
			destination.setExperience(this.readableExperienceMapper.convert(source.getExperience(), store, language));
		}
		if (Objects.nonNull(source.getCustomer().getDateOfBirth())) {
			destination.setDob(ConverterDate.convertDateToString(source.getCustomer().getDateOfBirth().toString()));
		}
		if (StringUtils.hasText(source.getCustomer().getPhoneNumber())) {
			destination.setPhone(source.getCustomer().getPhoneNumber());
		}
		if (!CollectionUtils.isEmpty(source.getDistricts())) {
			Set<ReadableProvince> provinces = new HashSet<ReadableProvince>();
			for (District district : source.getDistricts()) {
				provinces.add(readableProvinceMapper.convert(district.getProvince(), null, null));
			}
			destination.setProvinces(new ArrayList<ReadableProvince>(provinces));
		}
		return destination;
	}

}
