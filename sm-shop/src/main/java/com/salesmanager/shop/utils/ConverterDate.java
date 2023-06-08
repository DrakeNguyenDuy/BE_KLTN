package com.salesmanager.shop.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class ConverterDate {

	public static Date convertToDate(String dateString) {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			return dateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static String convertDateToString(String d) {
        String inputPattern = "EEE MMM dd HH:mm:ss zzz yyyy";
        String outputPattern = "dd/MM/yyyy";
        SimpleDateFormat inputFormat = new SimpleDateFormat(inputPattern, Locale.ENGLISH);
        SimpleDateFormat outputFormat = new SimpleDateFormat(outputPattern);

        try {
            Date date = inputFormat.parse(d);
            String formattedDate = outputFormat.format(date);
            return formattedDate;
        } catch (ParseException e) {
            return "";
            
        }
	}
}
