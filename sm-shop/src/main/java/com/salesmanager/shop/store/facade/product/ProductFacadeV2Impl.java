package com.salesmanager.shop.store.facade.product;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.recruitment.RecruitmentRepository;
import com.salesmanager.core.business.services.catalog.category.CategoryService;
import com.salesmanager.core.business.services.catalog.pricing.PricingService;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.catalog.product.attribute.ProductAttributeService;
import com.salesmanager.core.business.services.catalog.product.availability.ProductAvailabilityService;
import com.salesmanager.core.business.services.catalog.product.jobRate.JobRateService;
import com.salesmanager.core.business.services.catalog.product.relationship.ProductRelationshipService;
import com.salesmanager.core.business.services.catalog.product.variant.ProductVariantService;
import com.salesmanager.core.business.services.customer.CustomerService;
import com.salesmanager.core.business.services.merchant.MerchantStoreService;
import com.salesmanager.core.business.services.recruitment.RecruitmentService;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.ProductCriteria;
import com.salesmanager.core.model.catalog.product.relationship.ProductRelationship;
import com.salesmanager.core.model.catalog.product.relationship.ProductRelationshipType;
import com.salesmanager.core.model.catalog.product.variant.ProductVariant;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.JobRate;
import com.salesmanager.core.model.customer.JobRateStatus;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.mapper.catalog.product.ReadableProductMapper;
import com.salesmanager.shop.mapper.catalog.product.ReadableProductVariantMapper;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.catalog.product.ReadableProductDetail;
import com.salesmanager.shop.model.catalog.product.ReadableProductList;
import com.salesmanager.shop.model.catalog.product.product.variant.ReadableProductVariant;
import com.salesmanager.shop.populator.catalog.ReadableProductPopulator;
import com.salesmanager.shop.store.api.exception.ResourceNotFoundException;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.product.facade.ProductFacade;
import com.salesmanager.shop.utils.ImageFilePath;
import com.salesmanager.shop.utils.LocaleUtils;

@Service("productFacadeV2")
@Profile({ "default", "cloud", "gcp", "aws", "mysql", "local" })
public class ProductFacadeV2Impl implements ProductFacade {

	@Autowired
	private ProductService productService;

	@Autowired
	private CustomerService customerService;

	@Inject
	private CategoryService categoryService;

	@Inject
	private ProductRelationshipService productRelationshipService;

	@Autowired
	private ReadableProductMapper readableProductMapper;

	@Autowired
	private ProductVariantService productVariantService;

	@Autowired
	private ReadableProductVariantMapper readableProductVariantMapper;

	@Autowired
	private ProductAvailabilityService productAvailabilityService;

	@Autowired
	private ProductAttributeService productAttributeService;

	@Inject
	private PricingService pricingService;

	@Autowired
	private MerchantStoreService merchantStoreService;

	@Autowired
	private JobRateService jobRateService;

	@Autowired
	private RecruitmentService recruitmentService;

	@Inject
	@Qualifier("img")
	private ImageFilePath imageUtils;

	@Override
	public Product getProduct(Long id, MerchantStore store) {
		// same as v1
		return productService.findOne(id, store);
	}

	@Override
	public ReadableProduct getProductByCode(MerchantStore store, String sku, Language language) {

		Product product = null;
		try {
			product = productService.getBySku(sku, store, language);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}

		if (product == null) {
			throw new ResourceNotFoundException(
					"Product [" + sku + "] not found for merchant [" + store.getCode() + "]");
		}

		if (product.getMerchantStore().getId() != store.getId()) {
			throw new ResourceNotFoundException(
					"Product [" + sku + "] not found for merchant [" + store.getCode() + "]");
		}

		ReadableProduct readableProduct = readableProductMapper.convert(product, store, language);

		return readableProduct;

	}

	private ReadableProductVariant productVariant(ProductVariant instance, MerchantStore store, Language language) {

		return readableProductVariantMapper.convert(instance, store, language);

	}

	@Override
	public ReadableProduct getProduct(MerchantStore store, String sku, Language language) throws Exception {
		return this.getProductByCode(store, sku, language);
	}

	@Override
	public ReadableProduct getProductBySeUrl(MerchantStore store, String friendlyUrl, Language language)
			throws Exception {

		Product product = productService.getBySeUrl(store, friendlyUrl, LocaleUtils.getLocale(language));

		if (product == null) {
			throw new ResourceNotFoundException(
					"Product [" + friendlyUrl + "] not found for merchant [" + store.getCode() + "]");
		}

		ReadableProduct readableProduct = readableProductMapper.convert(product, store, language);

		// get all instances for this product group by option
		// limit to 15 searches
		List<ProductVariant> instances = productVariantService.getByProductId(store, product, language);

		// the above get all possible images

//		Long hide some lines here
//		List<ReadableProductVariant> readableInstances = instances.stream().map(p -> this.productVariant(p, store, language)).collect(Collectors.toList());
//		readableProduct.setVariants(readableInstances);
//		end
		return readableProduct;

	}

	/**
	 * Filters on otion, optionValues and other criterias
	 */

	@Override
	public ReadableProductList getProductListsByCriterias(MerchantStore store, Language language,
			ProductCriteria criterias) throws Exception {
		Validate.notNull(criterias, "ProductCriteria must be set for this product");

		/** This is for category **/
		if (CollectionUtils.isNotEmpty(criterias.getCategoryIds())) {

			if (criterias.getCategoryIds().size() == 1) {

				com.salesmanager.core.model.catalog.category.Category category = categoryService
						.getById(criterias.getCategoryIds().get(0));

				if (category != null) {
					String lineage = new StringBuilder().append(category.getLineage()).toString();

					List<com.salesmanager.core.model.catalog.category.Category> categories = categoryService
							.getListByLineage(store, lineage);

					List<Long> ids = new ArrayList<Long>();
					if (categories != null && categories.size() > 0) {
						for (com.salesmanager.core.model.catalog.category.Category c : categories) {
							ids.add(c.getId());
						}
					}
					ids.add(category.getId());
					criterias.setCategoryIds(ids);
				}
			}
		}

		Page<Product> modelProductList = productService.listByStore(store, language, criterias,
				criterias.getStartPage(), criterias.getMaxCount());

		List<Product> products = modelProductList.getContent();
		ReadableProductList productList = new ReadableProductList();

		/**
		 * ReadableProductMapper
		 */

		List<ReadableProduct> readableProducts = products.stream()
				.map(p -> readableProductMapper.convert(p, store, language))
				.sorted(Comparator.comparing(ReadableProduct::getSortOrder)).collect(Collectors.toList());

		productList.setRecordsTotal(modelProductList.getTotalElements());
		productList.setNumber(modelProductList.getNumberOfElements());
		productList.setProducts(readableProducts);
		productList.setTotalPages(modelProductList.getTotalPages());

		return productList;
	}

	@Override
	public List<ReadableProduct> relatedItems(MerchantStore store, Product product, Language language)
			throws Exception {
		// same as v1
		ReadableProductPopulator populator = new ReadableProductPopulator();
		populator.setPricingService(pricingService);
		populator.setimageUtils(imageUtils);

		List<ProductRelationship> relatedItems = productRelationshipService.getByType(store, product,
				ProductRelationshipType.RELATED_ITEM);
		if (relatedItems != null && relatedItems.size() > 0) {
			List<ReadableProduct> items = new ArrayList<ReadableProduct>();
			for (ProductRelationship relationship : relatedItems) {
				Product relatedProduct = relationship.getRelatedProduct();
				ReadableProduct proxyProduct = populator.populate(relatedProduct, new ReadableProduct(), store,
						language);
				items.add(proxyProduct);
			}
			return items;
		}
		return null;
	}

	@Override
	public ReadableProductList getProductLists(String username, ProductCriteria criterias) throws Exception {
		Validate.notNull(criterias, "ProductCriteria must be set for this product");

		Page<Product> modelProductList = productService.listByStoreV2(criterias, criterias.getStartPage(),
				criterias.getMaxCount());

		List<Product> products = modelProductList.getContent();
		ReadableProductList productList = new ReadableProductList();

		/**
		 * ReadableProductMapper
		 */

		List<ReadableProduct> readableProducts = products.stream().map(p -> readableProductMapper.convert(p))
				.sorted(Comparator.comparing(ReadableProduct::getSortOrder)).collect(Collectors.toList());

		if (username != null) {
			Customer alumnus = customerService.getByNick(username);
			if (!Objects.isNull(alumnus)) {
				for (int i = 0; i < readableProducts.size(); i++) {
					JobRate jobRate = jobRateService.findByJobAndAlumnus(products.get(i), alumnus);
					if (!Objects.isNull(jobRate)
							&& jobRate.getJobRateStatus().name().equals(JobRateStatus.LIKED.toString())) {
						readableProducts.get(i).setFollow(true);
					} else {
						readableProducts.get(i).setFollow(false);
					}
				}
			}
		}

		productList.setRecordsTotal(modelProductList.getTotalElements());
		productList.setNumber(modelProductList.getNumberOfElements());
		productList.setProducts(readableProducts);
		productList.setTotalPages(modelProductList.getTotalPages());

		return productList;
	}

//	Long add some lines here(20/5/20223)
	@Override
	public ReadableProductDetail getProductByCode(String username, String sku) {
		Product product = null;
		try {
			product = productService.getBySku(sku);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}

		if (product == null) {
			throw new ResourceNotFoundException("Product " + sku + " not found");
		}
		ReadableProductDetail readableProduct = readableProductMapper.convertDetail(product);
		if (username != null) {
			Customer alumnus = customerService.getByNick(username);
			if (!Objects.isNull(alumnus)) {
				JobRate jobRate = jobRateService.findByJobAndAlumnus(product, alumnus);
				if (!Objects.isNull(jobRate)
						&& jobRate.getJobRateStatus().name().equals(JobRateStatus.LIKED.toString())) {
					readableProduct.setFollow(true);
				} else {
					readableProduct.setFollow(false);
				}
				// check is applied
				boolean isApplied = recruitmentService.existByAlumnusAndJob(alumnus, product);
				if (isApplied == true) {
					readableProduct.setApplied(true);
				} else {
					readableProduct.setFollow(false);
				}
			}
		}
		return readableProduct;
	}
//	end

	@Override
	public List<ReadableProduct> getProductsByStoreCode(String storeCode) {
		MerchantStore store = null;
		try {
			store = merchantStoreService.getByCode(storeCode);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		if (store == null) {
			throw new NullPointerException("Not found store");
		}
		List<Product> products = productService.listByStore(store);
		return products.stream().map(item -> readableProductMapper.convert(item)).toList();
	}

	@Override
	public List<ReadableProduct> getProductsLastest(String username) {
		List<Product> products = productService.getProductsLastest();
		List<ReadableProduct> readableProducts = products.stream().map(item -> readableProductMapper.convert(item))
				.toList();
		if (username != null) {
			Customer alumnus = customerService.getByNick(username);
			if (!Objects.isNull(alumnus)) {
				for (int i = 0; i < readableProducts.size(); i++) {
					JobRate jobRate = jobRateService.findByJobAndAlumnus(products.get(i), alumnus);
					if (!Objects.isNull(jobRate)
							&& jobRate.getJobRateStatus().name().equals(JobRateStatus.LIKED.toString())) {
						readableProducts.get(i).setFollow(true);
					} else {
						readableProducts.get(i).setFollow(false);
					}
					// check is applied
					boolean isApplied = recruitmentService.existByAlumnusAndJob(alumnus, products.get(i));
					if (isApplied == true) {
						readableProducts.get(i).setApplied(true);
					} else {
						readableProducts.get(i).setFollow(false);
					}
				}
			}
		}
		return readableProducts;
	}

	@Override
	public ReadableProductList getProducts(String username, Integer page, Integer count, Map<String, Object> filter) {
		Page<Product> pageJob = productService.getProducts(page, count, filter);
		List<ReadableProduct> list = new ArrayList<ReadableProduct>();
		if (!Objects.isNull(pageJob)) {
			list = pageJob.getContent().stream().map(item -> readableProductMapper.convert(item)).toList();
		}
		if (username != null) {
			Customer alumnus = customerService.getByNick(username);
			if (!Objects.isNull(alumnus)) {
				for (int i = 0; i < list.size(); i++) {
					JobRate jobRate = jobRateService.findByJobAndAlumnus(pageJob.getContent().get(i), alumnus);
					if (!Objects.isNull(jobRate)
							&& jobRate.getJobRateStatus().name().equals(JobRateStatus.LIKED.toString())) {
						list.get(i).setFollow(true);
					} else {
						list.get(i).setFollow(false);
					}
					// check is applied
					boolean isApplied = recruitmentService.existByAlumnusAndJob(alumnus, pageJob.getContent().get(i));
					if (isApplied == true) {
						list.get(i).setApplied(true);
					} else {
						list.get(i).setFollow(false);
					}
				}
			}
		}
		ReadableProductList products = new ReadableProductList();
		products.setProducts(list);
		products.setRecordsFiltered(
				!Objects.isNull(pageJob) ? pageJob.getNumberOfElements() : Collections.emptyList().size());
		products.setRecordsTotal(
				!Objects.isNull(pageJob) ? pageJob.getTotalElements() : Collections.emptyList().size());
		products.setTotalPages(!Objects.isNull(pageJob) ? pageJob.getTotalPages() : Collections.emptyList().size());
		products.setNumber(Long.valueOf(productService.count()).intValue());
		return products;
	}

	/**
	 * @Override public ReadableProductPrice getProductPrice(Long id,
	 *           ProductPriceRequest priceRequest, MerchantStore store, Language
	 *           language) {
	 * 
	 * 
	 *           Validate.notNull(id, "Product id cannot be null");
	 *           Validate.notNull(priceRequest, "Product price request cannot be
	 *           null"); Validate.notNull(store, "MerchantStore cannot be null");
	 *           Validate.notNull(language, "Language cannot be null");
	 * 
	 *           try { Product model = productService.findOne(id, store);
	 * 
	 *           List<ProductAttribute> attributes = null;
	 * 
	 *           if(!CollectionUtils.isEmpty(priceRequest.getOptions())) {
	 *           List<Long> attrinutesIds = priceRequest.getOptions().stream().map(p
	 *           -> p.getId()).collect(Collectors.toList());
	 * 
	 *           attributes = productAttributeService.getByAttributeIds(store,
	 *           model, attrinutesIds);
	 * 
	 *           for(ProductAttribute attribute : attributes) {
	 *           if(attribute.getProduct().getId().longValue()!= id.longValue()) {
	 *           //throw unauthorized throw new
	 *           OperationNotAllowedException("Attribute with id [" +
	 *           attribute.getId() + "] is not attached to product id [" + id +
	 *           "]"); } } }
	 * 
	 *           if(!StringUtils.isBlank(priceRequest.getSku())) { //change default
	 *           availability with sku (instance availability)
	 *           List<ProductAvailability> availabilityList =
	 *           productAvailabilityService.getBySku(priceRequest.getSku(), store);
	 *           if(CollectionUtils.isNotEmpty(availabilityList)) {
	 *           model.setAvailabilities(new
	 *           HashSet<ProductAvailability>(availabilityList)); } }
	 * 
	 *           FinalPrice price;
	 * 
	 *           //attributes can be null; price =
	 *           pricingService.calculateProductPrice(model, attributes);
	 *           ReadableProductPrice readablePrice = new ReadableProductPrice();
	 *           ReadableFinalPricePopulator populator = new
	 *           ReadableFinalPricePopulator();
	 *           populator.setPricingService(pricingService);
	 * 
	 * 
	 *           return populator.populate(price, readablePrice, store, language);
	 * 
	 *           } catch (Exception e) { throw new ServiceRuntimeException("An error
	 *           occured while getting product price",e); }
	 * 
	 * 
	 *           }
	 **/

}
