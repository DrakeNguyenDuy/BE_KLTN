//package com.salesmanager.shop.mapper.customer.profile;
//
//import java.util.List;
//import java.util.Objects;
//
//import org.apache.commons.lang3.Validate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.util.CollectionUtils;
//import org.springframework.util.StringUtils;
//
//import com.salesmanager.core.model.customer.profile.Profile;
//import com.salesmanager.core.model.merchant.MerchantStore;
//import com.salesmanager.core.model.reference.language.Language;
//import com.salesmanager.shop.mapper.Mapper;
//import com.salesmanager.shop.mapper.catalog.PersistableProductTypeMapper;
//import com.salesmanager.shop.mapper.catalog.ReadableCategoryMapper;
//import com.salesmanager.shop.mapper.catalog.ReadableProductTypeMapper;
//import com.salesmanager.shop.mapper.experience.PersistableExperienceMapper;
//import com.salesmanager.shop.mapper.experience.ReadableExperienceMapper;
//import com.salesmanager.shop.mapper.location.PersistableDistrictMapper;
//import com.salesmanager.shop.mapper.location.ReadableDistrictMapper;
//import com.salesmanager.shop.mapper.paycircle.PersistablePaycycleMapper;
//import com.salesmanager.shop.mapper.paycircle.ReadablePaycircleMapper;
//import com.salesmanager.shop.mapper.skill.PersistablSkillMapper;
//import com.salesmanager.shop.mapper.skill.ReadableSkillMapper;
//import com.salesmanager.shop.model.customer.profile.PersistableProfile;
//import com.salesmanager.shop.model.customer.profile.ReadableProfile;
//import com.salesmanager.shop.model.englishLevel.ReadablEnglishLevel;
//import com.salesmanager.shop.model.location.ReadableDistrict;
//import com.salesmanager.shop.model.skill.ReadableSkillDescription;
//
//public class PersistableProfileMapper implements Mapper<PersistableProfile, Profile> {
//
//	@Autowired
//	private PersistablSkillMapper persistableSkillMapper;
//
//	@Autowired
//	private PersistableProductTypeMapper persistableProductTypeMapper;
//
//	@Autowired
//	private ReadableCategoryMapper readableCategoryMapper;
//
//	@Autowired
//	private PersistableDistrictMapper persistableDistrictMapper;
//
//	@Autowired
//	private PersistablePaycycleMapper persistablePaycycleMapper;
//
//	@Autowired
//	private PersistableExperienceMapper persistableExperienceMapper;
//
//	@Override
//	public Profile convert(PersistableProfile source, MerchantStore store, Language language) {
//		Profile profile = new Profile();
//		return merge(source, profile, store, language)
//	}
//
//	@Override
//	public Profile merge(PersistableProfile source, Profile destination, MerchantStore store, Language language) {
//		Validate.notNull(source, "Source can not be nukll");
//		String fullName = "";
//		if (StringUtils.hasText(source.getLastName())) {
//			destination.set source.getCustomer().getLastName();
//		}
//		if (StringUtils.hasText(source.getCustomer().getFirstName())) {
//			fullName += source.getCustomer().getFirstName();
//		}
//		destination.setFullName(fullName);
//		if (!Objects.isNull(source.getCustomer().getGender())
//				&& StringUtils.hasText(source.getCustomer().getGender().name())) {
//			destination.setGender(source.getCustomer().getGender().name());
//		}
//		if (!Objects.isNull(source.getGoal()) && StringUtils.hasText(source.getGoal())) {
//			destination.setGoal(source.getGoal());
//		}
//		if (!Objects.isNull(source.getIntroduce()) && StringUtils.hasText(source.getIntroduce())) {
//			destination.setIntroduce(source.getIntroduce());
//		}
//		if (!Objects.isNull(source.getEnglishLevel())) {
//			ReadablEnglishLevel englishLevel = new ReadablEnglishLevel();
//			englishLevel.setId(source.getEnglishLevel().getId());
//			englishLevel.setCode(source.getEnglishLevel().getCode());
//			englishLevel.setName(source.getEnglishLevel().getName());
//			destination.setEnglishLevel(englishLevel);
//		}
//		if (!Objects.isNull(source.getCareer())) {
//			destination.setCarreer(persistableProductTypeMapper.convert(source.getCareer()));
//		}
//		if (!CollectionUtils.isEmpty(source.getSkills())) {
//			List<ReadableSkillDescription> skills = source.getSkills().stream()
//					.map(item -> this.persistableSkillMapper.convert(item, store, language)).toList();
//			destination.setReadableSkillDescriptions(skills);
//
//		}
//		if (!Objects.isNull(source.getCategory())) {
//			destination.setFormWork(categoryMapper.convert2Readable(source.getCategory()));
//		}
//		if (!CollectionUtils.isEmpty(source.getDistricts())) {
//			List<ReadableDistrict> districts = source.getDistricts().stream()
//					.map(item -> this.readableDistrictMapper.convert(item, store, language)).toList();
//			destination.setDistricts(districts);
//		}
//		if (!Objects.isNull(source.getPayCycle())) {
//			destination.setPaycycle(this.readablePaycircleMapper.convert(source.getPayCycle(), store, language));
//		}
//		if (!Objects.isNull(source.getExperience())) {
//			destination.setExperience(this.readableExperienceMapper.convert(source.getExperience(), store, language));
//		}
//		return destination;
//	}
//
//}
