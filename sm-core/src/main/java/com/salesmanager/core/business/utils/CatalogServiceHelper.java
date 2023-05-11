package com.salesmanager.core.business.utils;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.attribute.*;
import com.salesmanager.core.model.catalog.product.availability.ProductAvailability;

import java.util.HashSet;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;


public class CatalogServiceHelper {

	/**
	 * Filters descriptions and set the appropriate language
	 *
	 * @param p
	 * @param language
	 */
	public static void setToLanguage(Product p, int language) {

//		Long hide some lines here(6/5/2023)
//		Set<ProductAttribute> attributes = p.getAttributes();
//		if (attributes != null) {
//
//			for (ProductAttribute attribute : attributes) {
//
//				ProductOption po = attribute.getProductOption();
//				if (po.getDescriptions() != null) {
//					Set<ProductOptionDescription> podDescriptions = po.getDescriptions().stream().filter(pod -> pod.getLanguage().getId() == language).collect(Collectors.toSet());
//					po.setDescriptions(podDescriptions);
//				}
//
//				ProductOptionValue pov = attribute.getProductOptionValue();
//				if (pov.getDescriptions() != null) {
//					Set<ProductOptionValueDescription> povdDescriptions = pov.getDescriptions().stream().filter(pod -> pod.getLanguage().getId() == language).collect(Collectors.toSet());
//					pov.setDescriptions(povdDescriptions);
//				}
//			}
//		}
//		end

	}

	/**
	 * Overwrites the availability in order to return 1 price / region
	 *
	 * @param product
	 * @param locale
	 */
	public static void setToAvailability(Product product, Locale locale) {

		Set<ProductAvailability> availabilities = product.getAvailabilities();
		Set<ProductAvailability> productAvailabilities = new HashSet<ProductAvailability>();

		Optional<ProductAvailability> defaultAvailability = availabilities.stream().filter(productAvailability -> productAvailability.getRegion().equals(Constants.ALL_REGIONS)).findFirst();
		Optional<ProductAvailability> localeAvailability = availabilities.stream().filter(productAvailability -> productAvailability.getRegion().equals(locale.getCountry())).findFirst();
		if (defaultAvailability.isPresent()) {
			productAvailabilities.add(defaultAvailability.get());
		}
		if (localeAvailability.isPresent()) {
			productAvailabilities.add(localeAvailability.get());
		}

		if (productAvailabilities.isEmpty()) {
			product.setAvailabilities(productAvailabilities);

		}
	}

}
