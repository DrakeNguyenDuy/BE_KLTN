package com.salesmanager.shop.mapper.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.marketplace.SignupStore;
import com.salesmanager.shop.model.security.PersistableGroup;
import com.salesmanager.shop.model.user.PersistableUser;

@Component
public class UserMapper implements Mapper<SignupStore, PersistableUser>{

	@Override
	public PersistableUser convert(SignupStore source, MerchantStore store, Language language) {
		// TODO Auto-generated method stub
		PersistableUser persistableUser = new PersistableUser();
		persistableUser.setActive(true);
		persistableUser.setDefaultLanguage("vi");
		persistableUser.setEmailAddress(source.getEmail());
		persistableUser.setFirstName(source.getFirstName());
		persistableUser.setLastName(source.getLastName());
		persistableUser.setPassword(source.getPassword());
		persistableUser.setRepeatPassword(source.getRepeatPassword());
		persistableUser.setUserName(source.getEmail());
		List<PersistableGroup> groups = new ArrayList<PersistableGroup>();
		PersistableGroup persistableGroup = new PersistableGroup();
		if(source.isSuperAdmin()) {
			persistableGroup.setName("SUPERADMIN");
			persistableGroup.setType("ADMIN");
		}else {
			persistableGroup.setName("ADMIN");
			persistableGroup.setType("ADMIN");	
		}
		groups.add(persistableGroup);
		persistableUser.setGroups(groups);
		return persistableUser;
	}

	@Override
	public PersistableUser merge(SignupStore source, PersistableUser destination, MerchantStore store,
			Language language) {
		// TODO Auto-generated method stub
		return null;
	}

}
