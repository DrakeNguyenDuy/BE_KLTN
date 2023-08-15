package com.salesmanager.shop.mapper.catalog.product;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.shop.model.catalog.product.jobRate.JobRateDto;

@Component
public class JobRateMapper {

	public List<JobRateDto> convertToDtos(List<JobRate> sources) {
		return sources.stream().map(item -> convertToDto(item)).collect(Collectors.toList());
	}

	public JobRateDto convertToDto(JobRate source) {
		JobRateDto jobRateDto = new JobRateDto();
		jobRateDto.setId(source.getId());
		jobRateDto.setIdJob(source.getJob().getId());
		jobRateDto.setCodeJob(source.getJob().getSku());
		if (source.getJob().getDescriptions().iterator().hasNext()) {
			jobRateDto.setNameJob(source.getJob().getDescriptions().iterator().next().getName());
		}
		if (!Objects.isNull(source.getJob().getMerchantStore().getStorename())) {
			jobRateDto.setNameCompany(source.getJob().getMerchantStore().getStorename());
		}
//		jobRateDto.setDateRating(ConverterDate.convertDateToString(source.getDateRating().toString()));
		Instant instantDateRating = Instant.ofEpochMilli(source.getDateRating());
		LocalDateTime localDateTime = instantDateRating.atZone(ZoneId.systemDefault()).toLocalDateTime();
		jobRateDto.setDateRating(localDateTime.toString());
		jobRateDto.setAlumnusId(source.getAlumnus().getId());
		jobRateDto.setNameAlumnus(source.getAlumnus().getLastName() + " " + source.getAlumnus().getFirstName());
		jobRateDto.setAlumnusUsername(source.getAlumnus().getNick());
		return jobRateDto;
	}
}
