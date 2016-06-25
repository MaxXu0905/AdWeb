package com.ailk.cake.frame.cache.redis;


import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import com.ailk.cake.frame.cache.Cache;
import com.ailk.cake.frame.cache.CacheException;
import com.ailk.cake.frame.cache.CacheProvider;
import com.ailk.cake.frame.util.Constants;
import com.ailk.cake.frame.util.LogUtil;



/**
 * �ļ�����RedisCacheProvider.java
 * ���ߣ����·���zhangxf@asiainfo-linkage.com��
 * �������ڣ�2013-03-12
 * ������RedisCache���ṩʵ����
 *
 */
public class RedisCacheProvider implements CacheProvider {
	
	
	private static final Logger logger = LoggerFactory.getLogger(RedisCacheProvider.class);
	
	private static JedisPool  jedisPool;
	
	private  Properties  prop;
	

	/**
	 * ����redis���ӳ�,������һ�����õ�����
	 */
	public   Cache buildCache(String regionName, boolean autoCreate)
			throws CacheException {
		
		if(regionName == null || "".equals(regionName)) {
			
			throw  new  CacheException("��������(regionName)����Ϊ��!");
			
		}
		
		synchronized(this) {
			
			if(prop == null) {
				loadProperties();
			}

			if(jedisPool == null) {
				
				 logger.info("====================��ʼ����redis���ӳ�====================");
				 
				 JedisPoolConfig config = new JedisPoolConfig();
				 
			     config.setMaxActive(prop.getProperty("redis.maxActive") != null?Integer.parseInt(prop.getProperty("redis.maxActive")):20);
			     
			     config.setMaxIdle(prop.getProperty("redis.maxIdle") != null?Integer.parseInt(prop.getProperty("redis.maxIdle")):5);
			     
			     config.setMaxWait(prop.getProperty("redis.maxWait") != null?Integer.parseInt(prop.getProperty("redis.maxWait")):1000);
			     
			     config.setTestOnBorrow(false);
			     
			     try{
			    	 
			    	 this.jedisPool = new JedisPool(config, prop.getProperty("redis.ip"), Integer.parseInt(prop.getProperty("redis.port")));
			    	 
			     }catch(Exception e) {
			    	 
			    	 LogUtil.loggerError(e, this);
			    	 
			    	 throw  new  CacheException("����Redis���ӳ�ʧ��!");
			     }
			     
			     logger.info("====================redis���ӳش������====================");
			     
		   }
		}
		
		Jedis jedis = jedisPool.getResource();
		
		return new RedisCache(jedis,regionName);
	}

	public void start() throws CacheException {
		
		logger.info("��ȡRedis���ӳص������ļ� Start!");
		
		loadProperties();
	    
		logger.info("��ȡRedis���ӳص������ļ� End!");

	}

	public void stop() {
		
		logger.info("�Ͽ���Redis�����ӳؿ�ʼ!");
		
		if(jedisPool != null) {
			
			jedisPool.destroy();
			
		}
		
		logger.info("�Ͽ���Redis�����ӳؽ���!");

	}
	
	
	public static  void   releaseConnection(Jedis jedis) {
		
		jedisPool.returnBrokenResource(jedis);
		
	}
	
	
	/**
	 * ��ȡredispool�������ļ�
	 */
	private void loadProperties() {
		
		if (prop != null)	
			return;
		
		prop = new Properties();
		
		InputStream is = null;
		
		try {
			
			is = RedisCacheProvider.class.getResourceAsStream(Constants.RedisConfigPath);
			
			prop.load(is);
			
		} catch (Exception e) {
			
			logger.error("loadProperties()", e);
			
		} finally {
			
			try {
				
				if (is != null) {
					
					is.close();
					
				}
				
			} catch (IOException e) {
				
				logger.error("[�رռ��������ļ�����������]", e);
				
			}
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

	}

}
