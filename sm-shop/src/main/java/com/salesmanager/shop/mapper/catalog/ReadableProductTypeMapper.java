package com.salesmanager.shop.mapper.catalog;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.catalog.product.type.ProductTypeDescription;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductTypeFull;

@Component
public class ReadableProductTypeMapper implements Mapper<ProductType, ReadableProductType> {

	@Override
	public ReadableProductType convert(ProductType source, MerchantStore store, Language language) {
		ReadableProductType type = new ReadableProductType();
		return this.merge(source, type, store, language);
	}

	@Override
	public ReadableProductType merge(ProductType source, ReadableProductType destination, MerchantStore store,
									 Language language) {
		Validate.notNull(source, "ProductType cannot be null");
		Validate.notNull(destination, "ReadableProductType cannot be null");
		return type(source, language);
	}
	
//	Long add some lines here
	public ReadableProductType convert(ProductType source) {
		ReadableProductType type = new ReadableProductType();
		return this.merge(source, type);
	}

	public ReadableProductType merge(ProductType source, ReadableProductType destination) {
		Validate.notNull(source, "ProductType cannot be null");
		Validate.notNull(destination, "ReadableProductType cannot be null");
		destination.setName(source.getName());
		destination.setCode(source.getCode());
		return destination;
	}
//	end
	
	private ReadableProductType type (ProductType type, Language language) {
		ReadableProductType readableType = null;


		if(language != null) {
			readableType = new ReadableProductType();
//			Long hide some lines here(24/5/2023)
//			if(!CollectionUtils.isEmpty(type.getDescriptions())) {
//				Optional<ProductTypeDescription> desc = type.getDescriptions().stream().filter(t -> t.getLanguage().getCode().equals(language.getCode()))
//				.map(d -> typeDescription(d)).findFirst();
//				if(desc.isPresent()) {
//					readableType.setDescription(desc.get());
//				}
//			}
//			end
		} else {
//			Long hide some lines here(24/5/2023)
//			readableType = new ReadableProductTypeFull();
//			List<ProductTypeDescription> descriptions = type.getDescriptions().stream().map(t -> this.typeDescription(t)).collect(Collectors.toList());
//			((ReadableProductTypeFull)readableType).setDescriptions(descriptions);
//			end
		}
		
		readableType.setCode(type.getCode());
		readableType.setId(type.getId());
		readableType.setVisible(type.getVisible() != null && type.getVisible().booleanValue() ? true:false);
		readableType.setAllowAddToCart(type.getAllowAddToCart() != null && type.getAllowAddToCart().booleanValue() ? true:false);
		
		return readableType;
	}
	
	private ProductTypeDescription typeDescription(com.salesmanager.core.model.catalog.product.type.ProductTypeDescription description) {
		ProductTypeDescription desc = new ProductTypeDescription();
		desc.setId(description.getId());
		desc.setName(description.getName());
		desc.setDescription(description.getDescription());
		desc.setLanguage(description.getLanguage().getCode());
		return desc;
	}

}
