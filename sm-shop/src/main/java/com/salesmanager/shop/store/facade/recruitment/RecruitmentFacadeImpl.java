package com.salesmanager.shop.store.facade.recruitment;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.services.recruitment.RecruitmentService;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.core.model.recruitment.StatusProcess;
import com.salesmanager.shop.mapper.recruitment.RecruitmentMapper;
import com.salesmanager.shop.model.recruitment.RecruitmentDto;
import com.salesmanager.shop.model.recruitment.RecruitmentStatusDto;
import com.salesmanager.shop.model.recruitment.StatusProcessDto;
import com.salesmanager.shop.utils.ConverterDate;
import com.salesmanager.shop.utils.EmailTemplatesUtils;

@Service
public class RecruitmentFacadeImpl implements RecruitmentFacade {
	@Autowired
	private RecruitmentMapper recruitmentMapper;

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private EmailTemplatesUtils emailTemplatesUtils;

	@Override
	public String apply(String customerName, String codeJob) {
		Recruitment recruitment = recruitmentMapper.convertToEntity(customerName, codeJob);
		String message = recruitmentService.appy(recruitment);
//		if (message.equals(Constants.APPLY_SUCCESS)) {
//			String toEmail = recruitment.getAlumnus().getEmailAddress();
//			String name = recruitment.getAlumnus().getFirstName() + " " + recruitment.getAlumnus().getLastName();
//			String jobTitle = recruitment.getJob().getProductDescription().getName();
//			String nameCompany = recruitment.getJob().getMerchantStore().getStorename();
//			String status = recruitment.getStatusProcess().toString();
//			String dateApply = ConverterDate.convertDateToString(recruitment.getApplyDate().toString());
//			emailTemplatesUtils.sendJobApplicationNotification(toEmail, name, jobTitle, nameCompany, dateApply, status);
//		}
		return message;
	}

	@Override
	public List<RecruitmentDto> findApplyByJob(String codeJob) {
		return recruitmentMapper.convertToDtos(recruitmentService.findApplyByJob(codeJob));
	}

	@Override
	public List<RecruitmentDto> findRecruitmentByAlumnus(String nickname) {
		return recruitmentMapper.convertToDtos(recruitmentService.findRecruitmentByAlumnus(nickname));
	}

	@Override
	public String changeStatus(RecruitmentStatusDto recruitmentStatusDto) {
		Optional<Recruitment> reOptional = recruitmentService.findById(recruitmentStatusDto.getId());
		if (reOptional.isPresent()) {
			Recruitment r = reOptional.get();
			r.setStatusProcess(StatusProcess.valueOf(recruitmentStatusDto.getStatus()));
			recruitmentService.update(r);
			return Constants.CHANGE_STATUS_SUCCESS;
		}
		return Constants.CHANGE_STATUS_FAIL;
	}

	@Override
	public List<StatusProcessDto> getListStatusProcess() {
		StatusProcess[] processes = StatusProcess.values();
		List<StatusProcessDto> processDtos = new ArrayList<StatusProcessDto>();
		for (StatusProcess statusProcess : processes) {
			StatusProcessDto dto = new StatusProcessDto();
			dto.setCode(statusProcess.name());
			dto.setName(mappingToVi(statusProcess.toString()));
			processDtos.add(dto);
		}
		return processDtos;
	}

	@SuppressWarnings("unlikely-arg-type")
	public String mappingToVi(String name) {
		if (name.equals(StatusProcess.APPLIED.toString())) {
			return "Đã ứng tuyển";
		} else if (name.equals(StatusProcess.CHECKING.toString())) {
			return "Đang kiểm tra CV";
		} else if (name.equals(StatusProcess.DEAL.toString())) {
			return "Thương lượng lương";
		} else if (name.equals(StatusProcess.FAIL.toString())) {
			return "Ứng tuyển không thành công";
		} else if (name.equals(StatusProcess.INTERVIEW.toString())) {
			return "Phỏng vấn";
		} else
			return "Trúng tuyển";
	}

}
