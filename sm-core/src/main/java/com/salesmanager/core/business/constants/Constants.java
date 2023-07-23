package com.salesmanager.core.business.constants;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Currency;
import java.util.Locale;

/**
 * Constants used for sm-core
 * 
 * @author carlsamson
 *
 */
public class Constants {

  public static final Charset ISO_8859_1 = StandardCharsets.ISO_8859_1;
  public static final Charset UTF_8 = StandardCharsets.UTF_8;

  public final static String TEST_ENVIRONMENT = "TEST";
  public final static String PRODUCTION_ENVIRONMENT = "PROD";
  public final static String SHOP_URI = "/shop";

  public static final String ALL_REGIONS = "*";


  public final static String DEFAULT_DATE_FORMAT = "yyyy-MM-dd";
  public final static String DEFAULT_DATE_FORMAT_YEAR = "yyyy";
  public final static String DEFAULT_LANGUAGE = "en";
  public final static String DEFAULT_COUNTRY = "CA";

  public final static String EMAIL_CONFIG = "EMAIL_CONFIG";

  public final static String UNDERSCORE = "_";
  public final static String WHITE_SPACE=" ";
  public final static String SPLIT=",";
  public final static String SLASH = "/";
  public final static String TRUE = "true";
  public final static String FALSE = "false";
  public final static String OT_ITEM_PRICE_MODULE_CODE = "itemprice";
  public final static String OT_SUBTOTAL_MODULE_CODE = "subtotal";
  public final static String OT_TOTAL_MODULE_CODE = "total";
  public final static String OT_SHIPPING_MODULE_CODE = "shipping";
  public final static String OT_HANDLING_MODULE_CODE = "handling";
  public final static String OT_TAX_MODULE_CODE = "tax";
  public final static String OT_REFUND_MODULE_CODE = "refund";
  public final static String OT_DISCOUNT_TITLE = "order.total.discount";

  public final static String DEFAULT_STORE = "DEFAULT";

  public final static Locale DEFAULT_LOCALE = Locale.US;
  public final static Currency DEFAULT_CURRENCY = Currency.getInstance(Locale.US);
  
  public final static String PAYMENT_MODULES = "PAYMENT";
  
//  Long add some lines here(21/5/2023)
  public final static String FOLDER_STORE_ROOT="D:\\store";
  public final static String FOLDER_STORE_IMAGE="\\images";
//  end

	// Long add some lines here(11/6/2023)
	public final static String APPLY_SUCCESS="Apply success";
	public final static String APPLY_FAILED="Apply failded";
	public final static String CHANGE_STATUS_SUCCESS="Change statis success";
	public final static String CHANGE_STATUS_FAIL="Change statis fail";
	public final static String APPLY_DUPLICATE="Can not apply because alumnus was applied";
	public final static String CAN_NOT_FOUND_JOB_WHEN_FIND_RECRUITMENT_BY_JOB="Can not found job when find recruitment by job";
	public final static String CAN_NOT_FOUND_ALUMNUS_WHEN_FIND_RECRUITMENT_BY_ALUMNUS="Can not found job when find recruitment by alumnus";
	//end

	//filter
	public static final String FILTER_BY_LASTEST="lastest";
	public static final String FILTER_BY_UPDATE="update";
	public static final String FILTER_BY_SALARY="salary";
}
