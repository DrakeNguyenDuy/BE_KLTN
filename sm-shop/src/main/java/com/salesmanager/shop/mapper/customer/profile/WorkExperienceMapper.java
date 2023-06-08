package com.salesmanager.shop.mapper.customer.profile;

import java.text.ParseException;
import java.util.Objects;

import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.WorkExperience;
import com.salesmanager.shop.model.customer.profile.WorkExperienceDto;
import com.salesmanager.shop.populator.customer.CustomerPopulator;
import com.salesmanager.shop.utils.ConverterDate;

@Component
public class WorkExperienceMapper {

	private static final Logger LOG = LoggerFactory.getLogger(CustomerPopulator.class);

	public WorkExperienceDto convertToDto(WorkExperience workExperience) {
		WorkExperienceDto workExperienceDto = new WorkExperienceDto();
		workExperienceDto.setId(workExperience.getId());
		workExperienceDto.setTitlePosition(workExperience.getTitlePosition());
		workExperienceDto.setCompanyName(workExperience.getCompanyName());
		if (workExperience.getEndDate() != null) {
			workExperienceDto.setEndDate(ConverterDate.convertDateToString(workExperience.getEndDate().toString()));
		}
		if (workExperience.getStartDate() != null) {
			workExperienceDto.setStartDate(ConverterDate.convertDateToString(workExperience.getStartDate().toString()));
		}
		workExperienceDto.setDescription(workExperience.getDescription());
		return workExperienceDto;
	}

	public WorkExperience convertToEntity(CV cv, WorkExperienceDto source) {
		WorkExperience destination = new WorkExperience();

		if (!Objects.isNull(source.getId()) && StringUtils.hasText(source.getId())) {
			destination.setId(source.getId());
		}
		if (!Objects.isNull(source.getCompanyName()) && StringUtils.hasText(source.getCompanyName())) {
			destination.setCompanyName(source.getCompanyName());
		}
		if (!Objects.isNull(source.getTitlePosition()) && StringUtils.hasText(source.getTitlePosition())) {
			destination.setTitlePosition(source.getTitlePosition());
		}
		if (!Objects.isNull(source.getDescription())) {
			destination.setDescription(source.getDescription());
		}
		if (!Objects.isNull(source.getStartDate())) {
			destination.setStartDate(ConverterDate.convertToDate(source.getStartDate()));
		}
		if (!Objects.isNull(source.getEndDate())) {
			destination.setStartDate(ConverterDate.convertToDate(source.getEndDate()));
		}

		destination.setCv(cv);
		return destination;
	}
}
