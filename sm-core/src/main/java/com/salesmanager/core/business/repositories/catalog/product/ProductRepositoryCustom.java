package com.salesmanager.core.business.repositories.catalog.product;

import java.util.List;
import java.util.Locale;
import java.util.Set;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.ProductCriteria;
import com.salesmanager.core.model.catalog.product.ProductList;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.tax.taxclass.TaxClass;

public interface ProductRepositoryCustom {

	ProductList listByStore(MerchantStore store, Language language, ProductCriteria criteria);

//		Long add some lines here(14/5/2023)
	ProductList listByStore(ProductCriteria criteria);
//		end

	Product getProductWithOnlyMerchantStoreById(Long productId);

	Product getByFriendlyUrl(MerchantStore store, String seUrl, Locale locale);

	List<Product> getProductsListByCategories(@SuppressWarnings("rawtypes") Set categoryIds);

	List<Product> getProductsListByCategories(Set<Long> categoryIds, Language language);

	List<Product> getProductsListByIds(Set<Long> productIds);

	List<Product> listByTaxClass(TaxClass taxClass);

	List<Product> listByStore(MerchantStore store);

	Product getProductForLocale(long productId, Language language, Locale locale);

	Product getById(Long productId);

	Product getById(Long productId, MerchantStore merchant);

	/**
	 * Get product by code
	 * 
	 * @deprecated This method is no longer acceptable to get product by code.
	 *             <p>
	 *             Use {@link ProductService#getBySku(sku, store)} instead.
	 */
	@Deprecated
	Product getByCode(String productCode, Language language);

	/**
	 * Get product by code
	 * 
	 * @deprecated This method is no longer acceptable to get product by code.
	 *             <p>
	 *             Use {@link ProductService#getBySku(sku, store)} instead.
	 */
	@Deprecated
	Product getByCode(String productCode, MerchantStore store);

	Product getById(Long productId, MerchantStore store, Language language);

	List<Product> getProductsForLocale(MerchantStore store, Set<Long> categoryIds, Language language, Locale locale);

}
