package com.salesmanager.core.business.specifications;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.model.address.District;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.JobStatus;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.availability.ProductAvailability;
import com.salesmanager.core.model.catalog.product.description.ProductDescription;
import com.salesmanager.core.model.catalog.product.price.ProductPrice;
import com.salesmanager.core.model.catalog.product.type.ProductType;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.profile.CV;
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.location.LocationDescription;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.recruitment.Recruitment;
import com.salesmanager.core.model.recruitment.StatusProcess;

@Component
public class AlumnusSpecification {

	public Specification<Customer> query(Map<String, String> map) {
		return (root, query, criteriaBuilder) -> {
			String search = map.get("query");
			String status = map.get("active");
			List<Predicate> predicates = new ArrayList<Predicate>();

			if (search != null) {
				predicates.add(criteriaBuilder.or(
						criteriaBuilder.like(criteriaBuilder.lower(root.get("lastName")), "%" + search + "%"),
						criteriaBuilder.like(criteriaBuilder.lower(root.get("firstName")), "%" + search + "%")));
			}
			if (status != null) {
				boolean active = status.equals("ACTIVE") ? true : false;
				predicates.add(criteriaBuilder.equal(root.get("active"), active));
			}
			query.orderBy(criteriaBuilder.desc(root.get("auditSection").get("dateCreated")));
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		};
	}
}
