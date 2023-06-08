package com.salesmanager.shop.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConverterDate {

	public static Date convertToDate(String dateString) {
		DateFormat dateFormat = new SimpleDateFormat("DD/MM/YYYY");
		try {
			return dateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
