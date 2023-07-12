package com.salesmanager.shop.store.facade.customer.profile;

import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.repositories.customer.profile.CertificateRepository;
import com.salesmanager.core.business.repositories.customer.profile.CvSkillRepository;
import com.salesmanager.core.business.repositories.customer.profile.EducationRepository;
import com.salesmanager.core.business.repositories.customer.profile.SocialContactRepository;
import com.salesmanager.core.business.repositories.customer.profile.WorkExperienceRepository;
import com.salesmanager.core.business.services.customer.profile.CVService;
import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.shop.mapper.customer.profile.CVMapper;
import com.salesmanager.shop.model.customer.profile.CVDto;

@Component
public class CVFacadeImpl implements CVFacade {

	@Autowired
	private CVService cvService;

	@Autowired
	private CVMapper cvMapper;

	@Autowired
	private SocialContactRepository contactRepository;

	@Autowired
	private WorkExperienceRepository experienceRepository;

	@Autowired
	private EducationRepository educationRepository;

	@Autowired
	private CertificateRepository certificateRepository;

	@Autowired
	private CvSkillRepository cvSkillRepository;

	@Override
	public CVDto findCVByAlumnusName(String nickName) {
		CV cv = cvService.findByCustomerNickName(nickName);
		if (cv == null)
			return null;
		return cvMapper.convertToDto(cv);
	}

	@Override
	@Transactional
	public CVDto saveOrUpdate(String nickName, CVDto cvDto) {
		CV cv = cvMapper.convertToEntity(nickName, cvDto);
		if (cv.getId() != null) {
			contactRepository.deleteByCv(cv);
			experienceRepository.deleteByCv(cv);
			educationRepository.deleteByCv(cv);
			certificateRepository.deleteByCv(cv);
			cvSkillRepository.deleteByCv(cv);
		}
		cv = cvService.saveOrUpdate(nickName, cvMapper.convertToEntity(nickName, cvDto));
		return cvMapper.convertToDto(cv);
	}

//	@Transactional
	private boolean deleteRelateDataOldCV(CV cv) {
		try {
			contactRepository.deleteByCv(cv);
			experienceRepository.deleteByCv(cv);
			educationRepository.deleteByCv(cv);
			certificateRepository.deleteByCv(cv);
			cvSkillRepository.deleteByCv(cv);
			return true;
		} catch (Exception e) {
			// Xử lý ngoại lệ nếu cần
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public void delete(String id) {
		cvService.delete(id);
	}

	@Override
	public CVDto findById(String id) {
		CV cv = cvService.findById(id);
		if (cv != null) {
			cvMapper.convertToDto(cv);
		}
		return null;
	}

}
