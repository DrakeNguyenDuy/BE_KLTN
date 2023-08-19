package com.salesmanager.core.business.specifications;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.user.User;

@Component
public class MerchantStoreSpecification {

	public Specification<MerchantStore> query(Map<String, String> map) {
		return (root, query, criteriaBuilder) -> {
			String search = map.get("query");
			String status = map.get("active");
			List<Predicate> predicates = new ArrayList<Predicate>();
			
			Join<MerchantStore, User> user = root.join("users");

			if (search != null) {
				predicates.add(criteriaBuilder.like(criteriaBuilder.lower(root.get("storename")), "%" + search + "%"));
			}
			if (status != null) {
				boolean active = status.equals("ACTIVE") ? true : false;
				predicates.add(criteriaBuilder.equal(user.get("active"), active));
			}
			query.orderBy(criteriaBuilder.desc(root.get("auditSection").get("dateCreated")));
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		};
	}
}
