package com.ailk.cake.frame.common;

import java.net.MalformedURLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * �Լ�ʵ��һ���򵥵�Singleton����չContextLoaderListener�࣬��Webϵͳ����ʱѹ��Singleton��
 * �µ�ContextLoaderListener���������£�ContextUtil�а���һ����̬��ApplicationContext������   
 * @author ���·�
 * @date   2013-01-20
 */
public class ContextLoaderListener extends
		org.springframework.web.context.ContextLoaderListener {
	
	private static Logger logger = LoggerFactory.getLogger(ContextLoaderListener.class);
	
	/* (non-Javadoc)
	 * @see org.springframework.web.context.ContextLoaderListener#contextInitialized(javax.servlet.ServletContextEvent)
	 */

	public void contextInitialized(ServletContextEvent event) {
		
		// TODO Auto-generated method stub
		super.contextInitialized(event);
		ServletContext context = event.getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
				
		//����Զ���ContextLoaderListenerʹ�õĹ�����
		//װ��ctx
		SysContext.setCtx(ctx);		
		try {
			String path = context.getResource("/").getPath();
			String contextPath = path.substring(0, path.lastIndexOf("/"));
			contextPath = contextPath.substring(contextPath.lastIndexOf("/"));
			SysContext.setContextPath(contextPath);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		logger.info("spring����װ�����!");
		
		//SysStaticParam.init();
		
		
	}

}
