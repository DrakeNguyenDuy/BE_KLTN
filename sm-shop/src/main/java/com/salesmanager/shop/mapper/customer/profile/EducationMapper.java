package com.salesmanager.shop.mapper.customer.profile;

import java.text.ParseException;
import java.util.Objects;

import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.Education;
import com.salesmanager.shop.model.customer.profile.EducationDto;
import com.salesmanager.shop.populator.customer.CustomerPopulator;
import com.salesmanager.shop.utils.ConverterDate;

@Component
public class EducationMapper {

	private static final Logger LOG = LoggerFactory.getLogger(CustomerPopulator.class);

	public EducationDto convertToDto(Education source) {
		EducationDto educationDto = new EducationDto();
		if (source.getEndDate() != null) {
			educationDto.setEndDate(ConverterDate.convertDateToString(source.getEndDate().toString()));
		}
		if (source.getStartDate() != null) {
			educationDto.setStartDate(ConverterDate.convertDateToString(source.getStartDate().toString()));
		}
		educationDto.setSchool(source.getSchool());
		educationDto.setMajor(source.getMajor());
		educationDto.setIsGraduated(source.isGraduated());
		educationDto.setId(source.getId());
		return educationDto;
	}

	public Education convertToEntity(CV cv, EducationDto source) {
		Education education = new Education();
		if (!Objects.isNull(source.getId()) && StringUtils.hasText(source.getId())) {
			education.setId(source.getId());
		}
		if (!Objects.isNull(source.getMajor()) && StringUtils.hasText(source.getMajor())) {
			education.setMajor(source.getMajor());
		}
		if (!Objects.isNull(source.getSchool()) && StringUtils.hasText(source.getSchool())) {
			education.setSchool(source.getSchool());
		}
		if (!Objects.isNull(source.getStartDate())) {
			education.setStartDate(ConverterDate.convertToDate(source.getStartDate()));
		}
		if(!Objects.isNull(source.getIsGraduated())) {
			education.setGraduated(source.getIsGraduated());
		}
		if (!Objects.isNull(source.getEndDate())) {
			education.setEndDate(ConverterDate.convertToDate(source.getEndDate()));
		}
		education.setCv(cv);
		return education;
	}
}
