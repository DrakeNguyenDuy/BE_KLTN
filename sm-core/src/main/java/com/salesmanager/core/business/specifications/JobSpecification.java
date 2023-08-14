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
import com.salesmanager.core.model.experience.ExperienceDescription;
import com.salesmanager.core.model.location.LocationDescription;
import com.salesmanager.core.model.merchant.MerchantStore;

@Component
public class JobSpecification {

	public Specification<Product> search(Map<String, Object> map) {
		return (root, query, criteriaBuilder) -> {
			String search = (String) map.get("search");
			String area = (String) map.get("area");
			String career = (String) map.get("career");
			String typeWork = (String) map.get("typeWork");
			String experience = (String) map.get("experience");
			String paycycle = (String) map.get("paycycle");
			String order = (String) map.get("order");
			List<Predicate> predicates = new ArrayList<Predicate>();

			Join<Product, ProductDescription> descriptionJoin = root.joinSet("descriptions");
			Join<Product, LocationDescription> locations = root.joinSet("locationDescriptions");
			Join<LocationDescription, District> distinct = locations.join("district");
			Join<Product, ProductType> jobType = root.join("type");
			Join<Product, ExperienceDescription> jobExperience = root.join("experience");
			Join<Product, Category> jobTypeWork = root.joinSet("categories");
			Join<Product, ProductAvailability> jobAvail = root.joinSet("availabilities");
			Join<ProductAvailability, ProductPrice> jobPrice = jobAvail.joinSet("prices");
			if (search != null) {
				predicates.add(
						criteriaBuilder.like(criteriaBuilder.lower(descriptionJoin.get("name")), "%" + search + "%"));
			}
			if (area != null) {
				List<String> listArea = Arrays.asList(area.split(Constants.SPLIT));
				listArea = listArea.stream().map(item -> item.trim()).collect(Collectors.toList());
				predicates.add(distinct.get("name").in(listArea));
			}
			if (career != null) {
				List<String> listCareer = Arrays.asList(career.split(Constants.SPLIT));
				listCareer = listCareer.stream().map(item -> item.trim()).collect(Collectors.toList());
				predicates.add(jobType.get("code").in(listCareer));
			}
			if (typeWork != null) {
				predicates.add(criteriaBuilder.equal(jobTypeWork.get("code"), typeWork));
			}
			if (experience != null) {
				predicates.add(criteriaBuilder.equal(jobExperience.get("CODE"), experience));
			}
			if (paycycle != null) {
				predicates.add(criteriaBuilder.equal(root.get("idPayCycle"), paycycle));
			}
			if (order != null) {
				switch (order) {
				case Constants.FILTER_BY_LASTEST:
					query.orderBy(criteriaBuilder.desc(root.get("auditSection").get("dateCreated")));
					break;
				case Constants.FILTER_BY_UPDATE:
					query.orderBy(criteriaBuilder.desc(root.get("auditSection").get("dateModified")));
					break;
				case Constants.FILTER_BY_SALARY:
					query.orderBy(criteriaBuilder.desc(jobPrice.get("productPriceAmount")));
					break;
				default:
					break;
				}
			}
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		};
	}

	public Specification<Product> query(Map<String, String> map) {
		return (root, query, criteriaBuilder) -> {
			String search = map.get("query");
			String status = map.get("status");
			String storeCode = map.get("storeCode");
			List<Predicate> predicates = new ArrayList<Predicate>();

			Join<Product, ProductDescription> descriptionJoin = root.joinSet("descriptions");
			Join<Product, MerchantStore> employer = root.join("merchantStore");
			if (search != null) {
				predicates.add(
						criteriaBuilder.like(criteriaBuilder.lower(descriptionJoin.get("name")), "%" + search + "%"));
			}
			if (status != null) {
				JobStatus jobStatus = JobStatus.valueOf(status) == JobStatus.ACTIVE ? JobStatus.ACTIVE
						: JobStatus.valueOf(status) == JobStatus.INACTIVE ? JobStatus.INACTIVE : JobStatus.OUTOFDATE;
				predicates.add(criteriaBuilder.equal(root.get("status"), jobStatus));
			}
			if (storeCode != null) {
				predicates.add(criteriaBuilder.equal(employer.get("code"), storeCode));
			}
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		};
	}
}
