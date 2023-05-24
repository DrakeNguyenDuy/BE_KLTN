package com.salesmanager.shop.mapper.catalog;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.reference.language.LanguageService;
import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.catalog.product.type.ProductTypeDescription;
import com.salesmanager.core.model.common.description.Description;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.model.catalog.product.type.PersistableProductType;
//import com.salesmanager.shop.model.catalog.product.type.ProductTypeDescription;
import com.salesmanager.shop.store.api.exception.ConversionRuntimeException;


@Component
public class PersistableProductTypeMapper implements Mapper<PersistableProductType, ProductType> {
	
	@Autowired
	private LanguageService languageService;

	@Override
	public ProductType convert(PersistableProductType source, MerchantStore store, Language language) {
		ProductType type = new ProductType();
		return this.merge(source, type, store, language);
	}

	@Override
	public ProductType merge(PersistableProductType source, ProductType destination, MerchantStore store,
							 Language language) {
		Validate.notNull(destination, "ReadableProductType cannot be null");
		try {
			return type(source, destination);
		} catch (ServiceException e) {
			throw new ConversionRuntimeException(e);
		}
	}

	public ProductType convert(PersistableProductType source) {
		ProductType type = new ProductType();
		return this.merge(source, type);
	}

	public ProductType merge(PersistableProductType source, ProductType destination) {
		Validate.notNull(destination, "ReadableProductType cannot be null");
		Validate.notNull(source.getName(), "Name cannot be null");
		Validate.notNull(source.getCode(), "Code cannot be null");
		if(source.getCode()!=null) {
			destination.setCode(source.getCode());
		}
		if(source.getName()!=null) {
			destination.setName(source.getName());
		}
		return destination;
	}
	
	
	
	private ProductType type (PersistableProductType type, ProductType destination) throws ServiceException {
		if(destination == null) {
			destination = new ProductType();
		}
		destination.setCode(type.getCode());
	//  Long hide some lines here(23/5/2023)
//		destination.setId(type.getId());
//		destination.setAllowAddToCart(type.isAllowAddToCart());
//		destination.setVisible(type.isVisible());
//		end
	//  Long add some lines here(23/5/2023)
		destination.setAllowAddToCart(true);
		destination.setVisible(true);
		
//		end
		//destination.set

//		List<com.salesmanager.core.model.catalog.product.type.ProductTypeDescription> descriptions = new ArrayList<com.salesmanager.core.model.catalog.product.type.ProductTypeDescription>();
//		if(!CollectionUtils.isEmpty(type.getDescriptions())) {
//			
//			for(ProductTypeDescription d : type.getDescriptions()) {
//				com.salesmanager.core.model.catalog.product.type.ProductTypeDescription desc = typeDescription(d, destination, d.getLanguage());
//				descriptions.add(desc);
//				
//				
//			}
//			
//			destination.setDescriptions(new HashSet<com.salesmanager.core.model.catalog.product.type.ProductTypeDescription>(descriptions));
//			
//		}	
		
		return destination;
	}
	
	private com.salesmanager.core.model.catalog.product.type.ProductTypeDescription typeDescription(ProductTypeDescription description, ProductType typeModel, String lang) throws ServiceException {
		
		com.salesmanager.core.model.catalog.product.type.ProductTypeDescription desc = null;
//		Long hide some lines here(24/5/2023)
//		if(!CollectionUtils.isEmpty(typeModel.getDescriptions()) ){
//			desc = this.findAppropriateDescription(typeModel, lang);
//		}
//		end
		
		if(desc == null) {
			desc = new com.salesmanager.core.model.catalog.product.type.ProductTypeDescription();
		}
		
		desc.setName(description.getName());
		desc.setDescription(description.getDescription());
//		desc.setLanguage(languageService.getByCode(description.getLanguage()));
		desc.setProductType(typeModel);
		return desc;
	}
	
	private com.salesmanager.core.model.catalog.product.type.ProductTypeDescription findAppropriateDescription(ProductType typeModel, String lang) {
//		Long hide some lines here(24/5/2023)
//		java.util.Optional<com.salesmanager.core.model.catalog.product.type.ProductTypeDescription> d = typeModel.getDescriptions().stream().filter(t -> t.getLanguage().getCode().equals(lang)).findFirst();
//		if(d.isPresent()) {
//			return d.get();
//		} else {
//			return null;
//		}
//		end
		return null;
	}

}
