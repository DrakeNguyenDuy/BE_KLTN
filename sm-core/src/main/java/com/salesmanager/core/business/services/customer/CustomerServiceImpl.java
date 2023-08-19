package com.salesmanager.core.business.services.customer;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.repositories.customer.CustomerRepository;
import com.salesmanager.core.business.services.common.generic.SalesManagerEntityServiceImpl;
import com.salesmanager.core.business.services.customer.attribute.CustomerAttributeService;
import com.salesmanager.core.business.specifications.AlumnusSpecification;
import com.salesmanager.core.model.common.Address;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.customer.CustomerCriteria;
import com.salesmanager.core.model.customer.CustomerList;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.modules.utils.GeoLocation;

@Service("customerService")
public class CustomerServiceImpl extends SalesManagerEntityServiceImpl<Long, Customer> implements CustomerService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerServiceImpl.class);

	private CustomerRepository customerRepository;

	@Inject
	private CustomerAttributeService customerAttributeService;

	@Inject
	private GeoLocation geoLocation;

	@Autowired
	private AlumnusSpecification alumnusSpecification;

	@Inject
	public CustomerServiceImpl(CustomerRepository customerRepository) {
		super(customerRepository);
		this.customerRepository = customerRepository;
	}

	@Override
	public List<Customer> getByName(String firstName) {
		return customerRepository.findByName(firstName);
	}

	@Override
	public Customer getById(Long id) {
		return customerRepository.findOne(id);
	}

	@Override
	public Customer getByNick(String nick) {
		return customerRepository.findByNick(nick);
	}

	@Override
	public Customer getByNick(String nick, int storeId) {
		return customerRepository.findByNick(nick, storeId);
	}

	@Override
	public List<Customer> getListByStore(MerchantStore store) {
		return customerRepository.findByStore(store.getId());
	}

	@Override
	public CustomerList getListByStore(MerchantStore store, CustomerCriteria criteria) {
		return customerRepository.listByStore(store, criteria);
	}

	@Override
	public Address getCustomerAddress(MerchantStore store, String ipAddress) throws ServiceException {

		try {
			return geoLocation.getAddress(ipAddress);
		} catch (Exception e) {
			throw new ServiceException(e);
		}

	}

	@Override
	public void saveOrUpdate(Customer customer) throws ServiceException {

		LOGGER.debug("Creating Customer");

		if (customer.getId() != null && customer.getId() > 0) {
			super.update(customer);
		} else {

			super.create(customer);

		}
	}

	public void delete(Customer customer) throws ServiceException {
		customer = getById(customer.getId());

//		Long hide some lines here(20/5/2023)
//		//delete attributes
//		List<CustomerAttribute> attributes =customerAttributeService.getByCustomer(customer.getMerchantStore(), customer);
//		if(attributes!=null) {
//			for(CustomerAttribute attribute : attributes) {
//				customerAttributeService.delete(attribute);
//			}
//		}
//		end
		customerRepository.delete(customer);

	}

	@Override
	public Customer getByNick(String nick, String code) {
		return customerRepository.findByNick(nick, code);
	}

	@Override
	public Customer getByPasswordResetToken(String storeCode, String token) {
		return customerRepository.findByResetPasswordToken(token, storeCode);
	}

	@Override
	public void uploadAvatar(String username, byte[] avatar) {
		Customer alumnus = customerRepository.findByNick(username);
		if (alumnus == null) {
			throw new NullPointerException("Can not found alumnus");
		}
		alumnus.setAvatar(avatar);
		customerRepository.save(alumnus);
	}

	@Override
	public byte[] getAvatar(String username) {
		Customer alumnus = customerRepository.findByNick(username);
		if (alumnus == null) {
			throw new NullPointerException("Can not found alumnus");
		}
		return alumnus.getAvatar();
	}

	@Override
	public Page<Customer> findAll(Integer page, Integer size, Map<String, String> map) {
		Pageable paging = PageRequest.of(page, size);
		Specification<Customer> specification = alumnusSpecification.query(map);
		return customerRepository.findAll(specification, paging);
	}

	@Override
	public boolean checkIfActive(String userName) {
		return customerRepository.existsByNickAndActive(userName, true);
	}

	@Override
	public String unlockOrBlock(String userName) {
		Customer alumnus = customerRepository.findByNick(userName);
		if (Objects.nonNull(alumnus)) {
			boolean newStatus = !alumnus.isActive();
			alumnus.setActive(newStatus);
			customerRepository.save(alumnus);
			return "Update Success";
		}
		return "Alumnus not found";
	}

	@Override
	public boolean existsByEmailAddress(String mail) {
		return customerRepository.existsByEmailAddress(mail);
	}

}
