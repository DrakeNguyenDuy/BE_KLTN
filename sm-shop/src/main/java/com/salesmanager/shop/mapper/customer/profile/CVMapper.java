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
import com.salesmanager.core.model.customer.profile.Certificate;
import com.salesmanager.core.model.customer.profile.Education;
import com.salesmanager.core.model.customer.profile.WorkExperience;
import com.salesmanager.shop.model.customer.profile.CVDto;
import com.salesmanager.shop.model.customer.profile.CertificateDto;
import com.salesmanager.shop.model.customer.profile.EducationDto;
import com.salesmanager.shop.model.customer.profile.WorkExperienceDto;
import com.salesmanager.shop.populator.customer.CustomerPopulator;
import com.salesmanager.shop.utils.ConverterDate;

@Component
public class CVMapper {

	@Autowired
	private WorkExperienceMapper workExperienceMapper;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private EducationMapper educationMapper;

	@Autowired
	private CertificateMapper certificateMapper;

	@Autowired
	private CVService cvService;

	private static final Logger LOG = LoggerFactory.getLogger(CustomerPopulator.class);

	public CVDto convertToDto(CV cv) {
		CVDto cvDto = new CVDto();
		if (!Objects.isNull(cv.getId()) && StringUtils.hasText(cv.getId())) {
			cvDto.setId(cv.getId());
		}
		
		if (!Objects.isNull(cv.getAlumnus().getFirstName()) && StringUtils.hasText(cv.getAlumnus().getFirstName())) {
			cvDto.setFirstName(cv.getAlumnus().getFirstName());
		}
		
		if(!Objects.isNull(cv.getAlumnus().getProfile().getAvatar().length>0)) {
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

		if (!CollectionUtils.isEmpty(source.getEducations())) {
			List<Education> educationDtos = source.getEducations().stream()
					.map(item -> this.educationMapper.convertToEntity(destination, item)).toList();
			destination.setEducations(new ArrayList<Education>(educationDtos));
		}
		return destination;
	}
}
