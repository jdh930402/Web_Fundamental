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
	
	public static String getKoreanDate(String date) { //Aug 05, 2019 // 2019년 08월 05일
		String koreanDate = null;
		SimpleDateFormat from = new SimpleDateFormat("MMM dd, yyyy",Locale.US);
		SimpleDateFormat to = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date d = from.parse(date); // date => Aug 05, 2019
			koreanDate = to.format(d);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return koreanDate;// 2019-08-05, 타입을 마음대로 지정가능
	}
}
