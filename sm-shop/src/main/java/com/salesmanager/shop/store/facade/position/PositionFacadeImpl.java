package com.salesmanager.shop.store.facade.position;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.position.ProductPositionService;
import com.salesmanager.shop.mapper.position.ReadablePositionMapper;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.position.ReadablePostion;

@Service
public class PositionFacadeImpl implements PositionFacade {

	@Autowired
	private ProductPositionService positionService;

	@Autowired
	private ReadablePositionMapper positionMapper;

	@Override
	public ReadableEntityListV2<ReadablePostion> getAll() {
		List<ReadablePostion> postions = positionService.getAll().stream()
				.map(item -> positionMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadablePostion> readableEntityList = new ReadableEntityListV2<ReadablePostion>();
		readableEntityList.setData(postions);
		return readableEntityList;
	}

}
