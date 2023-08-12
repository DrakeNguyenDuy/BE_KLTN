package com.salesmanager.shop.mapper.system;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.salesmanager.core.model.system.SystemNotification;
import com.salesmanager.shop.util.NotificationDto;

@Component
public class SystemMapper {
	@SuppressWarnings("deprecation")
	public NotificationDto convertNotifiDto(SystemNotification notification) {
		NotificationDto dto = new NotificationDto();
		dto.setOpened(notification.isOpened());
		dto.setValue(notification.getValue());
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		String createdDate = dateFormat.format(notification.getStartDate());
		Date current = new Date();
		String now = dateFormat.format(current);
		if (createdDate.equals(now))
			if (current.getHours() > notification.getAuditSection().getDateCreated().getHours()) {
				dto.setTime(
						current.getHours() - notification.getAuditSection().getDateCreated().getHours() + " giờ trước");
			} else if (current.getMinutes() > notification.getAuditSection().getDateCreated().getMinutes()
					&& (current.getHours() > notification.getAuditSection().getDateCreated().getHours())) {
				dto.setTime(current.getHours() - notification.getAuditSection().getDateCreated().getHours()
						+ " phút trước");
			} else {
				dto.setTime("Vài phút trước");
			}
		else {
			dto.setTime(notification.getStartDate().toString());
		}
		return dto;
	}

	public List<NotificationDto> convertNotifiDtos(List<SystemNotification> notifications) {
		return notifications.stream().map(item -> convertNotifiDto(item)).collect(Collectors.toList());
	}
}
