package com.ailk.cake.frame.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ailk.cake.frame.exception.DAOException;




public class DbUtils {
	
	private static final  Logger logger = LoggerFactory.getLogger(DbUtils.class);
	
	
	/**
	 * ���ݿ����,
	 */
	public static Connection getConnection() throws DAOException
	{
		return DbConnection.getConnection();
	}

	// �������ת��List
	private static List transtoStrsList(ResultSet rs) throws SQLException
	{
		List ls = new ArrayList();
		int cols = rs.getMetaData().getColumnCount();
		while (rs.next())
		{
			String strs[] = new String[cols];
			for (int i = 1; i <= cols; i++)
			{

				strs[i - 1] = rs.getString(i);
			}
			ls.add(strs);
		}
		return ls;

	}

	/**
	 * @param rs
	 *            ��ά���
	 * @return list.get() ��õ����� String[] ��һ�����ֶε�Label ���ڶ��п�ʼ��������
	 */

	private static List transtoStrsLabelList(ResultSet rs) throws SQLException
	{
		List ls = new ArrayList();
		int cols = rs.getMetaData().getColumnCount();
		String strs1[] = new String[cols];
		for (int i = 0; i < cols; i++)
		{
			strs1[i] = rs.getMetaData().getColumnLabel(i + 1);
		}
		ls.add(strs1);
		while (rs.next())
		{
			String strs[] = new String[cols];
			for (int i = 1; i <= cols; i++)
			{

				strs[i - 1] = rs.getString(i);
			}
			ls.add(strs);
		}
		return ls;

	}

	// ��ѯ�õ�List String[]��ʽ
	public static List getStrsList(String sql)
	{
		List ls = new ArrayList();
		Connection conn = null;

		ResultSet rs = null;
		PreparedStatement ps = null;
		try
		{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ls = transtoStrsList(rs);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("ִ�в�ѯ�����쳣");
		}
		finally
		{
			DbConnection.close(conn, ps, rs);
		}
		return ls;
	}
	

	
	public static List getStrsList(Connection conn,String sql)
	{
		List ls = new ArrayList();

		ResultSet rs = null;
		PreparedStatement ps = null;
		try
		{
			ps = conn.prepareStatement(sql);
			// log.info("sql:" + sql);
			rs = ps.executeQuery();
			ls = transtoStrsList(rs);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("ִ�в�ѯ�����쳣");
		}
		finally
		{
			DbConnection.close(null, ps, rs);
		}
		return ls;
	}
	
	public static List getStrsLabelList(String sql)
	{
		List ls = new ArrayList();
		Connection conn = null;

		ResultSet rs = null;
		PreparedStatement ps = null;
		try
		{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			// log.info("sql:" + sql);
			rs = ps.executeQuery();
			ls = transtoStrsLabelList(rs);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("ִ�в�ѯ�����쳣");
		}
		finally
		{
			DbConnection.close(conn, ps, rs);
		}
		return ls;
	}

	public static int update(String sql)
	{
		int n = 0;

		Connection conn = null;
		PreparedStatement ps = null;
		try
		{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			logger.info("sql:" + sql);
			n = ps.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("ִ�и��·����쳣");
		}
		finally
		{
			DbConnection.close(conn, ps, null);
		}
		return n;
	}
	public static int update(Connection conn,String sql)
	{
		int n = 0;

		PreparedStatement ps = null;
		try
		{
			ps = conn.prepareStatement(sql);
			// log.info("sql:" + sql);
			n = ps.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("ִ�и��·����쳣");
		}
		finally
		{
			DbConnection.close(null, ps, null);
		}
		return n;
	}
	public static int updateBatch(Connection conn,List sqlList)
	{
		int n = 0;

		Statement st = null;
		try
		{
			conn = getConnection();
			st = conn.createStatement();
			for (int i=0;i<sqlList.size();i++)
			{
				String sql = (String)sqlList.get(i);
				st.addBatch(sql);
			}
			int ret[] = st.executeBatch();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("����ִ�и��·����쳣");
		}
		finally
		{
			DbConnection.close(null, st, null);
		}
		return n;
	}
	public static int updateBatch(List sqlList)
	{
		int n = 0;
		Connection conn = null;
		Statement st = null;
		try
		{
			conn = getConnection();
			st = conn.createStatement();
			for (int i=0;i<sqlList.size();i++)
			{
				String sql = (String)sqlList.get(i);
				st.addBatch(sql);
			}
			int ret[] = st.executeBatch();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("����ִ�и��·����쳣");
		}
		finally
		{
			DbConnection.close(conn, st, null);
		}
		return n;
	}

	// �õ�һ��String[]
	public static String[] getStrs(String sql)
	{
		List list = getStrsList(sql);
		if (list.size() == 0) { return null; }
		return (String[]) list.get(0);
	}
	
//	 �õ�һ��String[]
	public static String[] getStrs(Connection conn,String sql)
	{
		List list = getStrsList(conn,sql);
		if (list.size() == 0) { return null; }
		return (String[]) list.get(0);
	}

	// �õ�һ��String
	public static String getString(String sql)
	{
		String str[] = getStrs(sql);
		if (str == null) { return null; }
		return str[0];
	}
	
//	 �õ�һ��String
	public static String getString(Connection conn,String sql)
	{
		String str[] = getStrs(conn,sql);
		if (str == null) { return null; }
		return str[0];
	}

	// ����ת������
	protected java.util.Date transString2Date(String s, String format)
	{
		DateFormat df = new SimpleDateFormat(format);
		java.util.Date date = null;
		try
		{
			date = df.parse(s);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * ���ܣ����̶��ĳ��ȡ�
	 * 
	 * @param src
	 * @param token�������ַ���
	 * @param type��0--����䣬1--�����
	 * @param max_len�����ص���󳤶�
	 * @return
	 */

	public static String pad(String src, String token, int type, int max_len)
	{
		String des = "";
		if (src.length() < max_len)
		{
			for (int i = 0; i < max_len - src.length(); i++)
			{
				des += token;
			}
			if (type == 0)
			{
				des = des + src;
			}
			else
			{
				des = src + des;
			}
		}
		else
		{
			des = src.substring(0, max_len);
		}

		return des;
	}

	// ��Listת����String,���ֲ�ˢ��select��
	public static String toOptionString(List list)
	{
		StringBuffer ret = new StringBuffer();
		for (int i = 0; i < list.size(); i++)
		{
			String[] str = (String[]) list.get(i);
			ret.append(str[0].trim() + "/" + str[1].trim() + ",");
		}
		return ret.toString();
	}

	// ��Listת����String,���ֲ�ˢ��select��,����all
	public static String toAllOptionString(List list)
	{
		StringBuffer ret = new StringBuffer();
		for (int i = 0; i < list.size(); i++)
		{
			String[] str = (String[]) list.get(i);
			ret.append(str[0].trim() + "/" + str[1].trim() + ",");
		}
		return "**/ȫ��...," + ret.toString();
	}

	public static String toDispString(List list)
	{
		StringBuffer ret = new StringBuffer();
		for (int i = 0; i < list.size(); i++)
		{
			String[] str = (String[]) list.get(i);
			ret.append(str[0].trim() + ",");
		}
		if (ret.length() == 0) return "";
		return ret.substring(0, ret.length() - 1);
	}
	
	
	/**
	 * ����ָ�������е����ֵõ����е�ֵ
	 * @param sequenceName ���е�����
	 * @return �������е�ֵ
	 */
	public static String  getSequenceNextValue(String sequenceName) {
		String sql = "select "+sequenceName+".nextVal from dual";
		String nextval = DbUtils.getString(sql).trim();
		return nextval;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
