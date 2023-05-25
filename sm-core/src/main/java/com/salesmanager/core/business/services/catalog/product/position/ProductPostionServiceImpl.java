package com.salesmanager.core.business.services.catalog.product.position;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.position.ProductPositionReposistory;
import com.salesmanager.core.model.catalog.product.position.PositionDescription;

@Service
public class ProductPostionServiceImpl implements ProductPositionService {

	@Autowired
	private ProductPositionReposistory positionReposistory;

	@Override
	public List<PositionDescription> getAll() {
		return positionReposistory.findAll();
	}

	@Override
	public PositionDescription getPositionBycode(String code) {
		return positionReposistory.findBycode(code);
	}

	@Override
	public PositionDescription saveOrUpdate(PositionDescription positionDescription) {
		return positionReposistory.saveAndFlush(positionDescription);
	}

	@Override
	public void delete(Long id) {
		positionReposistory.deleteById(id);
	}

}
