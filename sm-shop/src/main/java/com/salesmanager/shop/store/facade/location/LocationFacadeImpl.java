package com.salesmanager.shop.store.facade.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.location.DistrictService;
import com.salesmanager.core.business.services.catalog.product.location.ProvinceService;
import com.salesmanager.core.business.services.catalog.product.location.WardService;
import com.salesmanager.shop.mapper.location.ReadableDistrictMapper;
import com.salesmanager.shop.mapper.location.ReadableProvinceMapper;
import com.salesmanager.shop.mapper.location.ReadableWardMapper;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.location.ReadableDistrict;
import com.salesmanager.shop.model.location.ReadableProvince;
import com.salesmanager.shop.model.location.ReadableWard;

@Service
public class LocationFacadeImpl implements LocationFacade {

	@Autowired
	private ProvinceService provinceService;

	@Autowired
	private DistrictService districtService;

	@Autowired
	private WardService wardService;

	@Autowired
	private ReadableProvinceMapper provinceMapper;

	@Autowired
	private ReadableDistrictMapper districtMapper;

	@Autowired
	private ReadableWardMapper wardMapper;

	@Override
	public ReadableEntityListV2<ReadableProvince> getProvinces() {
		List<ReadableProvince> readableProvinces = provinceService.findAll().stream()
				.map(item -> provinceMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadableProvince> readableList = new ReadableEntityListV2<ReadableProvince>();
		readableList.setData(readableProvinces);
		return readableList;
	}

	@Override
	public ReadableEntityListV2<ReadableDistrict> getDistrict(Long idProvince) {
		List<ReadableDistrict> readableDistricts = districtService.findAll(idProvince).stream()
				.map(item -> districtMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadableDistrict> readableEntityList = new ReadableEntityListV2<ReadableDistrict>();
		readableEntityList.setData(readableDistricts);
		return readableEntityList;
	}

	@Override
	public ReadableEntityListV2<ReadableWard> getWard(Long idDistrict) {
		List<ReadableWard> readableWards = wardService.findAll(idDistrict).stream()
				.map(item -> wardMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadableWard> readableEntityList = new ReadableEntityListV2<ReadableWard>();
		readableEntityList.setData(readableWards);
		return readableEntityList;
	}

}
