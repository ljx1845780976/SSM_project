package com.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 **/
public class DateUtils {
    //日期转字符
    public static String dateToSting(Date date,String patt){
        SimpleDateFormat sdf=new SimpleDateFormat(patt);
        String format=sdf.format(date);
        return format;
    }
    //字符转日期
    public static Date stringToDate(String str,String patt) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat(patt);
        Date parse=sdf.parse(str);
        return parse;
    }

    }
