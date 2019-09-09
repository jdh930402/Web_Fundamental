package kr.co.kic.dev1.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Utility {
	
	public static String getConvert(String msg) {
		return msg.replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>");
	}
	
	public static String getDate(Calendar calendar, String pattern) {
		return new SimpleDateFormat(pattern).format(calendar.getTime());
	}
}
