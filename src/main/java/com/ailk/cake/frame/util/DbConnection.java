package com.ailk.cake.frame.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ailk.cake.frame.common.SysContext;
import com.ailk.cake.frame.exception.DAOException;



public class DbConnection {
	
	private  static final  Logger logger =  LoggerFactory.getLogger(DbConnection.class);
	
	/**
	 * ���Ĭ�ϵ����ݿ�����
	 * @return Connection
	 * @throws ServiceLocatorException
	 */
	public static Connection getConnection() throws DAOException {
		Connection con = null;
		try {
			//ServiceLocator s = ServiceLocator.getInstance();
			//DataSource ds = s.getDataSource(ApplicationContext.getDataSourceName());
			DataSource ds = (DataSource) SysContext.getBean("cloudDataSource");
			con  = ds.getConnection();
			if(con==null || con.isClosed()) {
                logger.error("����ʹ���Ѿ���ʱ,�������Ѿ�������!");
			}
		} catch (SQLException e) {
			//��Ҫд��־
            logger.error("����ʹ���Ѿ���ʱ,�������Ѿ������գ�" + e);
			throw new DAOException("", "", e);
		}
		return con;
	}
	
	public static void close(Connection con, PreparedStatement stmt, ResultSet rs) {	
	    //
		try {
			if (rs != null) rs.close();
		} catch (SQLException se) {
            logger.error("Close ResultSet Error : " + se);
		}
		
		//
		try {
			if (stmt != null) stmt.close();
		} catch (SQLException se) {
            logger.error("Close PreparedStatement Error : " + se);
		}
		
		//
		try {
			if (con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			//��Ҫд��־
            logger.error("���ݿ�ر��쳣��" + e);
		} finally {
			con = null;
		}
	}
	
	
	public static void close(PreparedStatement stmt, ResultSet rs) {	
	    //
		try {
			if (rs != null) rs.close();
		} catch (SQLException se) {
            logger.error("Close ResultSet Error : " + se);
		}
		
		//
		try {
			if (stmt != null) stmt.close();
		} catch (SQLException se) {
            logger.error("Close PreparedStatement Error : " + se);
		}
	}
	
	
	public static void close(
	        Connection con, Statement stmt, ResultSet rs) {	
	    //
		try {
			if (rs != null) rs.close();
		} catch (SQLException se) {
            logger.error("Close ResultSet Error : " + se);
		}
		
		//
		try {
			if (stmt != null) stmt.close();
		} catch (SQLException se) {
            logger.error("Close PreparedStatement Error : " + se);
		}
		
		//
		try {
			if (con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			//��Ҫд��־
            logger.error("���ݿ�ر��쳣��" + e);
		} finally {
			con = null;
		}
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
