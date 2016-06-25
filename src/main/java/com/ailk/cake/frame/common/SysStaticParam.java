package com.ailk.cake.frame.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ailk.cake.frame.exception.DAOException;
import com.ailk.cake.frame.util.DbConnection;
import com.ailk.cake.frame.util.LogUtil;



public class SysStaticParam {
	
	public static  Logger  logger  = LoggerFactory.getLogger(SysStaticParam.class);
	
	public static   Map StaticParamMap = new HashMap();
	
	
	public static  void init() {
		logger.info("���ؾ�̬������ʼ===========================================");
		
		try {
			
			StaticParamMap = queryAll();
			
		} catch (Exception e) {
			logger.info("���ؾ�̬����ʧ��========================================");
			LogUtil.loggerError(e, SysStaticParam.class);
			
		}
		
		logger.info("���ؾ�̬��������========================================");
		
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	private static  Map queryAll() throws DAOException{
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Map retmap = new HashMap();
        String sql = 
        	"SELECT trim(LOWER(table_name)||'.'||LOWER(column_name)) PKEY,column_value,column_desc FROM SYS_STATIC_PARAM order by table_name,column_name,dispord";
    
        try {
            connection = DbConnection.getConnection();
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();
            String pkey="";
            String tname;
            List cols = null;
            while(rs.next()) {
            	tname=rs.getString(1);
            	if(!pkey.equals(tname)){
            		pkey = tname;
            		cols = new ArrayList();
            		retmap.put(pkey, cols);
            	}
            	cols.add(new CodeValueObject(rs.getString(2), rs.getString(3)));
            }
            return retmap;
        } catch (SQLException e) {
            logger.error("ORA_QUERY:" + sql + "  " + e);
            throw new DAOException("ORA_QUERY",sql,e);
        } finally {   
        	DbConnection.close(connection, pstmt, rs);
        }
    }
	
	
	/**
     * ��ȡcode�����Ĳ����ֵ�
     * 
     * @param pKey
     * @return
     * @throws DAOException 
     */
    public static List getParams(String pKey) throws DAOException {
        //0����Ч
        if (!StaticParamMap.containsKey(pKey)) {
            throw new IllegalStateException(pKey + "��Ч������");
        }

        //1������ʱ����
        //2��ʹ��ʱ�ټ���( һ�㲻ʹ��)�����״�ʹ�ô������ء�
        List retlst = (List) StaticParamMap.get(pKey);
        return retlst;
    }
    
    
    /**
     * ��ȡcode����
     * @param pKey
     * @param code
     * @return
     */
    public static String getDescription(String pKey, String code) {
        if(code == null || "".equals(code.trim())){
            return "";
        }
        if(pKey.indexOf(".")>0 && ".".equals(code.trim())){ 
            return "";           
        }
        
        //0����Ч
        if (!StaticParamMap.containsKey(pKey)) {
            return pKey + "��" + code;
        }

        List lst = null;
        try {
            lst = getParams(pKey);
        } catch (DAOException e) {
            logger.error(e.toString());
        }
        return getDescription(lst, pKey,  code);
    }
    
    
    public static String getDescription(List lst, String pKey, String code) {
        String ret = "";
            if (lst == null || lst.size() == 0 || code == null){
                ret = pKey + "��" + code;
            } else { 
                ret = pKey + "*" + code;  
                for(int i=0; i < lst.size(); i ++){
                    CodeValueObject cvo = (CodeValueObject)lst.get(i);
                    String tmp = cvo.getCode().trim();
                    if(tmp.equals(code.trim())){  
                        ret = cvo.getValue().trim();
                    } 
                }
            }
        return ret;
    }

    
    /**
     * ��ȡcode����
     * @param pKey
     * @param code
     * @return
     */
    public static String getSimpleDesc(String pKey, String code) {
        if(code == null || "".equals(code.trim())){
            return null;
        }

        List lst = null;
        try {
            lst = getParams(pKey);
        } catch (DAOException e) {
        	return null;
        }
        
        if(lst !=null){
            for(int i=0; i < lst.size(); i ++){
                CodeValueObject cvo = (CodeValueObject)lst.get(i);
                String tmp = cvo.getCode().trim();
                if(tmp.equals(code)){  
                     return cvo.getValue();
                } 
            }
        }
        return null;
    }
	
	

}
