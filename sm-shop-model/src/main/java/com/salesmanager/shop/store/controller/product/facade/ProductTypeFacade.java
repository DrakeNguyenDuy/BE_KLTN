package com.salesmanager.shop.store.controller.product.facade;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.shop.model.catalog.product.type.PersistableProductType;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductType;
import com.salesmanager.shop.model.catalog.product.type.ReadableProductTypeList;

public interface ProductTypeFacade {
  
  ReadableProductTypeList getByMerchant(MerchantStore store, Language language, int count, int page);
  
//  Long add some lines here(24/5/2023)
  ReadableProductTypeList getAllTypes(int count, int page);
//  end
  
  ReadableProductType get(MerchantStore store, Long id, Language language);
  
  ReadableProductType get(MerchantStore store, String code, Language language);
  
  Long save(PersistableProductType type, MerchantStore store, Language language);
  
//  Long add some lines here(23/5/2023)
  Long save(PersistableProductType type);
  boolean exists(String code);
  void update(PersistableProductType type, Long id);
//  
  
  void update(PersistableProductType type, Long id, MerchantStore store, Language language);
  
  void delete(Long id, MerchantStore store, Language language);
  
  boolean exists(String code, MerchantStore store, Language language);

}
