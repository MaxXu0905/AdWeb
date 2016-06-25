package com.ailk.cake.frame.cache.redis;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializeUtil {
	
	/**
	 * �ļ�����SerializeUtil.java
	 * ���ߣ����·���zhangxf@asiainfo-linkage.com��
	 * ����ʱ�䣺2013-03-12
	 * ����������ʵ�ֶ�������л��뷴���л����洢������洢��redis������
	 */
	
	/**
	 * �Զ������л�
	 * @param object
	 * @return
	 */
	public static byte[] serialize(Object object) {
		
		ObjectOutputStream oos = null;
		
		ByteArrayOutputStream baos = null;
		
		try {
		//���л�
		baos = new ByteArrayOutputStream();
		
		oos = new ObjectOutputStream(baos);
		
		oos.writeObject(object);
		
		byte[] bytes = baos.toByteArray();
		
		return bytes;
		
		} catch (Exception e) {
			
		}
		
		return null;
	}
	 
	/**
	 * �����л��õ�����
	 * @param bytes
	 * @return
	 */
	public static Object unserialize(byte[] bytes) {
		
		ByteArrayInputStream bais = null;
		
		try {
			
		//�����л�
		bais = new ByteArrayInputStream(bytes);
		
		ObjectInputStream ois = new ObjectInputStream(bais);
		
		return ois.readObject();
		
		} catch (Exception e) {
			
		}
		
		return null;
	}

}
