package com.salesmanager.shop.store.controller.store.facade;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.Validate;
import org.drools.core.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.content.ContentService;
import com.salesmanager.core.business.services.merchant.MerchantStoreService;
import com.salesmanager.core.business.services.reference.language.LanguageService;
import com.salesmanager.core.business.services.system.MerchantConfigurationService;
import com.salesmanager.core.constants.MeasureUnit;
import com.salesmanager.core.model.common.GenericEntityList;
import com.salesmanager.core.model.content.InputContentFile;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.merchant.MerchantStoreCriteria;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.system.MerchantConfiguration;
import com.salesmanager.core.model.system.MerchantConfigurationType;
import com.salesmanager.shop.mapper.store.Employer;
import com.salesmanager.shop.mapper.store.EmployerDetailMapper;
import com.salesmanager.shop.model.content.ReadableImage;
import com.salesmanager.shop.model.store.EmployerDetailDto;
import com.salesmanager.shop.model.store.MerchantConfigEntity;
import com.salesmanager.shop.model.store.PersistableBrand;
import com.salesmanager.shop.model.store.PersistableMerchantStore;
import com.salesmanager.shop.model.store.ReadableBrand;
import com.salesmanager.shop.model.store.ReadableEmployer;
import com.salesmanager.shop.model.store.ReadableMerchantStore;
import com.salesmanager.shop.model.store.ReadableMerchantStoreList;
import com.salesmanager.shop.populator.store.PersistableMerchantStorePopulator;
import com.salesmanager.shop.populator.store.ReadableMerchantStorePopulator;
import com.salesmanager.shop.store.api.exception.ConversionRuntimeException;
import com.salesmanager.shop.store.api.exception.ResourceNotFoundException;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.utils.ImageFilePath;
import com.salesmanager.shop.utils.LanguageUtils;

@Service("storeFacade")
public class StoreFacadeImpl implements StoreFacade {

	@Inject
	private MerchantStoreService merchantStoreService;

	@Inject
	private MerchantConfigurationService merchantConfigurationService;

	@Inject
	private LanguageService languageService;

	@Inject
	private ContentService contentService;

	@Inject
	private PersistableMerchantStorePopulator persistableMerchantStorePopulator;

	@Inject
	@Qualifier("img")
	private ImageFilePath imageUtils;

	@Inject
	private LanguageUtils languageUtils;

	@Autowired
	private ReadableMerchantStorePopulator readableMerchantStorePopulator;

	@Autowired
	private Employer employerMapper;

	@Autowired
	private EmployerDetailMapper employerDetailMapper;

	private static final Logger LOG = LoggerFactory.getLogger(StoreFacadeImpl.class);

	@Override
	public MerchantStore getByCode(HttpServletRequest request) {
		String code = request.getParameter("store");
		if (StringUtils.isEmpty(code)) {
			code = com.salesmanager.core.business.constants.Constants.DEFAULT_STORE;
		}
		return get(code);
	}

	@Override
	public MerchantStore get(String code) {
		try {
			MerchantStore store = merchantStoreService.getByCode(code);
			return store;
		} catch (ServiceException e) {
			LOG.error("Error while getting MerchantStore", e);
			throw new ServiceRuntimeException(e);
		}

	}

	@Override
	public ReadableMerchantStore getByCode(String code, String lang) {
		Language language = getLanguage(lang);
		return getByCode(code, language);
	}

	@Override
	public ReadableMerchantStore getFullByCode(String code, String lang) {
		Language language = getLanguage(lang);
		return getFullByCode(code, language);
	}

	private Language getLanguage(String lang) {
		return languageUtils.getServiceLanguage(lang);
	}

	@Override
	public ReadableMerchantStore getByCode(String code, Language language) {
		MerchantStore store = getMerchantStoreByCode(code);
		return convertMerchantStoreToReadableMerchantStore(language, store);
	}

	@Override
	public ReadableMerchantStore getFullByCode(String code, Language language) {
		MerchantStore store = getMerchantStoreByCode(code);
		return convertMerchantStoreToReadableMerchantStoreWithFullDetails(language, store);
	}

	@Override
	public boolean existByCode(String code) {
		try {
			return merchantStoreService.getByCode(code) != null;
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}
	}

	private ReadableMerchantStore convertMerchantStoreToReadableMerchantStore(Language language, MerchantStore store) {
		ReadableMerchantStore readable = new ReadableMerchantStore();

		/**
		 * Language is not important for this conversion using default language
		 */
		try {
			readableMerchantStorePopulator.populate(store, readable, store, language);
		} catch (Exception e) {
			throw new ConversionRuntimeException("Error while populating MerchantStore " + e.getMessage());
		}
		return readable;
	}

	private ReadableMerchantStore convertMerchantStoreToReadableMerchantStore(MerchantStore store) {
		ReadableMerchantStore readable = new ReadableMerchantStore();

		/**
		 * Language is not important for this conversion using default language
		 */
		try {
			readableMerchantStorePopulator.populate(store, readable);
		} catch (Exception e) {
			throw new ConversionRuntimeException("Error while populating MerchantStore " + e.getMessage());
		}
		return readable;
	}

	private ReadableMerchantStore convertMerchantStoreToReadableMerchantStoreWithFullDetails(Language language,
			MerchantStore store) {
		ReadableMerchantStore readable = new ReadableMerchantStore();

		/**
		 * Language is not important for this conversion using default language
		 */
		try {
			readableMerchantStorePopulator.populate(store, readable, store, language);
		} catch (Exception e) {
			throw new ConversionRuntimeException("Error while populating MerchantStore " + e.getMessage());
		}
		return readable;
	}

	private MerchantStore getMerchantStoreByCode(String code) {
		return Optional.ofNullable(get(code))
				.orElseThrow(() -> new ResourceNotFoundException("Merchant store code [" + code + "] not found"));
	}

	@Override
	@Transactional
	public void create(PersistableMerchantStore store) {

		Validate.notNull(store, "PersistableMerchantStore must not be null");
		Validate.notNull(store.getCode(), "PersistableMerchantStore.code must not be null");

		// check if store code exists
		MerchantStore storeForCheck = get(store.getCode());
		if (storeForCheck != null) {
			throw new ServiceRuntimeException("MerhantStore " + store.getCode() + " already exists");
		}

		MerchantStore mStore = convertPersistableMerchantStoreToMerchantStore(store, languageService.defaultLanguage());
		createMerchantStore(mStore);

	}

	private void createMerchantStore(MerchantStore mStore) {
		try {
			merchantStoreService.saveOrUpdate(mStore);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}
	}

	private MerchantStore convertPersistableMerchantStoreToMerchantStore(PersistableMerchantStore store,
			Language language) {
		MerchantStore mStore = new MerchantStore();

		// set default values
		mStore.setWeightunitcode(MeasureUnit.KG.name());
		mStore.setSeizeunitcode(MeasureUnit.IN.name());

		try {
			mStore = persistableMerchantStorePopulator.populate(store, mStore, language);
		} catch (ConversionException e) {
			throw new ConversionRuntimeException(e);
		}
		return mStore;
	}

	@Override
	public void update(PersistableMerchantStore store) {

		Validate.notNull(store);

		MerchantStore mStore = mergePersistableMerchantStoreToMerchantStore(store, store.getCode(),
				languageService.defaultLanguage());

		updateMerchantStore(mStore);

	}

	private void updateMerchantStore(MerchantStore mStore) {
		try {
			merchantStoreService.update(mStore);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}

	}

	private MerchantStore mergePersistableMerchantStoreToMerchantStore(PersistableMerchantStore store, String code,
			Language language) {

		MerchantStore mStore = getMerchantStoreByCode(code);

		store.setId(mStore.getId());

		try {
			mStore = persistableMerchantStorePopulator.populate(store, mStore, language);
		} catch (ConversionException e) {
			throw new ConversionRuntimeException(e);
		}
		return mStore;
	}

	@Override
	public ReadableMerchantStoreList getByCriteria(MerchantStoreCriteria criteria, Language lang) {
		return getMerchantStoresByCriteria(criteria, lang);

	}

	private ReadableMerchantStoreList getMerchantStoresByCriteria(MerchantStoreCriteria criteria, Language language) {
		try {
			GenericEntityList<MerchantStore> stores = Optional.ofNullable(merchantStoreService.getByCriteria(criteria))
					.orElseThrow(() -> new ResourceNotFoundException("Criteria did not match any store"));

			ReadableMerchantStoreList storeList = new ReadableMerchantStoreList();
			storeList.setData((List<ReadableMerchantStore>) stores.getList().stream()
					.map(s -> convertMerchantStoreToReadableMerchantStore(language, s)).collect(Collectors.toList()));
			storeList.setTotalPages(stores.getTotalPages());
			storeList.setRecordsTotal(stores.getTotalCount());
			storeList.setNumber(stores.getList().size());

			return storeList;

		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}

	}

	@Override
	public void delete(String code) {

		if (MerchantStore.DEFAULT_STORE.equals(code.toUpperCase())) {
			throw new ServiceRuntimeException("Cannot remove default store");
		}

		MerchantStore mStore = getMerchantStoreByCode(code);

		try {
			merchantStoreService.delete(mStore);
		} catch (Exception e) {
			LOG.error("Error while deleting MerchantStore", e);
			throw new ServiceRuntimeException("Error while deleting MerchantStore " + e.getMessage());
		}

	}

	@Override
	public ReadableBrand getBrand(String code) {
		MerchantStore mStore = getMerchantStoreByCode(code);

		ReadableBrand readableBrand = new ReadableBrand();
//		Long add some lines here(17/6/2023)
//		if (!StringUtils.isEmpty(mStore.getStoreLogo())) {
//			String imagePath = imageUtils.buildStoreLogoFilePath(mStore);
//			ReadableImage image = createReadableImage(mStore.getStoreLogo(), imagePath);
//			readableBrand.setLogo(image);
//		}
//		List<MerchantConfigEntity> merchantConfigTOs = getMerchantConfigEntities(mStore);
//		readableBrand.getSocialNetworks().addAll(merchantConfigTOs);
//		end
		return readableBrand;
	}

	private List<MerchantConfigEntity> getMerchantConfigEntities(MerchantStore mStore) {
		List<MerchantConfiguration> configurations = getMergeConfigurationsByStore(MerchantConfigurationType.SOCIAL,
				mStore);

		return configurations.stream().map(config -> convertToMerchantConfigEntity(config))
				.collect(Collectors.toList());
	}

	private List<MerchantConfiguration> getMergeConfigurationsByStore(MerchantConfigurationType configurationType,
			MerchantStore mStore) {
		try {
			return merchantConfigurationService.listByType(configurationType, mStore);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException("Error wile getting merchantConfigurations " + e.getMessage());
		}
	}

	private MerchantConfigEntity convertToMerchantConfigEntity(MerchantConfiguration config) {
		MerchantConfigEntity configTO = new MerchantConfigEntity();
		configTO.setId(config.getId());
		configTO.setKey(config.getKey());
		configTO.setType(config.getMerchantConfigurationType());
		configTO.setValue(config.getValue());
		configTO.setActive(config.getActive() != null ? config.getActive().booleanValue() : false);
		return configTO;
	}

	private MerchantConfiguration convertToMerchantConfiguration(MerchantConfigEntity config,
			MerchantConfigurationType configurationType) {
		MerchantConfiguration configTO = new MerchantConfiguration();
		configTO.setId(config.getId());
		configTO.setKey(config.getKey());
		configTO.setMerchantConfigurationType(configurationType);
		configTO.setValue(config.getValue());
		configTO.setActive(new Boolean(config.isActive()));
		return configTO;
	}

	private ReadableImage createReadableImage(String storeLogo, String imagePath) {
		ReadableImage image = new ReadableImage();
		image.setName(storeLogo);
		image.setPath(imagePath);
		return image;
	}

	@Override
	public void deleteLogo(String code) {
		MerchantStore store = getByCode(code);
//		String image = store.getStoreLogo();
		store.setStoreLogo(null);

		updateMerchantStore(store);

//		Long hide some lines here(17/6/2023)
//		try {
//			if (!StringUtils.isEmpty(image)) {
//				contentService.removeFile(store.getCode(), image);
//			}
//		} catch (ServiceException e) {
//			throw new ServiceRuntimeException(e.getMessage());
//		}
//		end
	}

	@Override
	public MerchantStore getByCode(String code) {
		return getMerchantStoreByCode(code);
	}

	@Override
	public void addStoreLogo(String code, InputContentFile cmsContentImage) {
		MerchantStore store = getByCode(code);
//		Long hide some lines here(17/6/2023)
//		store.setStoreLogo(cmsContentImage.getFileName());
//		end
		saveMerchantStore(store);
		addLogoToStore(code, cmsContentImage);
	}

	private void addLogoToStore(String code, InputContentFile cmsContentImage) {
		try {
			contentService.addLogo(code, cmsContentImage);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}
	}

	private void saveMerchantStore(MerchantStore store) {
		try {
			merchantStoreService.save(store);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}

	}

	@Override
	public void createBrand(String merchantStoreCode, PersistableBrand brand) {
		MerchantStore mStore = getMerchantStoreByCode(merchantStoreCode);

		List<MerchantConfigEntity> createdConfigs = brand.getSocialNetworks();

		List<MerchantConfiguration> configurations = createdConfigs.stream()
				.map(config -> convertToMerchantConfiguration(config, MerchantConfigurationType.SOCIAL))
				.collect(Collectors.toList());
		try {
			for (MerchantConfiguration mConfigs : configurations) {
				mConfigs.setMerchantStore(mStore);
				if (!StringUtils.isEmpty(mConfigs.getValue())) {
					mConfigs.setMerchantConfigurationType(MerchantConfigurationType.SOCIAL);
					merchantConfigurationService.saveOrUpdate(mConfigs);
				} else {// remove if submited blank and exists
					MerchantConfiguration config = merchantConfigurationService
							.getMerchantConfiguration(mConfigs.getKey(), mStore);
					if (config != null) {
						merchantConfigurationService.delete(config);
					}
				}
			}
		} catch (ServiceException se) {
			throw new ServiceRuntimeException(se);
		}

	}

	@Override
	public ReadableMerchantStoreList getChildStores(Language language, String code, int page, int count) {
		try {

			// first check if store is retailer
			MerchantStore retailer = this.getByCode(code);
			if (retailer == null) {
				throw new ResourceNotFoundException("Merchant [" + code + "] not found");
			}

			if (retailer.isRetailer() == null || !retailer.isRetailer().booleanValue()) {
				throw new ResourceNotFoundException("Merchant [" + code + "] not a retailer");
			}

			Page<MerchantStore> children = merchantStoreService.listChildren(code, page, count);
			List<ReadableMerchantStore> readableStores = new ArrayList<ReadableMerchantStore>();
			ReadableMerchantStoreList readableList = new ReadableMerchantStoreList();
			if (!CollectionUtils.isEmpty(children.getContent())) {
				for (MerchantStore store : children)
					readableStores.add(convertMerchantStoreToReadableMerchantStore(language, store));
			}
			readableList.setData(readableStores);
			readableList.setRecordsFiltered(children.getSize());
			readableList.setTotalPages(children.getTotalPages());
			readableList.setRecordsTotal(children.getTotalElements());
			readableList.setNumber(children.getNumber());

			return readableList;

			/*
			 * List<MerchantStore> children = merchantStoreService.listChildren(code);
			 * List<ReadableMerchantStore> readableStores = new
			 * ArrayList<ReadableMerchantStore>(); if (!CollectionUtils.isEmpty(children)) {
			 * for (MerchantStore store : children)
			 * readableStores.add(convertMerchantStoreToReadableMerchantStore(language,
			 * store)); } return readableStores;
			 */
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}

	}

	@Override
	public ReadableMerchantStoreList findAll(MerchantStoreCriteria criteria, Language language, int page, int count) {

		try {
			Page<MerchantStore> stores = null;
			List<ReadableMerchantStore> readableStores = new ArrayList<ReadableMerchantStore>();
			ReadableMerchantStoreList readableList = new ReadableMerchantStoreList();

			Optional<String> code = Optional.ofNullable(criteria.getStoreCode());
			Optional<String> name = Optional.ofNullable(criteria.getName());
			if (code.isPresent()) {

				stores = merchantStoreService.listByGroup(name, code.get(), page, count);

			} else {
				if (criteria.isRetailers()) {
					stores = merchantStoreService.listAllRetailers(name, page, count);
				} else {
					stores = merchantStoreService.listAll(name, page, count);
				}
			}

			if (!CollectionUtils.isEmpty(stores.getContent())) {
				for (MerchantStore store : stores)
					readableStores.add(convertMerchantStoreToReadableMerchantStore(language, store));
			}
			readableList.setData(readableStores);
			readableList.setRecordsTotal(stores.getTotalElements());
			readableList.setTotalPages(stores.getTotalPages());
			readableList.setNumber(stores.getSize());
			readableList.setRecordsFiltered(stores.getSize());
			return readableList;

		} catch (ServiceException e) {
			throw new ServiceRuntimeException("Error while finding all merchant", e);
		}

	}

	private ReadableMerchantStore convertStoreName(MerchantStore store) {
		ReadableMerchantStore convert = new ReadableMerchantStore();
		convert.setId(store.getId());
		convert.setCode(store.getCode());
		convert.setName(store.getStorename());
		return convert;
	}

	@Override
	public List<ReadableMerchantStore> getMerchantStoreNames(MerchantStoreCriteria criteria) {
		Validate.notNull(criteria, "MerchantStoreCriteria must not be null");

		try {

			List<ReadableMerchantStore> stores = null;
			Optional<String> code = Optional.ofNullable(criteria.getStoreCode());

			// TODO Pageable
			if (code.isPresent()) {

				stores = merchantStoreService.findAllStoreNames(code.get()).stream().map(s -> convertStoreName(s))
						.collect(Collectors.toList());
			} else {
				stores = merchantStoreService.findAllStoreNames().stream().map(s -> convertStoreName(s))
						.collect(Collectors.toList());
			}

			return stores;
		} catch (ServiceException e) {
			throw new ServiceRuntimeException("Exception while getting store name", e);
		}

	}

	@Override
	public List<Language> supportedLanguages(MerchantStore store) {

		Validate.notNull(store, "MerchantStore cannot be null");
		Validate.notNull(store.getClass(), "MerchantStore code cannot be null");

		if (!CollectionUtils.isEmpty(store.getLanguages())) {
			return store.getLanguages();
		}

		// refresh
		try {
			store = merchantStoreService.getByCode(store.getCode());
		} catch (ServiceException e) {
			throw new ServiceRuntimeException("An exception occured when getting store [" + store.getCode() + "]");
		}

		if (store != null) {
			return store.getLanguages();
		}

		return Collections.emptyList();
	}

	private final String DES_FOLDER = "D:\\store\\images";

	@Override
	public void addStoreLogo(String storeCode, MultipartFile file) {
//		MerchantStore store = getByCode(storeCode);
//		store.setStoreLogo(file.getOriginalFilename());
//		File f = new File(DES_FOLDER+"\\"+ storeCode);
//		if(!f.exists()) {
//			f.mkdir();
//		}
//		File f2 = new File(DES_FOLDER+"\\"+ storeCode+"\\"+file.getOriginalFilename());
//		try {
//			file.transferTo(f2);
//		} catch (IllegalStateException | IOException e) {
//			LOG.info("Save logo for store "+storeCode+" failded");
//			e.printStackTrace();
//		}
//		try {
//			merchantStoreService.save(store);
//		} catch (ServiceException e1) {
//			e1.printStackTrace();
//		}
		MerchantStore store;
		try {
			store = merchantStoreService.getByCode(storeCode);
			store.setStoreLogo(file.getBytes());
			merchantStoreService.save(store);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public byte[] getStoreLogo(String code) {
		MerchantStore store = getByCode(code);
		byte[] images = store.getStoreLogo();

//		Long hide some lines here(17/6/2023)
//		try {
//			images = Files
//					.readAllBytes(new File(DES_FOLDER + "\\" + store.getCode() + "\\" + store.getStoreLogo()).toPath());
//		} catch (IOException e) {
//			LOG.info("Read logo for store " + store.getCode() + " failded");
//			e.printStackTrace();
//		}
//		end
		return images;
	}

	@Override
	public List<ReadableEmployer> topEmployer() {
		return merchantStoreService.topEmployer().stream().map(item -> employerMapper.convertToDto(item))
				.collect(Collectors.toList());
	}

	@Override
	public EmployerDetailDto getDetailEmployer(String code) {
		MerchantStore employer = null;
		try {
			employer = merchantStoreService.getByCode(code);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return employerDetailMapper.convertToDTO(employer);
	}

	@Override
	public byte[] getBackground(String code) {
		return merchantStoreService.getBackground(code);
	}

	@Override
	public String edtitEmployer(String storeCode, EmployerDetailDto employerDetailDto) {
		MerchantStore employer = employerDetailMapper.convertToEntity(storeCode, employerDetailDto);
		try {
			merchantStoreService.save(employer);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "Update fail";
		}
		return "Update success";
	}

	@Override
	public void addBackground(String code, MultipartFile cmsContentImage) {
		MerchantStore store;
		try {
			store = merchantStoreService.getByCode(code);
			store.setBackGround(cmsContentImage.getBytes());
			merchantStoreService.save(store);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ReadableMerchantStoreList findAll(Integer page, Integer count, Map<String, String> map) {
		Page<MerchantStore> stores = null;
		List<ReadableMerchantStore> readableStores = new ArrayList<ReadableMerchantStore>();
		ReadableMerchantStoreList readableList = new ReadableMerchantStoreList();

		stores = merchantStoreService.findAll(page, count, map);

		if (!CollectionUtils.isEmpty(stores.getContent())) {
			for (MerchantStore store : stores)
				readableStores.add(convertMerchantStoreToReadableMerchantStore(store));
		}
		readableList.setData(readableStores);
		readableList.setRecordsTotal(stores.getTotalElements());
		readableList.setTotalPages(stores.getTotalPages());
		readableList.setNumber(stores.getSize());
		readableList.setRecordsFiltered(stores.getSize());
		return readableList;
	}

}