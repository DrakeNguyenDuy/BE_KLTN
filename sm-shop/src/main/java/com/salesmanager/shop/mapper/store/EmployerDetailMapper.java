package com.salesmanager.shop.mapper.store;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.merchant.MerchantStoreService;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.shop.mapper.catalog.product.ReadableProductMapper;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.store.EmployerDetailDto;

@Component
public class EmployerDetailMapper {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MerchantStoreService merchantStoreService;

	@Autowired
	private ReadableProductMapper jobMapper;

	public EmployerDetailDto convertToDTO(MerchantStore source) {
		EmployerDetailDto destination = new EmployerDetailDto();
		destination.setId(source.getId());
		destination.setCode(source.getCode());
		if (StringUtils.hasText(source.getStoreaddress())) {
			destination.setAddress(source.getStoreaddress());
		}
		if (source.getStoreLogo() != null) {
			destination.setLogo("/api/v1/store/" + source.getCode() + "/marketing/logo");
		}
		if (source.getBackGround() != null) {
			destination.setBackground("/api/v1/store/" + source.getCode() + "/background");
		}
		if (StringUtils.hasText(source.getStorephone())) {
			destination.setPhoneNumber(source.getStorephone());
		}
		if (StringUtils.hasText(source.getDescription())) {
			destination.setDescription(source.getDescription());
		}
		destination.setName(source.getStorename());
		destination.setNumOfEmployee(source.getNumOfEmployee());
		if (StringUtils.hasText(source.getSologan())) {
			destination.setSologan(source.getSologan());
		}
		List<Product> jobs = productService.listByStore(source);
		if (jobs.size() > 0) {
			List<ReadableProduct> readableProducts = jobs.stream().map(p -> jobMapper.convert(p))
					.sorted(Comparator.comparing(ReadableProduct::getSortOrder)).collect(Collectors.toList());
			destination.setJobs(readableProducts);
		}
		return destination;
	}

	public MerchantStore convertToEntity(String storeCode,EmployerDetailDto source) {
		MerchantStore destination;
		try {
			destination = merchantStoreService.getByCode(storeCode);
		} catch (ServiceException e) {
			e.printStackTrace();
			return null;
		}
		if (source.getId() != null) {
			destination.setId(source.getId());
		}
		if (StringUtils.hasText(source.getName())) {
			destination.setStorename(source.getName());
		}
		if (StringUtils.hasText(source.getAddress())) {
			destination.setStoreaddress(source.getAddress());
		}
		if (StringUtils.hasText(source.getPhoneNumber())) {
			destination.setStorephone(source.getPhoneNumber());
		}
		if (StringUtils.hasText(source.getDescription())) {
			destination.setDescription(source.getDescription());
		}
		if (source.getNumOfEmployee() != null) {
			destination.setNumOfEmployee(source.getNumOfEmployee());
		}
		if (StringUtils.hasText(source.getSologan())) {
			destination.setSologan(source.getSologan());
		}
		return destination;
	}
}
