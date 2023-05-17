//package com.salesmanager.shop.store.facade.location;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.salesmanager.core.business.services.catalog.product.location.ProductLocationService;
//import com.salesmanager.core.business.services.catalog.product.skill.ProductSkillService;
//import com.salesmanager.core.model.location.LocationDescription;
//import com.salesmanager.core.model.skill.SkillDescription;
//import com.salesmanager.shop.model.entity.ReadableEntityList;
//import com.salesmanager.shop.model.entity.ReadableEntityListV2;
//import com.salesmanager.shop.model.location.ReadableLocationDescription;
//import com.salesmanager.shop.model.skill.ReadableSkillDescription;
//
//@Service
//public class LocationFacadeImpl implements LocationFacade{
//
//	@Autowired
//	private ProductLocationService productLocationService;
//	
//	@Override
//	public ReadableEntityListV2<readableLocationDescriptions> getLocations() {
//		List<ReadableLocationDescription> readableLocationDescriptions = productLocationService.getLocations().stream().map(item->this.convertToReadleSkill(item) ).toList();
//		ReadableEntityListV2<ReadableLocationDescription> entityList = new ReadableEntityListV2<ReadableLocationDescription>();
//		entityList.setData(readableLocationDescriptions);
//		return entityList;
//	}
//	
//	private ReadableLocationDescription convertToReadleSkill(LocationDescription ld) {
//		ReadableSkillDescription readableSkillDescription = new ReadableSkillDescription();
//		readableSkillDescription.setCode(ld.getCode());
//		readableSkillDescription.setName(ld.get);
//		return readableSkillDescription;
//	}
//
//}
