package com.salesmanager.shop.mapper.customer.profile;

import java.util.Objects;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.customer.profile.Certificate;
import com.salesmanager.shop.model.customer.profile.CertificateDto;

@Component
public class CertificateMapper {

	public CertificateDto convertToDto(Certificate certificate) {
		CertificateDto certificateDto = new CertificateDto();

		certificateDto.setId(certificate.getId());
		if (!Objects.isNull(certificate.getTitle()) && StringUtils.hasText(certificate.getTitle())) {
			certificateDto.setName(certificate.getTitle());
		}
		if (!Objects.isNull(certificate.getLinkReference()) && StringUtils.hasText(certificate.getLinkReference())) {
			certificateDto.setLinkReference(certificate.getLinkReference());
		}
		return certificateDto;
	}

	public Certificate convertToEntity(CV cv, CertificateDto source) {
		Certificate destination = new Certificate();
		if ((!Objects.isNull(source.getId()) && StringUtils.hasText(source.getId()))) {
			destination.setId(source.getId());
		}
		if ((!Objects.isNull(source.getLinkReference()) && StringUtils.hasText(source.getLinkReference()))) {
			destination.setLinkReference(source.getLinkReference());
		}
		if ((!Objects.isNull(source.getName()) && StringUtils.hasText(source.getName()))) {
			destination.setTitle(source.getName());
		}
		destination.setCv(cv);
		return destination;
	}
}
