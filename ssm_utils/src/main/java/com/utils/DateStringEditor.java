package com.utils;

import org.springframework.beans.propertyeditors.PropertiesEditor;
import org.springframework.lang.Nullable;

import java.text.ParseException;
import java.util.Date;
import java.util.Properties;

/**
 *
 **/
public class DateStringEditor extends PropertiesEditor {
    @Override
    public void setAsText(@Nullable  String text) throws IllegalArgumentException {
         try {
             Date date=DateUtils.stringToDate(text,"yyyy-mm-dd HH:mm");
             super.setValue(date);
         }catch (ParseException e){
             e.printStackTrace();
         }
    }
}
