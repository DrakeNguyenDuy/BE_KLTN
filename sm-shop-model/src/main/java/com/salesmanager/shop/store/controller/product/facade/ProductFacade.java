package com.salesmanager.shop.store.controller.product.facade;

import java.util.List;

import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.ProductCriteria;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.catalog.product.ProductPriceRequest;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.catalog.product.ReadableProductDetail;
import com.salesmanager.shop.model.catalog.product.ReadableProductList;
import com.salesmanager.shop.model.catalog.product.ReadableProductPrice;

public interface ProductFacade {

	/**
	 * 
	 * @param id
	 * @param store
	 * @return
	 */
	Product getProduct(Long id, MerchantStore store);

	/**
	 * Reads a product by code
	 *
	 * @param store
	 * @param uniqueCode
	 * @param language
	 * @return
	 * @throws Exception
	 */
	ReadableProduct getProductByCode(MerchantStore store, String uniqueCode, Language language);
	
//	Long add some lines here(20/5/2023)
	ReadableProductDetail getProductByCode(String uniqueCode);
//	end

	/**
	 * Get a product by sku and store
	 *
	 * @param store
	 * @param sku
	 * @param language
	 * @return
	 * @throws Exception
	 */
	ReadableProduct getProduct(MerchantStore store, String sku, Language language) throws Exception;

	/**
	 * Get a Product by friendlyUrl (slug), store and language
	 *
	 * @param store
	 * @param friendlyUrl
	 * @param language
	 * @return
	 * @throws Exception
	 */
	ReadableProduct getProductBySeUrl(MerchantStore store, String friendlyUrl, Language language) throws Exception;

	/**
	 * Filters a list of product based on criteria
	 *
	 * @param store
	 * @param language
	 * @param criterias
	 * @return
	 * @throws Exception
	 */
	ReadableProductList getProductListsByCriterias(MerchantStore store, Language language, ProductCriteria criterias)
			throws Exception;

//  Long add some lines here(14/5/2023)
	/**
	 * Get a list of product based on criteria
	 *
	 * @param criterias
	 * @return
	 * @throws Exception
	 */
	ReadableProductList getProductLists(ProductCriteria criterias) throws Exception;
//  end

	/**
	 * Get related items
	 *
	 * @param store
	 * @param product
	 * @param language
	 * @return
	 * @throws Exception
	 */
	List<ReadableProduct> relatedItems(MerchantStore store, Product product, Language language) throws Exception;
	
	//Long add some lines here(18/6/2023)
	List<ReadableProduct> getProductsByStoreCode(String storeCode);
//	end

}
