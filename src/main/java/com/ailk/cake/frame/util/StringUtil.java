package com.ailk.cake.frame.util;

import java.text.MessageFormat;

/**
 * �ļ�����StringUtil.java
 * ���ߣ����·���zhangxf@asiainfo-linkage.com��
 * ����ʱ�䣺2013-01-30
 * ����ģ�飺�����������
 * ����������ʵ���ַ����Ĵ���
 *
 */
public class StringUtil {
	
	
	public  static String   replace(String sourceString,String ... replaceString) {
		String  resultString  = "";
		MessageFormat  messageFormat = new MessageFormat(sourceString);
		resultString = messageFormat.format(replaceString);
		 return resultString;
	}
	
	
	public static boolean isBlank(String str)
	{
		if(str == null || "".equals(str))
			return true;
		else 
			return false;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String  ss =  "����{0},���̿ռ�ʹ�ôﵽ{1}%!!!!";
		String IP = "132.35.77.29";
		String VALUE = "90";
		String[] testArgs = {IP,VALUE};
		System.out.println(replace(ss,testArgs));

	}

}
