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
import com.salesmanager.core.model.user.User;

@Component
public class RecruitmentSpecification {

	public Specification<Recruitment> query(Map<String, String> map) {
		return (root, query, criteriaBuilder) -> {
			String status = map.get("status");
			String email = map.get("email");
			List<Predicate> predicates = new ArrayList<Predicate>();
			

			Join<Product, Recruitment> jobs = root.join("job");
			Join<MerchantStore, Product> store = jobs.join("merchantStore");
			Join<User, MerchantStore> user = store.join("users");
			
			if (status != null) {
				StatusProcess statusProcess = StatusProcess.valueOf(status);
				predicates.add(criteriaBuilder.equal(root.get("statusProcess"), statusProcess));
			}
			if (email != null) {
				predicates.add(criteriaBuilder.equal(user.get("adminEmail"), email));
			}
			query.orderBy(criteriaBuilder.desc(root.get("applyDate")));
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		};
	}
}
