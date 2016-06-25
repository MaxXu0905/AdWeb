package com.ailk.cake.frame.cache;  

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ailk.cake.frame.cache.redis.RedisCacheProvider;




 /**  

  * ��������  

  * @author Winter Lau  

  */ 

 public class CacheManager {  

     private final static Logger log = LoggerFactory.getLogger(CacheManager.class);

     private static CacheProvider provider;  

     static {  

         initCacheProvider("com.asiainfo.cloud.frame.cache.redis.RedisCacheProvider");  

     }  

        

     private static void initCacheProvider(String prv_name){  

         try{  

             CacheManager.provider = (CacheProvider)Class.forName(prv_name).newInstance();  

             CacheManager.provider.start();  

             log.info("Using CacheProvider : " + provider.getClass().getName());  

         }catch(Exception e){  

             log.error("Unabled to initialize cache provider:" + prv_name + ", using ehcache default.", e);  

             CacheManager.provider = new RedisCacheProvider();  

         }  

     }  

    

     private final static Cache _GetCache(String cache_name, boolean autoCreate) {  

         if(provider == null){  

             provider = new RedisCacheProvider();  

         }  

         return provider.buildCache(cache_name, autoCreate);  

     }  

    

     /**  

      * ��ȡ�����е�����  

      * @param name  

      * @param key  

      * @return  

      */ 

     public final static Object get(String name, String key){  

         //System.out.println("GET1 => " + name+":"+key);  

         if(name!=null && key != null)  

             return _GetCache(name, true).get(key);  

         return null;  

     }  
     
     /**  

      * ��ȡ�����е�����  

      * @param name  

      * @return  

      */ 

     public final static List getByName(String name){  

    	 List list = new ArrayList<Object>();
         if(name!=null)  
         {
        	 Cache cache = _GetCache(name, true);
        	 List<String> keys = cache.keys();
        	 if(keys == null)
        		 return null;
        	 else
        	 {
        		 for(int i=0;i<keys.size();i++)
        		 {
        			 Object obj = cache.get(keys.get(i));
        			 if(obj != null)
        				 list.add(obj);
        		 }
        	 }
         }

         return null;  

     }  
        

     /**  

      * ��ȡ�����е�����  

      * @param <T>  

      * @param resultClass  

      * @param name  

      * @param key  

      * @return  

      */ 

     @SuppressWarnings("unchecked")  

     public final static <T> T get(Class<T> resultClass, String name, Serializable key){  

         //System.out.println("GET2 => " + name+":"+key);  

         if(name!=null && key != null)  

             return (T)_GetCache(name, true).get(key);  

         return null;  

     }  


     /**  

      * д�뻺��  

      * @param name  

      * @param key  

      * @param value  

      */ 

     public final static void set(String name, String key, Object value){  

         //System.out.println("SET => " + name+":"+key+"="+value);  

         if(name!=null && key != null && value!=null)  

             _GetCache(name, true).put(key, value);        

     }  

     /**  

      * ��������е�ĳ������  

      * @param name  

      * @param key  

      */ 

     public final static void evict(String name, String key){  

         if(name!=null && key != null)  

             _GetCache(name, true).remove(key);        

     }  

    

     /**  

      * ��������е�ĳ������  

      * @param name  

      * @param key  

      */ 

     public final static void justEvict(String name, Serializable key){  

         if(name!=null && key != null){  

             Cache cache = _GetCache(name, false);  

             if(cache != null)  

                 cache.remove(key);  

         }  

     }
     
     /**
      * Ϊ����ָ��ʧЧ����ʱ��
      * @param name
      * @param key
      */
    public final  static void  expire(String name, String key){
    	 
    	 if(name != null &&  key != null ) {
    		 
    		 _GetCache(name,true).expire(key, 3000);
    		 
    	 }
     };
     
     public static void main(String[] args) {
 		String cacheName="testCache"; 
 		 String key="key"; 
 		 String value="oschina"; 
 		 //set(cacheName, key, value); 
 		 String gValue = (String)get(cacheName, key);//A 
 		 if(gValue!=null){ 
 		 System.out.println("��ȡ����ɹ���"+gValue); 
 		 }else{ 
 		 System.out.println("��ȡ����Ϊ�գ����û���"); 
 		 set(cacheName, key, value); 
 		 System.out.println("���û���֮���ȡ���棺"+(String)get(cacheName, key)); 
 	}
	 
}

    

 } 
