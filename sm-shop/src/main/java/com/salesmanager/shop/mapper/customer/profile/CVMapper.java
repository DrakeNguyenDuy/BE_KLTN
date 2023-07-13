package com.salesmanager.shop.mapper.customer.profile;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.business.services.customer.profile.CVService;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.CustomerGender;
import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.CVSkill;
import com.salesmanager.core.model.customer.profile.Certificate;
import com.salesmanager.core.model.customer.profile.Education;
import com.salesmanager.core.model.customer.profile.ProfileSkillEntry;
import com.salesmanager.core.model.customer.profile.SocialContact;
import com.salesmanager.core.model.customer.profile.WorkExperience;
import com.salesmanager.shop.mapper.catalog.ReadableProductTypeMapper;
import com.salesmanager.shop.model.customer.profile.CVDto;
import com.salesmanager.shop.model.customer.profile.CertificateDto;
import com.salesmanager.shop.model.customer.profile.EducationDto;
import com.salesmanager.shop.model.customer.profile.ProfileSkillDto;
import com.salesmanager.shop.model.customer.profile.SocialContactDTO;
import com.salesmanager.shop.model.customer.profile.WorkExperienceDto;
import com.salesmanager.shop.model.englishLevel.ReadableEnglishLevel;
import com.salesmanager.shop.populator.customer.CustomerPopulator;
import com.salesmanager.shop.utils.ConverterDate;

import javassist.NotFoundException;

@Component
public class CVMapper {

	@Autowired
	private WorkExperienceMapper workExperienceMapper;
	
	@Autowired
	private ProfileSkillEntryMapper profileSkillEntryMapper;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private EducationMapper educationMapper;

	@Autowired
	private CertificateMapper certificateMapper;

	@Autowired
	private ReadableProductTypeMapper readableProductTypeMapper;

	@Autowired
	private CVService cvService;

	private static final Logger LOG = LoggerFactory.getLogger(CustomerPopulator.class);

	public CVDto convertToDto(CV cv) {
		CVDto cvDto = new CVDto();
		if (!Objects.isNull(cv.getId()) && StringUtils.hasText(cv.getId())) {
			cvDto.setId(cv.getId());
		}

		if (StringUtils.hasText(cv.getEmail())) {
			cvDto.setEmail(cv.getEmail());
		}
		if (StringUtils.hasText(cv.getAlumnus().getPhoneNumber())) {
			cvDto.setPhoneNumber(cv.getAlumnus().getPhoneNumber());
		}

		if (!CollectionUtils.isEmpty(cv.getSocialContacts())) {
			List<SocialContactDTO> contactDTOs = new ArrayList<SocialContactDTO>();
			for (SocialContact sc : cv.getSocialContacts()) {
				SocialContactDTO contactDTO = new SocialContactDTO();
				contactDTO.setLink(sc.getLINK());
				contactDTO.setName(sc.getNameSocial());
				contactDTOs.add(contactDTO);
			}
			cvDto.setContacts(contactDTOs);
		}
		
		if (!Objects.isNull(cv.getAlumnus().getProfile().getCareer())) {
			cvDto.setCarrer(readableProductTypeMapper.convert(cv.getAlumnus().getProfile().getCareer()));
		}

		if (!Objects.isNull(cv.getAlumnus().getProfile().getEnglishLevel())) {
			ReadableEnglishLevel englishLevel = new ReadableEnglishLevel();
			englishLevel.setId(cv.getAlumnus().getProfile().getEnglishLevel().getId());
			englishLevel.setCode(cv.getAlumnus().getProfile().getEnglishLevel().getCode());
			englishLevel.setName(cv.getAlumnus().getProfile().getEnglishLevel().getName());
			cvDto.setEnglishLevel(englishLevel);
		}

		if (!Objects.isNull(cv.getAlumnus().getFirstName()) && StringUtils.hasText(cv.getAlumnus().getFirstName())) {
			cvDto.setFirstName(cv.getAlumnus().getFirstName());
		}

		if (cv.getAlumnus().getProfile().getAvatar() != null) {
			String image = Base64.getEncoder().encodeToString(cv.getAlumnus().getProfile().getAvatar());
			cvDto.setAvatar(image);
		}

		if (!Objects.isNull(cv.getAlumnus().getLastName()) && StringUtils.hasText(cv.getAlumnus().getLastName())) {
			cvDto.setLastName(cv.getAlumnus().getLastName());
		}

		if (!Objects.isNull(cv.getAddress()) && StringUtils.hasText(cv.getAddress())) {
			cvDto.setAddress(cv.getAddress());
		}

		if (!Objects.isNull(cv.getAlumnus().getProfile().getGoal())
				&& StringUtils.hasText(cv.getAlumnus().getProfile().getGoal())) {
			cvDto.setGoal(cv.getAlumnus().getProfile().getGoal());
		}

		if (!Objects.isNull(cv.getAlumnus().getProfile().getIntroduce())
				&& StringUtils.hasText(cv.getAlumnus().getProfile().getIntroduce())) {
			cvDto.setIntroduce(cv.getAlumnus().getProfile().getIntroduce());
		}

		if (!Objects.isNull(cv.getAlumnus().getGender())) {
			cvDto.setGender(cv.getAlumnus().getGender().toString());
		}

		if (!Objects.isNull(cv.getAlumnus().getDateOfBirth())) {
			cvDto.setDob(ConverterDate.convertDateToString(cv.getAlumnus().getDateOfBirth().toString()));
		}

		if (!Objects.isNull(cv.getTitle())) {
			cvDto.setTitle(cv.getTitle());
		}

		if (!CollectionUtils.isEmpty(cv.getWorkExperiences())) {
			List<WorkExperienceDto> workExperienceDtos = cv.getWorkExperiences().stream()
					.map(item -> this.workExperienceMapper.convertToDto(item)).toList();
			cvDto.setWorkExperiences(workExperienceDtos);
		}

		if (!CollectionUtils.isEmpty(cv.getCertificate())) {
			List<CertificateDto> certificateDtos = cv.getCertificate().stream()
					.map(item -> this.certificateMapper.convertToDto(item)).toList();
			cvDto.setCertificates(certificateDtos);
		}

		if (!CollectionUtils.isEmpty(cv.getEducations())) {
			List<EducationDto> educationDtos = cv.getEducations().stream()
					.map(item -> this.educationMapper.convertToDto(item)).toList();
			cvDto.setEducations(educationDtos);
		}
		
		if(!CollectionUtils.isEmpty(cv.getCvSkills())) {
//			List<ProfileSkillDto> skills = cv.getAlumnus().getProfile().getSkills().stream().map(item -> profileSkillEntryMapper.convertToDto(item)).toList();
			List<ProfileSkillDto> skills = cv.getCvSkills().stream().map(item -> profileSkillEntryMapper.convertToDto(item)).toList();
			cvDto.setSkills(skills);
		}
		return cvDto;
	}

	public CV convertToEntity(String nickName, CVDto source) {
		CV destination;

		if (!Objects.isNull(source.getId()) && StringUtils.hasText(source.getId())) {
			destination = cvService.findById(source.getId());
		} else {
			destination = new CV();
		}

		Customer alumnus = customerService.getByNick(nickName);
		destination.setAlumnus(alumnus);

		if (!Objects.isNull(source.getFirstName()) && StringUtils.hasText(source.getFirstName())) {
			destination.getAlumnus().setFirstName(source.getFirstName());
		}

		if (!Objects.isNull(source.getLastName()) && StringUtils.hasText(source.getLastName())) {
			destination.getAlumnus().setLastName(source.getLastName());
		}
		
		if(!Objects.isNull(source.getEmail())) {
			destination.setEmail(source.getEmail());
		}

		if (!Objects.isNull(source.getAddress()) && StringUtils.hasText(source.getAddress())) {
			destination.setAddress(source.getAddress());
		}

		if (!Objects.isNull(source.getGoal()) && StringUtils.hasText(source.getGoal())) {
			destination.getAlumnus().getProfile().setGoal(source.getGoal());
		}

		if (!Objects.isNull(source.getIntroduce()) && StringUtils.hasText(source.getIntroduce())) {
			destination.getAlumnus().getProfile().setIntroduce(source.getIntroduce());
		}

		if (!Objects.isNull(source.getGender())) {
			CustomerGender gender = source.getGender().equals(CustomerGender.M.toString()) ? CustomerGender.M
					: CustomerGender.F;
			destination.getAlumnus().setGender(gender);
		}

		if (!Objects.isNull(source.getDob())) {
			destination.getAlumnus().setDateOfBirth(ConverterDate.convertToDate(source.getDob()));
		}

		if (!Objects.isNull(source.getTitle())) {
			destination.setTitle(source.getTitle());
		}

		if (!CollectionUtils.isEmpty(source.getWorkExperiences())) {
			List<WorkExperience> workExperiences = source.getWorkExperiences().stream()
					.map(item -> this.workExperienceMapper.convertToEntity(destination, item)).toList();
			destination.setWorkExperiences(new ArrayList<WorkExperience>(workExperiences));
		}

		if (!CollectionUtils.isEmpty(source.getCertificates())) {
			List<Certificate> certificateDtos = source.getCertificates().stream()
					.map(item -> this.certificateMapper.convertToEntity(destination, item)).toList();
			destination.setCertificate(new ArrayList<Certificate>(certificateDtos));
		}

		if (!CollectionUtils.isEmpty(source.getContacts())) {
			List<SocialContact> contacts = new ArrayList<SocialContact>();
			for (SocialContactDTO sc : source.getContacts()) {
				SocialContact contact = new SocialContact();
				contact.setNameSocial(sc.getName());
				contact.setLINK(sc.getLink());
				contact.setCv(destination);
				contacts.add(contact);
			}
			destination.setSocialContacts(contacts);
		}

		if (!CollectionUtils.isEmpty(source.getEducations())) {
			List<Education> educationDtos = source.getEducations().stream()
					.map(item -> this.educationMapper.convertToEntity(destination, item)).toList();
			destination.setEducations(new ArrayList<Education>(educationDtos));
		}
		
		if (!CollectionUtils.isEmpty(source.getSkills())) {
			List<CVSkill> cvSkills = new ArrayList<CVSkill>();
			for (ProfileSkillDto profileSkillDto : source.getSkills()) {
				CVSkill cvSkill = new CVSkill();
				cvSkill.setDescription(profileSkillDto.getDes());
				cvSkill.setSkill(profileSkillDto.getNameSkill());
				cvSkill.setProfile(alumnus.getProfile());
				cvSkill.setRate(profileSkillDto.getRate());
				cvSkill.setCv(destination);
				cvSkills.add(cvSkill );
			}
			destination.setCvSkills(cvSkills);
		}
		return destination;
	}
}
