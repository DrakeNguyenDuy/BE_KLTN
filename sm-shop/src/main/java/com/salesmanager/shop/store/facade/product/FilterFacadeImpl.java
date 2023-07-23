package com.salesmanager.shop.store.facade.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.utils.FilterService;
import com.salesmanager.core.model.system.Filter;
import com.salesmanager.shop.util.FilterDto;

@Component
public class FilterFacadeImpl implements FilterFacade {
	@Autowired
	private FilterService filterService;

	@Override
	public List<FilterDto> findAll() {
		List<Filter> filters = filterService.findAll();
		List<FilterDto> filterDtos = new ArrayList<FilterDto>();
		for (Filter filter : filters) {
			FilterDto dto = new FilterDto();
			dto.setCode(filter.getCode());
			dto.setDes(filter.getDescription());
			filterDtos.add(dto);
		}
		return filterDtos;
	}

}
