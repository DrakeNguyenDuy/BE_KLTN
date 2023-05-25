package com.salesmanager.shop.store.facade.position;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.services.catalog.product.position.ProductPositionService;
import com.salesmanager.core.model.catalog.product.position.PositionDescription;
import com.salesmanager.shop.mapper.position.PersistablePositionMapper;
import com.salesmanager.shop.mapper.position.ReadablePositionMapper;
import com.salesmanager.shop.model.entity.ReadableEntityListV2;
import com.salesmanager.shop.model.position.PersistablePosition;
import com.salesmanager.shop.model.position.ReadablePosition;

@Service
public class PositionFacadeImpl implements PositionFacade {

	@Autowired
	private ProductPositionService positionService;

	@Autowired
	private ReadablePositionMapper positionMapper;

	@Autowired
	private PersistablePositionMapper persistablePositionMapper;

	@Override
	public ReadableEntityListV2<ReadablePosition> getAll() {
		List<ReadablePosition> postions = positionService.getAll().stream()
				.map(item -> positionMapper.convert(item, null, null)).toList();
		ReadableEntityListV2<ReadablePosition> readableEntityList = new ReadableEntityListV2<ReadablePosition>();
		readableEntityList.setData(postions);
		return readableEntityList;
	}

	@Override
	public ReadablePosition create(PersistablePosition persistableExperience) {
		PositionDescription positionDescription = persistablePositionMapper.convert(persistableExperience, null, null);
		positionDescription = positionService.saveOrUpdate(positionDescription);
		return positionMapper.convert(positionDescription, null, null);
	}

	@Override
	public ReadablePosition update(Long id, PersistablePosition persistableExperience) {
		PositionDescription positionDescription = persistablePositionMapper.convert(persistableExperience, null, null);
		positionDescription.setID_POSITION(id);
		positionDescription = positionService.saveOrUpdate(positionDescription);
		return positionMapper.convert(positionDescription, null, null);
	}

	@Override
	public void delete(Long id) {
		positionService.delete(id);
	}

}
