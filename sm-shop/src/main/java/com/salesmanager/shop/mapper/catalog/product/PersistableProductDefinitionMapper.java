package com.salesmanager.shop.mapper.catalog.product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.services.catalog.category.CategoryService;
import com.salesmanager.core.business.services.catalog.product.experience.ProductExperienceService;
import com.salesmanager.core.business.services.catalog.product.manufacturer.ManufacturerService;
import com.salesmanager.core.business.services.catalog.product.relationship.ProductRelationshipService;
import com.salesmanager.core.business.services.catalog.product.type.ProductTypeService;
import com.salesmanager.core.business.services.reference.language.LanguageService;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.availability.ProductAvailability;
import com.salesmanager.core.model.catalog.product.description.ProductDescription;
import com.salesmanager.core.model.catalog.product.price.ProductPrice;
import com.salesmanager.core.model.catalog.product.price.ProductPriceDescription;
import com.salesmanager.core.model.catalog.product.relationship.ProductRelationship;
import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.location.LocationDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.mapper.catalog.PersistableProductAttributeMapper;
import com.salesmanager.shop.model.catalog.product.ProductPriceEntity;
import com.salesmanager.shop.model.catalog.product.product.definition.PersistableProductDefinition;
import com.salesmanager.shop.model.location.PersistableLocationDescription;
import com.salesmanager.shop.model.skill.PersistableSkillDescription;
import com.salesmanager.shop.store.api.exception.ConversionRuntimeException;
import com.salesmanager.shop.utils.DateUtil;

@Component
public class PersistableProductDefinitionMapper implements Mapper<PersistableProductDefinition, Product> {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private LanguageService languageService;
	@Autowired
	private PersistableProductAttributeMapper persistableProductAttributeMapper;

	@Autowired
	private ProductTypeService productTypeService;

	@Autowired
	private ManufacturerService manufacturerService;

	// Long add some lines here(6/5/2023)
	@Autowired
	private ProductRelationshipService productRelationshipService;
	@Autowired
	private ProductExperienceService experienceService;
//	end

	@Override
	public Product convert(PersistableProductDefinition source, MerchantStore store, Language language) {
		Product product = new Product();
		return this.merge(source, product, store, language);
	}

	@Override
	public Product merge(PersistableProductDefinition source, Product destination, MerchantStore store,
			Language language) {

		Validate.notNull(destination, "Product must not be null");

		try {

			// core properties

			if (StringUtils.isBlank(source.getIdentifier())) {
				destination.setSku(source.getSku());
			} else {
				destination.setSku(source.getIdentifier());
			}

//			Long hide some lines here(5/5/2023)
//			destination.setAvailable(source.isVisible());
//			end

//			Long add some lines here(5/5/2023)
			destination.setAvailable(true);
//			end

			destination.setDateAvailable(new Date());

			destination.setRefSku(source.getIdentifier());

			if (source.getId() != null && source.getId().longValue() == 0) {
				destination.setId(null);
			} else {
				destination.setId(source.getId());
			}

			// MANUFACTURER

//			Long hide some lines here
//			if(!StringUtils.isBlank(source.getManufacturer())) {
//				Manufacturer manufacturer = manufacturerService.getByCode(store, source.getManufacturer());
//				if(manufacturer == null) {
//					throw new ConversionException("Manufacturer [" + source.getManufacturer() + "] does not exist");
//				}
//				destination.setManufacturer(manufacturer);
//			}
//			end

			// PRODUCT TYPE
			if (!StringUtils.isBlank(source.getType())) {
				ProductType type = productTypeService.getByCode(source.getType(), store, language);
				if (type == null) {
					throw new ConversionException("Product type [" + source.getType() + "] does not exist");
				}

				destination.setType(type);
			}

//			Long hide some lines here(5/5/2023)
//			if(!StringUtils.isBlank(source.getDateAvailable())) {
//				destination.setDateAvailable(DateUtil.getDate(source.getDateAvailable()));
//			}
//			end

			destination.setMerchantStore(store);

			List<Language> languages = new ArrayList<Language>();
			Set<ProductDescription> descriptions = new HashSet<ProductDescription>();
			if (!CollectionUtils.isEmpty(source.getDescriptions())) {
				for (com.salesmanager.shop.model.catalog.product.ProductDescription description : source
						.getDescriptions()) {

					ProductDescription productDescription = new ProductDescription();
					Language lang = languageService.getByCode(description.getLanguage());
					if (lang == null) {
						throw new ConversionException("Language code " + description.getLanguage()
								+ " is invalid, use ISO code (en, fr ...)");
					}
					if (!CollectionUtils.isEmpty(destination.getDescriptions())) {
						for (ProductDescription desc : destination.getDescriptions()) {
							if (desc.getLanguage().getCode().equals(description.getLanguage())) {
								productDescription = desc;
								break;
							}
						}
					}

					productDescription.setProduct(destination);
					productDescription.setDescription(description.getDescription());

					productDescription.setProductHighlight(description.getHighlights());

					productDescription.setName(description.getName());
					productDescription.setSeUrl(description.getFriendlyUrl());
					productDescription.setMetatagKeywords(description.getKeyWords());
					productDescription.setMetatagDescription(description.getMetaDescription());
					productDescription.setTitle(description.getTitle());

					languages.add(lang);
					productDescription.setLanguage(lang);
					descriptions.add(productDescription);
				}
			}

			if (descriptions.size() > 0) {
				destination.setDescriptions(descriptions);
			}

			/**
			 * Product definition
			 */
			ProductAvailability productAvailability = null;
			ProductPrice defaultPrice = null;
			if (!CollectionUtils.isEmpty(destination.getAvailabilities())) {
				for (ProductAvailability avail : destination.getAvailabilities()) {
					Set<ProductPrice> prices = avail.getPrices();
					for (ProductPrice p : prices) {
						if (p.isDefaultPrice()) {
							if (productAvailability == null) {
								productAvailability = avail;
								defaultPrice = p;
								productAvailability.setProductQuantity(source.getQuantity());

//			              Long hide some lines here(4/5/2023)
//			              productAvailability.setProductStatus(source.isCanBePurchased());
//			              end

								p.setProductPriceAmount(source.getPrice());
								break;
							}
						}
					}
				}
			}

			if (productAvailability == null) { // create with default values
				productAvailability = new ProductAvailability(destination, store);
				destination.getAvailabilities().add(productAvailability);

				productAvailability.setProductQuantity(source.getQuantity());
				productAvailability.setProductQuantityOrderMin(1);
				productAvailability.setProductQuantityOrderMax(1);
				productAvailability.setRegion(Constants.ALL_REGIONS);
				productAvailability.setAvailable(Boolean.valueOf(destination.isAvailable()));

//			  Long hide some lines here(3/5/2023)
//			  productAvailability.setProductStatus(source.isCanBePurchased());
//			  end
			}

			if (defaultPrice == null) {

				BigDecimal defaultPriceAmount = new BigDecimal(0);
				if (source.getPrice() != null) {
					defaultPriceAmount = source.getPrice();
				}

				defaultPrice = new ProductPrice();
				defaultPrice.setDefaultPrice(true);
				defaultPrice.setProductPriceAmount(defaultPriceAmount);
				defaultPrice.setCode(ProductPriceEntity.DEFAULT_PRICE_CODE);
				defaultPrice.setProductAvailability(productAvailability);
				productAvailability.getPrices().add(defaultPrice);
				for (Language lang : languages) {

					ProductPriceDescription ppd = new ProductPriceDescription();
					ppd.setProductPrice(defaultPrice);
					ppd.setLanguage(lang);
					ppd.setName(ProductPriceDescription.DEFAULT_PRICE_DESCRIPTION);
					defaultPrice.getDescriptions().add(ppd);
				}
			}

//			Long hide some lines here(4/5/2023)
//			if(source.getProductSpecifications()!=null) {
//				destination.setProductHeight(source.getProductSpecifications().getHeight());
//				destination.setProductLength(source.getProductSpecifications().getLength());
//				destination.setProductWeight(source.getProductSpecifications().getWeight());
//				destination.setProductWidth(source.getProductSpecifications().getWidth());
//    			
//    			
//    	         if(source.getProductSpecifications().getManufacturer()!=null) {
//                   
//                   Manufacturer manuf = null;
//                   if(!StringUtils.isBlank(source.getProductSpecifications().getManufacturer())) {
//                       manuf = manufacturerService.getByCode(store, source.getProductSpecifications().getManufacturer());
//                   } 
//                   
//                   if(manuf==null) {
//                       throw new ConversionException("Invalid manufacturer id");
//                   }
//                   if(manuf!=null) {
//                       if(manuf.getMerchantStore().getId().intValue()!=store.getId().intValue()) {
//                           throw new ConversionException("Invalid manufacturer id");
//                       }
//                       destination.setManufacturer(manuf);
//                   }
//               }
//    			
//			}
//			destination.setSortOrder(source.getSortOrder());
//			end

//			Long hide some lines here(3/5/2023)
//			destination.setProductVirtual(source.isVirtual());
//			destination.setProductShipeable(source.isShipeable());
//			end

			// attributes

//			Long hide some lines here(3/5/2023)
//			if(source.getProperties()!=null) {
//				for(com.salesmanager.shop.model.catalog.product.attribute.PersistableProductAttribute attr : source.getProperties()) {
//					ProductAttribute attribute = persistableProductAttributeMapper.convert(attr, store, language);
//					
//					attribute.setProduct(destination);
//					destination.getAttributes().add(attribute);
//
//				}
//			}
//			end

			// categories
			if (!CollectionUtils.isEmpty(source.getCategories())) {
				for (com.salesmanager.shop.model.catalog.category.Category categ : source.getCategories()) {

					Category c = null;
					if (!StringUtils.isBlank(categ.getCode())) {
						c = categoryService.getByCode(store, categ.getCode());
					} else {
						Validate.notNull(categ.getId(), "Category id nust not be null");
						c = categoryService.getById(categ.getId(), store.getId());
					}

					if (c == null) {
						if (!StringUtils.isBlank(categ.getCode())) {
							throw new ConversionException("Category code " + categ.getCode() + " does not exist");
						} else {
							throw new ConversionException("Category id " + categ.getId() + " does not exist");

						}
					}
					if (c.getMerchantStore().getId().intValue() != store.getId().intValue()) {
						throw new ConversionException("Invalid category id");
					}
					destination.getCategories().add(c);
				}
			}

//			Long add some lines here(5/5/2023)
			destination.setGender(source.getGender());
			destination.setDateExperience(DateUtil.getDate(source.getDateExperience()));

			// position (by product group)
			if (!CollectionUtils.isEmpty(source.getPositionCode())) {
				Set<ProductRelationship> positionOfJob = new HashSet<ProductRelationship>();
				List<ProductRelationship> positions = productRelationshipService.getGroups();
				for (String code : source.getPositionCode()) {
					for (ProductRelationship productRelationship : positions) {
						if (code.equals(productRelationship.getCode())) {
							positionOfJob.add(productRelationship);
							break;
						}
					}
				}
				if (positionOfJob.size() > 0) {
					destination.setRelationships(positionOfJob);
				}
			}
			// location
			if (!CollectionUtils.isEmpty(source.getLocationsDecription())) {
				List<LocationDescription> listLocation = source.getLocationsDecription().stream()
						.map(l -> convertToLocationDescription(l)).collect(Collectors.toList());
				Set<LocationDescription> locationDescriptions = new HashSet<LocationDescription>();
				locationDescriptions.addAll(listLocation);
				destination.setLocationDescriptions(locationDescriptions);
			}
			// skill
			if (!CollectionUtils.isEmpty(source.getSkillsDecription())) {
				List<SkillDescription> listskill = source.getSkillsDecription().stream()
						.map(l -> convertToSkillDescription(l)).collect(Collectors.toList());
				Set<SkillDescription> skilDescriptions = new HashSet<SkillDescription>();
				skilDescriptions.addAll(listskill);
				destination.setSkillDescriptions(skilDescriptions);
			}
			//experience
			if(!StringUtils.isBlank(source.getExperence())) {
				ExperienceDescription ed = experienceService.getExperienceByCode(source.getExperence());
				if(ed!=null) {
					destination.setExperience(ed);
				}
			}
			//end
			return destination;

		} catch (Exception e) {
			throw new ConversionRuntimeException("Error converting product mapper", e);
		}
	}

	private LocationDescription convertToLocationDescription(PersistableLocationDescription pld) {
		LocationDescription locationDescription = new LocationDescription();
		locationDescription.setCODE(pld.getCode());
		locationDescription.setDETAIL_ADDRESS(pld.getDetailAddress());
		locationDescription.setDISTRICT(pld.getDistrict());
		locationDescription.setPROVINCE(pld.getProvince());
		locationDescription.setWARD(pld.getWard());
		return locationDescription;
	}

	private SkillDescription convertToSkillDescription(PersistableSkillDescription psd) {
		SkillDescription skillDescription = new SkillDescription();
		skillDescription.setCODE(psd.getCode());
		skillDescription.setNAME(psd.getName());
		return skillDescription;
	}
}
