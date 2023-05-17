package com.salesmanager.core.business.repositories.catalog.product.location;

import java.util.List;

import com.salesmanager.core.model.location.LocationDescription;
import com.salesmanager.core.model.skill.SkillDescription;

public interface ProductLocationReposistory {
	public LocationDescription getLocationDescriptionByCode(String codeLocaltion);

	public List<LocationDescription> getLocations();
}
