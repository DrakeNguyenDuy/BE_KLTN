package com.salesmanager.shop.mapper.customer.profile;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.customer.CustomerRepository;
import com.salesmanager.core.business.repositories.customer.profile.ProfileRepository;
import com.salesmanager.core.business.services.catalog.category.CategoryService;
import com.salesmanager.core.business.services.catalog.product.englishLevel.EnglishLevelService;
import com.salesmanager.core.business.services.catalog.product.experience.ProductExperienceService;
import com.salesmanager.core.business.services.catalog.product.location.DistrictService;
import com.salesmanager.core.business.services.catalog.product.paycycle.PayCycleService;
import com.salesmanager.core.business.services.catalog.product.skill.ProductSkillService;
import com.salesmanager.core.business.services.catalog.product.type.ProductTypeService;
import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.paycycle.PayCycleDescription;
import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.CustomerGender;
import com.salesmanager.core.model.customer.profile.Profile;
import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;
import com.salesmanager.core.model.englishlevel.EnglishLevel;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.model.customer.profile.PersistableProfile;
import com.salesmanager.shop.model.customer.profile.ProfileSkillDto;

import javassist.NotFoundException;

@Component
public class PersistableProfileMapper {

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private EnglishLevelService englishLevelService;

	@Autowired
	private ProductTypeService productTypeService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private PayCycleService payCycleService;

	@Autowired
	private ProductExperienceService experienceService;

	@Autowired
	private ProductSkillService skillService;

	@Autowired
	private DistrictService districtService;

	@Autowired
	private ProfileRepository profileRepository;
	
	@Autowired
	private ProfileSkillEntryMapper profileSkillEntryMapper;

	public Profile convertToEntity(String customerName, PersistableProfile source) {
		Validate.notNull(source, "Persistable profile can not be null");
		Optional<Profile> profileOpt = profileRepository.findProfileByCustomerName(customerName);
		Profile profile;
		Optional<Customer> alumnusOpt = Optional.ofNullable(customerRepository.findByNick(customerName));

		if (!alumnusOpt.isPresent()) {
			throw new NullPointerException();
		}

		if (profileOpt.isPresent()) {
			profile = profileOpt.get();
		} else {
			profile = new Profile();
		}

		Customer alumnus = alumnusOpt.get();

		profile.setCustomer(alumnus);

		if (source.getFirstName() != null && StringUtils.hasText(source.getFirstName()) && source.getLastName() != null
				&& StringUtils.hasText(source.getLastName())) {
			alumnus.setFirstName(source.getFirstName());
			alumnus.setLastName(source.getLastName());
		}

		if (source.getIntroduce() != null && StringUtils.hasText(source.getIntroduce())) {
			profile.setIntroduce(source.getIntroduce());
		}

		if (source.getGoal() != null && StringUtils.hasText(source.getGoal())) {
			profile.setGoal(source.getGoal());
		}

		if (source.getGender() != null && StringUtils.hasText(source.getGender())) {
			CustomerGender gender = source.getGender().equals("M") ? CustomerGender.M : CustomerGender.F;
			alumnus.setGender(gender);
		}

		if (StringUtils.hasText(source.getEnglishLevel())) {
			EnglishLevel englishLevel = englishLevelService.findByCode(source.getEnglishLevel());
			profile.setEnglishLevel(englishLevel);
		}

		if (!Objects.isNull(source.getCarreer())) {
			ProductType productType = null;
			try {
				productType = productTypeService.getByCode(source.getCarreer());
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			profile.setCareer(productType);
		}

		if (!Objects.isNull(source.getFormWork())) {
			Category category = categoryService.findByCode(source.getFormWork());
			profile.setCategory(category);
		}

		if (!Objects.isNull(source.getPaycycle())) {
			PayCycleDescription payCycle = payCycleService.getPayCycleByCode(source.getPaycycle());
			profile.setPayCycle(payCycle);
		}

		if (!Objects.isNull(source.getExperience())) {
			ExperienceDescription experience = experienceService.getExperienceByCode(source.getExperience());
			profile.setExperience(experience);
		}

		if (!CollectionUtils.isEmpty(source.getDistricts())) {
			List<District> districts = districtService.findByIdIn(source.getDistricts());
			Set<District> setDistricts = new HashSet<District>();
			setDistricts.addAll(districts);
			profile.setDistricts(setDistricts);
		}
		
		if (!CollectionUtils.isEmpty(source.getSkills())) {
			List<ProfileSkillEntry> skills = new ArrayList<ProfileSkillEntry>();
			for (ProfileSkillDto dto : source.getSkills()) {
				try {
					skills.add(profileSkillEntryMapper.convertToEntity(profile,dto));
				} catch (NotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
//			List<ProfileSkillEntry> skills = source.getSkills().stream().map(item -> {
//				try {
//					return profileSkillEntryMapper.convertToEntity(profile,item);
//				} catch (NotFoundException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				return null;
//			}).toList();
//			List<SkillDescription> skillDescriptions = skillService.findByCodeIn(source.getSkills());
//			Set<SkillDescription> setSkills = new HashSet<SkillDescription>();
//			setSkills.addAll(skillDescriptions);
			profile.setSkills(skills);
		}

		return profile;
	}

}
