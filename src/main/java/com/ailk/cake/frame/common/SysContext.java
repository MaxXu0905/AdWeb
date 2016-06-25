package com.ailk.cake.frame.common;

import org.springframework.context.ApplicationContext;

/**
 * �ļ�����SysContext.java
 * ���ߣ����·���zhangxf@asiainfo-linkage.com��
 * �������ڣ�2013-01-23
 * ����������ǰ��action���û�ȡspring�����bean,ʵ�������
 *
 */

public class SysContext {
	
	private static ApplicationContext ctx = null;
	
	private static String contextPath;
	
	public static Object getBean(String objName)
	{	
		return ctx.getBean(objName);
	}

	public static String getContextPath() {
		return contextPath;
	}

	public static void setContextPath(String contextPath) {
		SysContext.contextPath = contextPath;
	}

	public static void setCtx(ApplicationContext ctx) {
		SysContext.ctx = ctx;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
