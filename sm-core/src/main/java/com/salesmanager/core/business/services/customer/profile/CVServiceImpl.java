package com.salesmanager.core.business.services.customer.profile;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.customer.profile.CVRepository;
import com.salesmanager.core.business.repositories.customer.profile.CertificateRepository;
import com.salesmanager.core.business.repositories.customer.profile.EducationRepository;
import com.salesmanager.core.business.repositories.customer.profile.WorkExperienceRepository;
import com.salesmanager.core.model.customer.profile.CV;

@Service
public class CVServiceImpl implements CVService {

	@Autowired
	private CVRepository cvRepository;

	@Autowired
	private EducationRepository educationRepository;

	@Autowired
	private CertificateRepository certificateRepository;

	@Autowired
	private WorkExperienceRepository workExperienceRepository;

	@Override
	@Transactional
	public CV saveOrUpdate(String nickName, CV cv) {
//		Optional<CV> c = Optional
//				.ofNullable(cvRepository.findByAlumnusNickName(nickName).orElse(cvRepository.save(cv)));
		return cvRepository.save(cv);
	}

	@Override
	public CV findById(String id) {
		Optional<CV> cvOpt = cvRepository.findById(id);
		return cvOpt.orElse(null);
	}

	@Override
	@Transactional
	public void delete(String id) {
		Optional<CV> cvOpt = cvRepository.findById(id);
		if (cvOpt.isPresent()) {
//			educationRepository.deleteAllById(cvOpt.get().getEducations().stream().map(item -> item.getId()).toList());
//			workExperienceRepository
//					.deleteAllById(cvOpt.get().getWorkExperiences().stream().map(item -> item.getId()).toList());
//			certificateRepository
//					.deleteAllById(cvOpt.get().getCertificate().stream().map(item -> item.getId()).toList());
		}
	}

	@Override
	public CV findByCustomerNickName(String nickName) {
		Optional<CV> cvOpt = cvRepository.findByAlumnusNickName(nickName);
		return cvOpt.orElse(null);
	}

}
