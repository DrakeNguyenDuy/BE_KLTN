package com.salesmanager.shop.mapper.catalog.product;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.services.catalog.pricing.PricingService;
import com.salesmanager.core.business.services.catalog.product.jobRate.JobRateService;
import com.salesmanager.core.business.services.catalog.product.paycycle.PayCycleService;
import com.salesmanager.core.business.services.catalog.product.price.ProductPriceService;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.JobStatus;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.attribute.ProductAttribute;
import com.salesmanager.core.model.catalog.product.attribute.ProductOption;
import com.salesmanager.core.model.catalog.product.attribute.ProductOptionDescription;
import com.salesmanager.core.model.catalog.product.attribute.ProductOptionValue;
import com.salesmanager.core.model.catalog.product.attribute.ProductOptionValueDescription;
import com.salesmanager.core.model.catalog.product.availability.ProductAvailability;
import com.salesmanager.core.model.catalog.product.description.ProductDescription;
import com.salesmanager.core.model.catalog.product.image.ProductImage;
import com.salesmanager.core.model.catalog.product.position.PositionDescription;
import com.salesmanager.core.model.catalog.product.price.FinalPrice;
import com.salesmanager.core.model.catalog.product.price.ProductPrice;
import com.salesmanager.core.model.catalog.product.price.ProductPriceDescription;
import com.salesmanager.core.model.catalog.product.variant.ProductVariant;
import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.location.LocationDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.skill.SkillDescription;
import com.salesmanager.shop.constants.Constants;
import com.salesmanager.shop.mapper.Mapper;
import com.salesmanager.shop.mapper.catalog.ReadableCategoryMapper;
import com.salesmanager.shop.mapper.catalog.ReadableManufacturerMapper;
import com.salesmanager.shop.mapper.catalog.ReadableProductTypeMapper;
import com.salesmanager.shop.mapper.experience.ReadableExperienceMapper;
import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.product.ReadableImage;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.catalog.product.ReadableProductDetail;
import com.salesmanager.shop.model.catalog.product.ReadableProductPrice;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductOption;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductProperty;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductPropertyValue;
import com.salesmanager.shop.model.catalog.product.attribute.api.ReadableProductOptionValue;
import com.salesmanager.shop.model.catalog.product.product.variant.ReadableProductVariant;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.location.ReadableLocationDescription;
import com.salesmanager.shop.model.position.ReadablePosition;
import com.salesmanager.shop.model.skill.ReadableSkillDescription;
import com.salesmanager.shop.model.store.ReadableMerchantStoreV2;
import com.salesmanager.shop.store.api.exception.ConversionRuntimeException;
import com.salesmanager.shop.utils.DateUtil;
import com.salesmanager.shop.utils.ImageFilePath;

/**
 * Works for product v2 model
 * 
 * @author carlsamson
 *
 */
@Component
public class ReadableProductMapper implements Mapper<Product, ReadableProduct> {

	// uses code that is similar to ProductDefinition
	@Autowired
	@Qualifier("img")
	private ImageFilePath imageUtils;

	@Autowired
	private ReadableCategoryMapper readableCategoryMapper;

	@Autowired
	private ReadableProductTypeMapper readableProductTypeMapper;

	@Autowired
	private ReadableProductVariantMapper readableProductVariantMapper;

	@Autowired
	private ReadableManufacturerMapper readableManufacturerMapper;

//	Long add some lines here(20/5/2023)
	@Autowired
	private ReadableExperienceMapper readableExperienceMapper;

	@Autowired
	private PayCycleService payCycleService;

	@Autowired
	private ProductPriceService priceService;
//	end

	@Autowired
	private PricingService pricingService;

	@Autowired
	private JobRateService jobRateService;

	@Override
	public ReadableProduct convert(Product source, MerchantStore store, Language language) {
		ReadableProduct product = new ReadableProduct();
		return this.merge(source, product, store, language);
	}

//	Long add some lines here(14/5/2023)
	public ReadableProduct convert(Product source) {
		ReadableProduct product = new ReadableProduct();
		return this.merge(source, product);
	}
//	end

//	Long add some lines here(20/5/2023)
	public ReadableProductDetail convertDetail(Product source) {
		ReadableProductDetail product = new ReadableProductDetail();
		return this.mergeDetail(source, product);
	}
//	end

	@Override
	public ReadableProduct merge(Product source, ReadableProduct destination, MerchantStore store, Language language) {

		Validate.notNull(source, "Product cannot be null");
		Validate.notNull(destination, "Product destination cannot be null");

		// read only product values
		// will contain options
		TreeMap<Long, ReadableProductOption> selectableOptions = new TreeMap<Long, ReadableProductOption>();

		destination.setSku(source.getSku());
		destination.setRefSku(source.getRefSku());
		destination.setId(source.getId());
		destination.setDateAvailable(DateUtil.formatDate(source.getDateAvailable()));
//		Long add some lines here(13/05/2023)
		destination.setDateExperience(DateUtil.formatDate(source.getDateExperience()));
		if (source.getMerchantStore() != null) {
			destination.setNameCompany(source.getMerchantStore().getStorename());
		}
//		end

//			Long hide some lines here(17/5/2023)
//		ProductDescription description = null;
//		if (source.getDescriptions() != null && source.getDescriptions().size() > 0) {
//			for (ProductDescription desc : source.getDescriptions()) {
//				if (language != null && desc.getLanguage() != null
//						&& desc.getLanguage().getId().intValue() == language.getId().intValue()) {
//					description = desc;
//					break;
//				}
//			}
//		}
//			end		

		destination.setId(source.getId());
		destination.setAvailable(source.isAvailable());

//		Long hide some line here(4/5/2023)
//		destination.setProductShipeable(source.isProductShipeable());
//		end

//		Long hide some lines here (21/4/2023)
//		destination.setPreOrder(source.isPreOrder());
//		end

		destination.setRefSku(source.getRefSku());

		destination.setSortOrder(source.getSortOrder());

		// Long hide some lines here (21/4/2023)
//		if (source.getType() != null) {
//			ReadableProductType readableType = readableProductTypeMapper.convert(source.getType(), store, language);
//			destination.setType(readableType);
//		}
		// end

		if (source.getDateAvailable() != null) {
			destination.setDateAvailable(DateUtil.formatDate(source.getDateAvailable()));
		}

//		Long hide some lines here(13/05/2023)
//		if (source.getAuditSection() != null) {
//			destination.setCreationDate(DateUtil.formatDate(source.getAuditSection().getDateCreated()));
//		}
//		end

//		Long hide some lines here(4/5/2023)
//		destination.setProductVirtual(source.getProductVirtual());
//		end

//		Long hide some lines here(13/5/2023)
//		if (source.getProductReviewCount() != null) {
//			destination.setRatingCount(source.getProductReviewCount().intValue());
//		}
//		end

//		Long hide some lines here(6/5/2023)
//		if (source.getManufacturer() != null) {
//			ReadableManufacturer manufacturer = readableManufacturerMapper.convert(source.getManufacturer(), store,
//					language);
//			destination.setManufacturer(manufacturer);
//		}
//		end

		// images
		Set<ProductImage> images = source.getImages();
		if (CollectionUtils.isNotEmpty(images)) {

			List<ReadableImage> imageList = images.stream().map(i -> this.convertImage(source, i, store))
					.collect(Collectors.toList());
			// Long hide some lines here
//			destination.setImages(imageList);
			// end
		}
		// Long add some lines here 21/4/2023
		Set<SkillDescription> skills = source.getSkillDescriptions();
		if (CollectionUtils.isNotEmpty(skills)) {
			List<ReadableSkillDescription> skillDescriptions = skills.stream().map(i -> this.convertSkill(i))
					.collect(Collectors.toList());
			destination.setSkillsDecription(skillDescriptions);
		}
		Set<LocationDescription> locations = source.getLocationDescriptions();
		if (CollectionUtils.isNotEmpty(locations)) {
			List<ReadableLocationDescription> locationDescriptions = locations.stream()
					.map(i -> this.convertLocation(i)).collect(Collectors.toList());
			destination.setLocationsDecription(locationDescriptions);
		}
		if (source.getDescriptions() != null) {
			destination.setName(source.getProductDescription().getName());
			destination.setTitle(source.getProductDescription().getTitle());
		}
		// end

//		Long hide some lines here(6/5/2023)
//		if (!CollectionUtils.isEmpty(source.getAttributes())) {
//
//			Set<ProductAttribute> attributes = source.getAttributes();
//
//			if (!CollectionUtils.isEmpty(attributes)) {
//
//				for (ProductAttribute attribute : attributes) {
//					ReadableProductOption opt = null;
//					ReadableProductAttribute attr = null;
//					ReadableProductProperty property = null;
//					ReadableProductPropertyValue propertyValue = null;
//					ReadableProductAttributeValue attrValue = new ReadableProductAttributeValue();
//
//					ProductOptionValue optionValue = attribute.getProductOptionValue();
//
//					// we need to set readonly attributes only
//					if (attribute.getAttributeDisplayOnly()) {// read only attribute = property
//
//						property = createProperty(attribute, language);
//
//						ReadableProductOption readableOption = new ReadableProductOption(); // that is the property
//						ReadableProductPropertyValue readableOptionValue = new ReadableProductPropertyValue();
//
//						readableOption.setCode(attribute.getProductOption().getCode());
//						readableOption.setId(attribute.getProductOption().getId());
//
//						Set<ProductOptionDescription> podescriptions = attribute.getProductOption().getDescriptions();
//						if (podescriptions != null && podescriptions.size() > 0) {
//							for (ProductOptionDescription optionDescription : podescriptions) {
//								if (optionDescription.getLanguage().getCode().equals(language.getCode())) {
//									readableOption.setName(optionDescription.getName());
//								}
//							}
//						}
//
//						property.setProperty(readableOption);
//
//						Set<ProductOptionValueDescription> povdescriptions = attribute.getProductOptionValue()
//								.getDescriptions();
//						readableOptionValue.setId(attribute.getProductOptionValue().getId());
//						readableOptionValue.setCode(optionValue.getCode());
//						if (povdescriptions != null && povdescriptions.size() > 0) {
//							for (ProductOptionValueDescription optionValueDescription : povdescriptions) {
//								if (optionValueDescription.getLanguage().getCode().equals(language.getCode())) {
//									readableOptionValue.setName(optionValueDescription.getName());
//								}
//							}
//						}
//
//						property.setPropertyValue(readableOptionValue);
//						// Long hide some lines here (21/4/2023)
////						destination.getProperties().add(property);
////						end
//
//					} else {// selectable option
//
//						/**
//						 * Returns a list of ReadableProductOptions
//						 * 
//						 * name lang type code List ReadableProductOptionValueEntity name description
//						 * image order default
//						 */
//
//						if (selectableOptions == null) {
//							selectableOptions = new TreeMap<Long, ReadableProductOption>();
//						}
//						opt = selectableOptions.get(attribute.getProductOption().getId());
//						if (opt == null) {
//							opt = createOption(attribute.getProductOption(), language);
//						}
//						if (opt != null) {
//							selectableOptions.put(attribute.getProductOption().getId(), opt);
//						}
//
//						ReadableProductOptionValue optValue = new ReadableProductOptionValue();
//
//						optValue.setDefaultValue(attribute.getAttributeDefault());
//						// optValue.setId(attribute.getProductOptionValue().getId());
//						optValue.setId(attribute.getId());
//						optValue.setCode(attribute.getProductOptionValue().getCode());
//
//						com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription valueDescription = new com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription();
//						valueDescription.setLanguage(language.getCode());
//						// optValue.setLang(language.getCode());
//						if (attribute.getProductAttributePrice() != null
//								&& attribute.getProductAttributePrice().doubleValue() > 0) {
//							String formatedPrice = null;
//							try {
//								formatedPrice = pricingService.getDisplayAmount(attribute.getProductAttributePrice(),
//										store);
//								optValue.setPrice(formatedPrice);
//							} catch (ServiceException e) {
//								throw new ConversionRuntimeException(
//										"Error converting product option, an exception occured with pricingService", e);
//							}
//						}
//
//						if (!StringUtils.isBlank(attribute.getProductOptionValue().getProductOptionValueImage())) {
//							optValue.setImage(imageUtils.buildProductPropertyImageUtils(store,
//									attribute.getProductOptionValue().getProductOptionValueImage()));
//						}
//						optValue.setSortOrder(0);
//						if (attribute.getProductOptionSortOrder() != null) {
//							optValue.setSortOrder(attribute.getProductOptionSortOrder().intValue());
//						}
//
//						List<ProductOptionValueDescription> podescriptions = optionValue.getDescriptionsSettoList();
//						ProductOptionValueDescription podescription = null;
//						if (podescriptions != null && podescriptions.size() > 0) {
//							podescription = podescriptions.get(0);
//							if (podescriptions.size() > 1) {
//								for (ProductOptionValueDescription optionValueDescription : podescriptions) {
//									if (optionValueDescription.getLanguage().getId().intValue() == language.getId()
//											.intValue()) {
//										podescription = optionValueDescription;
//										break;
//									}
//								}
//							}
//						}
//						valueDescription.setName(podescription.getName());
//						valueDescription.setDescription(podescription.getDescription());
//						optValue.setDescription(valueDescription);
//
//						if (opt != null) {
//							opt.getOptionValues().add(optValue);
//						}
//					}
//				}
//			}
//		}
//		end

		ReadableProductVariant defaultInstance = null;

		// variants
		// Long hide some lines here (21/04/2023)
//		if (!CollectionUtils.isEmpty(source.getVariants()))
//
//		{
//			List<ReadableProductVariant> instances = source
//					.getVariants().stream()
//					.map(i -> readableProductVariantMapper.convert(i, store, language)).collect(Collectors.toList());
//			destination.setVariants(instances);
//			
//			/**
//			 * When an item has instances
//			 * Take default instance
//			 * 
//			 * - Set item price as default instance price
//			 * - Set default image as default instance image
//			 */
//			
//			//get default instance
//			defaultInstance = instances.stream().filter(i -> i.isDefaultSelection()).findAny().orElse(null);
//			
//
//			/**
//			 * variants options list variation color
//			 */
//
//			/**
//			 * Returns a list of ReadableProductOptions
//			 * 
//			 * name lang type code List ReadableProductOptionValueEntity name description
//			 * image order default
//			 */
//
//			/**
//			 * Create options from instance Create a list of option values
//			 */
//
//			for (ProductVariant instance : source.getVariants()) {
//				instanceToOption(selectableOptions, instance, store, language);
//			}
//
//		}
//
//		if (selectableOptions != null) {
//			List<ReadableProductOption> options = new ArrayList<ReadableProductOption>(selectableOptions.values());
//			destination.setOptions(options);
//		}
		// end

		// availability
		ProductAvailability availability = null;
		for (ProductAvailability a : source.getAvailabilities()) {
			// TODO validate region
			// if(availability.getRegion().equals(Constants.ALL_REGIONS)) {//TODO REL 3.X
			// accept a region

			/**
			 * Default availability store product instance null region variant null
			 */

			availability = a;
			destination.setQuantity(availability.getProductQuantity() == null ? 1 : availability.getProductQuantity());

//			Long hide some lines here
//			destination.setQuantityOrderMaximum(
//					availability.getProductQuantityOrderMax() == null ? 1 : availability.getProductQuantityOrderMax());
//			destination.setQuantityOrderMinimum(
//					availability.getProductQuantityOrderMin() == null ? 1 : availability.getProductQuantityOrderMin());
//			end

//			Long hide some lines here(13/5/2023)
//			if (availability.getProductQuantity().intValue() > 0 && destination.isAvailable()) {
//				destination.setCanBePurchased(true);
//			}
//			end

//			Long hide some lines here(6/5/2023)
//			if (a.getProductVariant() == null && StringUtils.isEmpty(a.getRegionVariant())) {
//				break;
//			}
//			end
		}

		// if default instance

		destination.setSku(source.getSku());

		try {
			FinalPrice price = pricingService.calculateProductPrice(source);
			if (price != null) {

				destination.setFinalPrice(pricingService.getDisplayAmount(price.getFinalPrice(), store));
				destination.setPrice(price.getFinalPrice());
				destination.setOriginalPrice(pricingService.getDisplayAmount(price.getOriginalPrice(), store));

				// Long hide some lines here (21/04/2023)
//				if (price.isDiscounted()) {
//					destination.setDiscounted(true);
//				}
				// end

				// price appender
				if (availability != null) {
					Set<ProductPrice> prices = availability.getPrices();
					if (!CollectionUtils.isEmpty(prices)) {
						ReadableProductPrice readableProductPrice = new ReadableProductPrice();
						// Long hide some lines here (21/04/2023)
//						readableProductPrice.setDiscounted(destination.isDiscounted());
						// end
						readableProductPrice.setFinalPrice(destination.getFinalPrice());
						readableProductPrice.setOriginalPrice(destination.getOriginalPrice());

						Optional<ProductPrice> pr = prices.stream()
								.filter(p -> p.getCode().equals(ProductPrice.DEFAULT_PRICE_CODE)).findFirst();

//						Long hide some lines here(13/5/2023)
//						destination.setProductPrice(readableProductPrice);
//						end

						if (pr.isPresent() && language != null) {
							readableProductPrice.setId(pr.get().getId());
							Optional<ProductPriceDescription> d = pr.get().getDescriptions().stream()
									.filter(desc -> desc.getLanguage().getCode().equals(language.getCode()))
									.findFirst();
							if (d.isPresent()) {
								com.salesmanager.shop.model.catalog.product.ProductPriceDescription priceDescription = new com.salesmanager.shop.model.catalog.product.ProductPriceDescription();
								priceDescription.setLanguage(language.getCode());
								priceDescription.setId(d.get().getId());
								priceDescription.setPriceAppender(d.get().getPriceAppender());
								readableProductPrice.setDescription(priceDescription);
							}
						}

					}
				}

			}

		} catch (Exception e) {
			throw new ConversionRuntimeException("An error while converting product price", e);
		}

//		Long hide some lines here(13/5/2023)
//		if (source.getProductReviewAvg() != null) {
//			double avg = source.getProductReviewAvg().doubleValue();
//			double rating = Math.round(avg * 2) / 2.0f;
//			destination.setRating(rating);
//		}
//
//		if (source.getProductReviewCount() != null) {
//			destination.setRatingCount(source.getProductReviewCount().intValue());
//		}
//		end

//		Long hide some lines here
//		if (description != null) {
//			com.salesmanager.shop.model.catalog.product.ProductDescription tragetDescription = populateDescription(
//					description);
//			destination.setDescription(tragetDescription);
//
//		}
//
//		if (!CollectionUtils.isEmpty(source.getCategories())) {
//			List<ReadableCategory> categoryList = new ArrayList<ReadableCategory>();
//			for (Category category : source.getCategories()) {
//				ReadableCategory readableCategory = readableCategoryMapper.convert(category, store, language);
//				categoryList.add(readableCategory);
//
//			}
//			destination.setCategories(categoryList);
//		}
		// end

//		Long hide some lines here(13/5/2023)
//		ProductSpecification specifications = new ProductSpecification();
//		end

//		Long hide some lines here(4/5/2023)
//		specifications.setHeight(source.getProductHeight());
//		specifications.setLength(source.getProductLength());
//		specifications.setWeight(source.getProductWeight());
//		specifications.setWidth(source.getProductWidth());
//		end

//		Long hide some lines here(14/5/2023)
//		if (!StringUtils.isBlank(store.getSeizeunitcode())) {
//			specifications
//					.setDimensionUnitOfMeasure(DimensionUnitOfMeasure.valueOf(store.getSeizeunitcode().toLowerCase()));
//		}
//		if (!StringUtils.isBlank(store.getWeightunitcode())) {
//			specifications.setWeightUnitOfMeasure(WeightUnitOfMeasure.valueOf(store.getWeightunitcode().toLowerCase()));
//		}
//		
//		destination.setProductSpecifications(specifications);
//		end

		destination.setSortOrder(source.getSortOrder());

		return destination;
	}

//	Long add some lines here(14/5/2023)
	private final String DES_FOLDER = "D:\\store\\images";

	public ReadableProduct merge(Product source, ReadableProduct destination) {
		Validate.notNull(source, "Product cannot be null");
		Validate.notNull(destination, "Product destination cannot be null");

		// read only product values
		// will contain options
		TreeMap<Long, ReadableProductOption> selectableOptions = new TreeMap<Long, ReadableProductOption>();

		destination.setSku(source.getSku());
		destination.setRefSku(source.getRefSku());
		destination.setId(source.getId());
		destination.setDateAvailable(DateUtil.formatDate(source.getDateAvailable()));
		destination.setDateExperience(DateUtil.formatDate(source.getDateExperience()));
		destination.setLogo("/api/v1/store/" + source.getMerchantStore().getCode() + "/marketing/logo");
		if (source.getMerchantStore() != null) {
			destination.setNameCompany(source.getMerchantStore().getStorename());
		}

		// Long hide some lines here(17/6/2023)
//		ProductDescription description = null;
//		if (source.getDescriptions() != null && source.getDescriptions().size() > 0) {
//			for (ProductDescription desc : source.getDescriptions()) {
//				description = desc;
//				break;
//			}
//		}
//		end

		// Long add some lines here(17/6/2023)
		if (!org.springframework.util.CollectionUtils.isEmpty(source.getDescriptions())
				&& source.getDescriptions() != null) {
			destination.setName(source.getProductDescription().getName());
			destination.setTitle(source.getProductDescription().getTitle());
		}

		if (source.getIdPayCycle() != null && StringUtils.isNoneBlank(source.getIdPayCycle())) {
			String payCycle = payCycleService.getPayCycleByCode(source.getIdPayCycle()).getName();
			destination.setPayCycle(payCycle);
		}

		JobRate jobRate = jobRateService.findByJobAndAlumnus(source, null);
		// end

		destination.setId(source.getId());
		destination.setAvailable(source.isAvailable());
		destination.setRefSku(source.getRefSku());
		destination.setSortOrder(source.getSortOrder());

		if (source.getDateAvailable() != null) {
			destination.setDateAvailable(DateUtil.formatDate(source.getDateAvailable()));
		}
		
		JobStatus status = source.getStatus();
		if (status != null) {
			destination.setStatus(status == JobStatus.ACTIVE ? "Đang ứng tuyển"
					: status == JobStatus.INACTIVE ? "Tạm dừng ứng tuyển" : "Đã hết hạn");
		}

		// temp store
		MerchantStore store = new MerchantStore();
		store.setCode(source.getMerchantStore().getCode());

		// images
		Set<ProductImage> images = source.getImages();
		if (CollectionUtils.isNotEmpty(images)) {
			List<ReadableImage> imageList = images.stream().map(i -> this.convertImage(source, i, store))
					.collect(Collectors.toList());
		}

		Set<SkillDescription> skills = source.getSkillDescriptions();
		if (CollectionUtils.isNotEmpty(skills)) {
			List<ReadableSkillDescription> skillDescriptions = skills.stream().map(i -> this.convertSkill(i))
					.collect(Collectors.toList());
			destination.setSkillsDecription(skillDescriptions);
		}
		Set<LocationDescription> locations = source.getLocationDescriptions();
		if (CollectionUtils.isNotEmpty(locations)) {
			List<ReadableLocationDescription> locationDescriptions = locations.stream()
					.map(i -> this.convertLocation(i)).collect(Collectors.toList());
			destination.setLocationsDecription(locationDescriptions);
		}
		// end

		ReadableProductVariant defaultInstance = null;

		// availability
		ProductAvailability availability = null;
		for (ProductAvailability a : source.getAvailabilities()) {
			// TODO validate region
			// if(availability.getRegion().equals(Constants.ALL_REGIONS)) {//TODO REL 3.X
			// accept a region

			/**
			 * Default availability store product instance null region variant null
			 */

			availability = a;
			destination.setQuantity(availability.getProductQuantity() == null ? 1 : availability.getProductQuantity());
		}

		// if default instance

		destination.setSku(source.getSku());

		try {
			FinalPrice price = pricingService.calculateProductPrice(source);
			if (price != null) {

				destination.setFinalPrice(pricingService.getDisplayAmount(price.getFinalPrice(), store));
				destination.setPrice(price.getFinalPrice());
				destination.setOriginalPrice(pricingService.getDisplayAmount(price.getOriginalPrice(), store));

				// price appender
				if (availability != null) {
					Set<ProductPrice> prices = availability.getPrices();
					if (!CollectionUtils.isEmpty(prices)) {
						ReadableProductPrice readableProductPrice = new ReadableProductPrice();
						readableProductPrice.setFinalPrice(destination.getFinalPrice());
						readableProductPrice.setOriginalPrice(destination.getOriginalPrice());

						Optional<ProductPrice> pr = prices.stream()
								.filter(p -> p.getCode().equals(ProductPrice.DEFAULT_PRICE_CODE)).findFirst();

						if (pr.isPresent()) {
							readableProductPrice.setId(pr.get().getId());
							Optional<ProductPriceDescription> d = pr.get().getDescriptions().stream().findFirst();
							if (d.isPresent()) {
								com.salesmanager.shop.model.catalog.product.ProductPriceDescription priceDescription = new com.salesmanager.shop.model.catalog.product.ProductPriceDescription();
								priceDescription.setLanguage("black");
								priceDescription.setId(d.get().getId());
								priceDescription.setPriceAppender(d.get().getPriceAppender());
								readableProductPrice.setDescription(priceDescription);
							}
						}

					}
				}

			}

		} catch (Exception e) {
			throw new ConversionRuntimeException("An error while converting product price", e);
		}

		destination.setSortOrder(source.getSortOrder());

		return destination;
	}
//	end

//	Long add some lines here(20/5/2023)
	public ReadableProductDetail mergeDetail(Product source, ReadableProductDetail destination) {

		Validate.notNull(source, "Product cannot be null");
		Validate.notNull(destination, "Product destination cannot be null");
		destination.setSku(source.getSku());
		destination.setRefSku(source.getRefSku());
		destination.setId(source.getId());
		destination.setDateAvailable(DateUtil.formatDate(source.getDateAvailable()));
		destination.setDateExperience(DateUtil.formatDate(source.getDateExperience()));
		destination.setLogo("/api/v1/store/" + source.getMerchantStore().getCode() + "/marketing/logo");
		if (source.getMerchantStore() != null) {
			String storeName = source.getMerchantStore().getStorename();
			String phoneNumber = source.getMerchantStore().getStorephone();
			String logo = source.getMerchantStore().getCode();
			ReadableMerchantStoreV2 store = new ReadableMerchantStoreV2();
			store.setStoreName(storeName != null ? storeName : "blank");
			store.setPhoneNumber(phoneNumber != null ? phoneNumber : "blank");
			store.setLogo(logo != null ? logo : "blank");
			destination.setMerchantStore(store);
		}

		if (!org.springframework.util.CollectionUtils.isEmpty(source.getDescriptions())
				&& source.getDescriptions() != null) {
			destination.setName(source.getProductDescription().getName());
			destination.setTitle(source.getProductDescription().getTitle());
			destination.setDescription(source.getProductDescription().getDescription());
		}

		destination.setId(source.getId());
		destination.setAvailable(source.isAvailable());
		destination.setRefSku(source.getRefSku());
		destination.setSortOrder(source.getSortOrder());
		destination.setPrice(priceService.findByProductSku(source.getSku(), source.getMerchantStore()).get(0)
				.getProductPriceAmount());
		destination.setQuantity(source.getAvailabilities().iterator().next().getProductQuantity());
		if (source.getGender() != null) {
			String gender = source.getGender().equals(Constants.M) ? Constants.MALE
					: source.getGender().equals(Constants.FM) ? Constants.FEMALE : Constants.NO_REQUIRE;
			destination.setGender(gender);
			destination.setCodeGender(source.getGender());
		}

		if (source.getDateAvailable() != null) {
			destination.setDateAvailable(DateUtil.formatDate(source.getDateAvailable()));
		}

		if (source.getCategories() != null) {
			destination.setCategories(source.getCategories().stream()
					.map(item -> readableCategoryMapper.convert2Readable(item)).collect(Collectors.toList()));
		}

		// temp store
		MerchantStore store = new MerchantStore();
		store.setCode(source.getMerchantStore().getCode());

		// images
		Set<ProductImage> images = source.getImages();
		if (CollectionUtils.isNotEmpty(images)) {
			List<ReadableImage> imageList = images.stream().map(i -> this.convertImage(source, i, store))
					.collect(Collectors.toList());
		}

		Set<SkillDescription> skills = source.getSkillDescriptions();
		if (CollectionUtils.isNotEmpty(skills)) {
			List<ReadableSkillDescription> skillDescriptions = skills.stream().map(i -> this.convertSkill(i))
					.collect(Collectors.toList());
			destination.setSkills(skillDescriptions);
		}

		Set<LocationDescription> locations = source.getLocationDescriptions();
		if (CollectionUtils.isNotEmpty(locations)) {
			List<ReadableLocationDescription> locationDescriptions = locations.stream()
					.map(i -> this.convertLocation(i)).collect(Collectors.toList());
			destination.setLocations(locationDescriptions);
		}

		ExperienceDescription experiences = source.getExperience();
		destination.setExperience(readableExperienceMapper.convert(experiences, null, null));

		destination.setPaycycles(payCycleService.getPayCycleByCode(source.getIdPayCycle()).getName());
		destination.setCodePayCycle(source.getIdPayCycle());

		Set<PositionDescription> positions = source.getPositionDescriptions();
		if (CollectionUtils.isNotEmpty(positions)) {
			List<ReadablePosition> readablePostions = positions.stream().map(i -> this.convertPosition(i))
					.collect(Collectors.toList());
			destination.setPositions(readablePostions);
		}

		// availability
		ProductAvailability availability = null;
		for (ProductAvailability a : source.getAvailabilities()) {
			availability = a;
			destination.setQuantity(availability.getProductQuantity() == null ? 1 : availability.getProductQuantity());
		}

		// if default instance
		destination.setSku(source.getSku());
		destination.setSortOrder(source.getSortOrder());
		
		if (Objects.nonNull(source.getType())) {
			ReadableProductType readableProductType = new ReadableProductType();
			readableProductType.setCode(source.getType().getCode());
			readableProductType.setName(source.getType().getName());
			destination.setType(readableProductType);
		}
		
		if (Objects.nonNull(source.getCategories())) {
			ReadableCategory readableCategory = new ReadableCategory();
			Category c = source.getCategories().iterator().next();
			readableCategory.setCode(c.getCode());
			readableCategory.setName(c.getName());
			destination.setCategories(Arrays.asList(readableCategory));
		}
		
		JobStatus status = source.getStatus();
		if (status != null) {
			destination.setStatus(status == JobStatus.ACTIVE ? "Đang ứng tuyển"
					: status == JobStatus.INACTIVE ? "Tạm dừng ứng tuyển" : "Đã hết hạn");
			destination.setCodeStatus(status.name());
		}

		return destination;
	}
//	end

	private ReadableImage convertImage(Product product, ProductImage image, MerchantStore store) {
		ReadableImage prdImage = new ReadableImage();
		prdImage.setImageName(image.getProductImage());
		prdImage.setDefaultImage(image.isDefaultImage());

		// TODO product variant image
		StringBuilder imgPath = new StringBuilder();
		imgPath.append(imageUtils.getContextPath())
				.append(imageUtils.buildProductImageUtils(store, product.getSku(), image.getProductImage()));

		prdImage.setImageUrl(imgPath.toString());
		prdImage.setId(image.getId());
		prdImage.setImageType(image.getImageType());
		if (image.getProductImageUrl() != null) {
			prdImage.setExternalUrl(image.getProductImageUrl());
		}
		if (image.getImageType() == 1 && image.getProductImageUrl() != null) {// video
			prdImage.setVideoUrl(image.getProductImageUrl());
		}

		if (prdImage.isDefaultImage()) {
			prdImage.setDefaultImage(true);
		}

		return prdImage;
	}

	private com.salesmanager.shop.model.catalog.product.ProductDescription populateDescription(
			ProductDescription description) {
		if (description == null) {
			return null;
		}

		com.salesmanager.shop.model.catalog.product.ProductDescription tragetDescription = new com.salesmanager.shop.model.catalog.product.ProductDescription();
		tragetDescription.setFriendlyUrl(description.getSeUrl());
		tragetDescription.setName(description.getName());
		tragetDescription.setId(description.getId());
		if (!StringUtils.isBlank(description.getMetatagTitle())) {
			tragetDescription.setTitle(description.getMetatagTitle());
		} else {
			tragetDescription.setTitle(description.getName());
		}
		tragetDescription.setMetaDescription(description.getMetatagDescription());
		tragetDescription.setDescription(description.getDescription());
		tragetDescription.setHighlights(description.getProductHighlight());
		tragetDescription.setLanguage(description.getLanguage().getCode());
		tragetDescription.setKeyWords(description.getMetatagKeywords());

		if (description.getLanguage() != null) {
			tragetDescription.setLanguage(description.getLanguage().getCode());
		}
		return tragetDescription;
	}

	private ReadableProductProperty createProperty(ProductAttribute productAttribute, Language language) {

		ReadableProductProperty attr = new ReadableProductProperty();
		attr.setId(productAttribute.getProductOption().getId());// attribute of the option
		attr.setType(productAttribute.getProductOption().getProductOptionType());

		List<ProductOptionDescription> descriptions = productAttribute.getProductOption().getDescriptionsSettoList();

		ReadableProductPropertyValue propertyValue = new ReadableProductPropertyValue();

		if (descriptions != null && descriptions.size() > 0) {
			for (ProductOptionDescription optionDescription : descriptions) {
				com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription productOptionValueDescription = new com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription();
				productOptionValueDescription.setId(optionDescription.getId());
				productOptionValueDescription.setLanguage(optionDescription.getLanguage().getCode());
				productOptionValueDescription.setName(optionDescription.getName());
				propertyValue.getValues().add(productOptionValueDescription);

			}
		}

		attr.setCode(productAttribute.getProductOption().getCode());
		return attr;

	}

	private Optional<ReadableProductOptionValue> optionValue(ProductOptionValue optionValue, MerchantStore store,
			Language language) {

		if (optionValue == null) {
			return Optional.empty();
		}

		ReadableProductOptionValue optValue = new ReadableProductOptionValue();

		com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription valueDescription = new com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription();
		valueDescription.setLanguage(language.getCode());

		if (!StringUtils.isBlank(optionValue.getProductOptionValueImage())) {
			optValue.setImage(
					imageUtils.buildProductPropertyImageUtils(store, optionValue.getProductOptionValueImage()));
		}
		optValue.setSortOrder(0);

		if (optionValue.getProductOptionValueSortOrder() != null) {
			optValue.setSortOrder(optionValue.getProductOptionValueSortOrder().intValue());
		}

		optValue.setCode(optionValue.getCode());

		List<ProductOptionValueDescription> podescriptions = optionValue.getDescriptionsSettoList();
		ProductOptionValueDescription podescription = null;
		if (podescriptions != null && podescriptions.size() > 0) {
			podescription = podescriptions.get(0);
			if (podescriptions.size() > 1) {
				for (ProductOptionValueDescription optionValueDescription : podescriptions) {
					if (optionValueDescription.getLanguage().getId().intValue() == language.getId().intValue()) {
						podescription = optionValueDescription;
						break;
					}
				}
			}
		}
		valueDescription.setName(podescription.getName());
		valueDescription.setDescription(podescription.getDescription());
		optValue.setDescription(valueDescription);

		return Optional.of(optValue);

	}

	private void instanceToOption(TreeMap<Long, ReadableProductOption> selectableOptions, ProductVariant instance,
			MerchantStore store, Language language) {

		ReadableProductOption option = this.option(selectableOptions, instance.getVariation().getProductOption(),
				language);
		option.setVariant(true);

		// take care of option value
		Optional<ReadableProductOptionValue> optionOptionValue = this
				.optionValue(instance.getVariation().getProductOptionValue(), store, language);

		if (optionOptionValue.isPresent()) {
			optionOptionValue.get().setId(instance.getId());
			if (instance.isDefaultSelection()) {
				optionOptionValue.get().setDefaultValue(true);
			}
			addOptionValue(option, optionOptionValue.get());

		}

//		Long hide some lines here(6/5/2023)
//		if (instance.getVariationValue() != null) {
//			ReadableProductOption optionValue = this.option(selectableOptions,
//					instance.getVariationValue().getProductOption(), language);
//
//			// take care of option value
//			Optional<ReadableProductOptionValue> optionValueOptionValue = this
//					.optionValue(instance.getVariationValue().getProductOptionValue(), store, language);
//
//			if (optionValueOptionValue.isPresent()) {
//				optionValueOptionValue.get().setId(instance.getId());
//				if (instance.isDefaultSelection()) {
//					optionValueOptionValue.get().setDefaultValue(true);
//				}
//				addOptionValue(optionValue, optionValueOptionValue.get());
//			}
//
//		}
//		end

	}

	private void addOptionValue(ReadableProductOption option, ReadableProductOptionValue optionValue) {

		ReadableProductOptionValue find = option.getOptionValues().stream()
				.filter(optValue -> optValue.getCode() == optionValue.getCode()).findAny().orElse(null);

		if (find == null) {
			option.getOptionValues().add(optionValue);
		}
	}

	private ReadableProductOption option(TreeMap<Long, ReadableProductOption> selectableOptions, ProductOption option,
			Language language) {
		if (selectableOptions.containsKey(option.getId())) {
			return selectableOptions.get(option.getId());
		}

		ReadableProductOption readable = this.createOption(option, language);
		selectableOptions.put(readable.getId(), readable);
		return readable;
	}

	private ReadableProductOption createOption(ProductOption opt, Language language) {

		ReadableProductOption option = new ReadableProductOption();
		option.setId(opt.getId());// attribute of the option
		option.setType(opt.getProductOptionType());
		option.setCode(opt.getCode());
		List<ProductOptionDescription> descriptions = opt.getDescriptionsSettoList();
		ProductOptionDescription description = null;
		if (descriptions != null && descriptions.size() > 0) {
			description = descriptions.get(0);
			if (descriptions.size() > 1) {
				for (ProductOptionDescription optionDescription : descriptions) {
					if (optionDescription.getLanguage().getCode().equals(language.getCode())) {
						description = optionDescription;
						break;
					}
				}
			}
		}

		if (description == null) {
			return null;
		}

		option.setLang(language.getCode());
		option.setName(description.getName());
		option.setCode(opt.getCode());

		return option;

	}

	// Long add some here (18/5/2023)
	private ReadableSkillDescription convertSkill(SkillDescription sd) {
		ReadableSkillDescription rsd = new ReadableSkillDescription();
		rsd.setCode(sd.getCode());
		rsd.setId(sd.getId());
		rsd.setName(sd.getName());
		return rsd;
	}

	private ReadableLocationDescription convertLocation(LocationDescription ld) {
		ReadableLocationDescription rld = new ReadableLocationDescription();
		rld.setIdLocation(ld.getID_LOCATION());
		rld.setDetailAddress(ld.getDETAIL_ADDRESS());
		rld.setIdWard(ld.getWard().getIdWard());
		rld.setWard(ld.getWard().getName());
		rld.setIdDistinct(ld.getDistrict().getIdDistrict());
		rld.setDistrict(ld.getDistrict().getName());
		rld.setIdProvince(ld.getProvince().getIdProvince());
		rld.setProvince(ld.getProvince().getName());
		return rld;
	}
	// end

	// Long add some here (18/5/2023)
	private ReadablePosition convertPosition(PositionDescription ld) {
		ReadablePosition readablePostion = new ReadablePosition();
		readablePostion.setCode(ld.getCode());
		readablePostion.setName(ld.getName());
		return readablePostion;
	}
	// end
}
