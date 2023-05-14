package com.salesmanager.core.business.services.catalog.product.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.repositories.catalog.product.location.ProductLocationEntryReposistory;

@Service
public class ProductLocationEntryServiceImpl implements ProductLocationEntryService {

	@Autowired
	private ProductLocationEntryReposistory productLocationEntryReposistory;
	
	@Override
	public void delete(Long idProduct, Long idLocation) {
		productLocationEntryReposistory.delete(idProduct, idLocation);
	}

}
