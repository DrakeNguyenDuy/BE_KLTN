package com.salesmanager.core.business.services.customer.profile;

import com.salesmanager.core.model.customer.profile.CV;

public interface CVService {
	CV findByCustomerNickName(String nickName);

	CV saveOrUpdate(String nickName, CV cv);

	CV findById(String id);

	void delete(String id);
}
