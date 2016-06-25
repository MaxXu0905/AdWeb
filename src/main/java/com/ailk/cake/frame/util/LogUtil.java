package com.ailk.cake.frame.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.StringWriter;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * �ļ�����LogUtil.java
 * ���ߣ����·���zhangxf@asiainfo-linkage.com��s
 * �������ڣ�2013-01-22
 * ��������־��Ϣ��¼�ķ�װ��
 * �޸���ʷ��
 *          ���                     ����                            �޸�ʱ��                                       �޸�����
 *           1
 *           2
 *
 */
public class LogUtil {
	
	private  static final  Logger logger = LoggerFactory.getLogger(LogUtil.class); 
	
	
	
	/**
	 * ���ߣ����·���zhangxf@asiainfo-linkage.com��
	 * �������ڣ�2013-01-22
	 * ������
	 *       @param e   �쳣��Ϣ����
	 *       @param t   �����쳣�Ķ���
	 * �޸���ʷ��
	 *         ���                     ����                                 �޸�ʱ��                             �޸�����
	 *         1
	 *         2
	 */
	public  static <T> void  loggerError(Exception e,T t) {
		  StringBuilder  builder = new StringBuilder();
		  builder.append(t.getClass().getName() + "\n");
		  int size = e.getStackTrace().length;
		  for(int i = 0; i < size;i++) {
			 builder.append(" " + e.getStackTrace()[i].getClassName() + " " + e.getStackTrace()[i].getMethodName() + "( " + e.getStackTrace()[i].getFileName() +" " + e.getStackTrace()[i].getLineNumber()+")\n");
		  }
		  logger.error(builder.toString());
		  builder.setLength(0);
		  builder = null;
	}
	
	
	
	/**
	 * �������ڣ�2013-03-23
	 * ���ߣ����·�[zhangxf3@asiainfo-linkage.com]
	 * ��������:��XML�ַ���ת��Ϊ��׼��ʽ���������
	 * 
	 * @param str
	 * @return
	 */
	 public static String strChangeToXML(String str) { 
		   String treeXML = "";
		   try{
			    SAXReader saxReader = new SAXReader(); 
			    Document document = null; 
			    try { 
			      document = saxReader.read(new ByteArrayInputStream(str.getBytes())); 
			    } catch (DocumentException e) { 
			      e.printStackTrace(); 
			    } 
			    StringWriter writer = new StringWriter(); 
			    OutputFormat format = OutputFormat.createPrettyPrint(); 
			    format.setEncoding("GBK"); 
			    XMLWriter xmlwriter = new XMLWriter(writer, format); 
			    try { 
			      xmlwriter.write(document); 
			    } catch (IOException e) { 
			      
			    } 
			    treeXML = writer.toString();
		   }catch(Exception e) {
			   
			   logger.error( "ת��XML�ַ�����ʽ��ʱ������쳣��������쳣��Ϣ�ǣ�" + e);
			   
		   }
		 return treeXML;
		  } 
	
	
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
