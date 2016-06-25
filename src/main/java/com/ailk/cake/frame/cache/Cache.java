package com.ailk.cake.frame.cache;

import java.util.List;

/**
 * �ļ�����Cache.java
 * ���ߣ����·���zhangxf@asiainfo-linkage.com��
 * ����ʱ�䣺2013-03-12
 * ������
 *      ͳһ����ӿ�
 * �޸���ʷ��
 *         ���                      ����                             �޸�ʱ��                                ����
 *         1
 *         2
 *
 */

public interface Cache {
	
	 /**  

     * �ӻ����л�ȡĳ���ض��Ķ���

     * @param key  

     * @return the cached object or <tt>null</tt>  

     * @throws CacheException  

     */ 

    public Object get(Object key) throws CacheException;  

       

    /**  

     * ����������󵽻�����

     * @param key  

     * @param value  

     * @throws CacheException  

     */ 

    public void put(Object key, Object value) throws CacheException;  

       

    /**  

     * ���»����е�ĳ������

     * @param key  

     * @param value  

     * @throws CacheException  

     */ 

    public void update(Object key, Object value) throws CacheException;  


    /**
     * ��ȡ�����д洢�����е�KEY
     * RedisCache��ʱ��֧��
     * @return
     * @throws CacheException
     */
    @SuppressWarnings("rawtypes")  

    public List keys() throws CacheException ;  

       

    /**  

     * �ӻ��������ĳ���ض��Ķ���

     */ 

    public void remove(Object key) throws CacheException;  
    
    
    
       
    /**  

     * ��ջ���

     */ 

    public void clear() throws CacheException;  

       

    /**  

     * Clean up  

     */ 

    public void destroy() throws CacheException;  
    
    /**
     * �ж��Ƿ����ĳ��KEY
     * @param key
     * @return
     * @throws CacheException
     */
    
    public boolean  exists(Object key) throws  CacheException;
    
    /**
     * ��key��һ��ʧЧʱ��
     * @param key
     * @param  seconds ��
     * @return
     */
    public  boolean   expire(Object key,int seconds) throws CacheException;


}
