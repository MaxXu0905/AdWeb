package com.ailk.cake.frame.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import com.ailk.cake.frame.exception.SystemException;



/**
 * @author 
 * 
 */
public class FtpUtil {

	 /**
	 * FTP��½����
	 * @param String url 
	 * @param String port
	 * @param String username 
	 * @param String password 
	 * @param String code �ַ��� Ĭ��GBK
	 */
	public static FTPClient connetFTP(String url, int port, String username,
			String password,String code) {
			
		// ����FTPClient����
		FTPClient ftp = new FTPClient();
		try {

			int reply;
			// ����FTP������
			// �������Ĭ�϶˿ڣ�����ʹ��ftp.connect(url)�ķ�ʽֱ������FTP������
			if (port < 0) {
				ftp.connect(url);
			} else {
				ftp.connect(url, port);
			}
			// �������д������Ҫ�����Ҳ��ܸı�����ʽ����������ȷ���������ļ�
			if(!StringUtil.isBlank(code)){
				ftp.setControlEncoding(code);
			}else{
				ftp.setControlEncoding("GBK");
			}
			FTPClientConfig conf = new FTPClientConfig(FTPClientConfig.SYST_NT);
			conf.setServerLanguageCode("zh");
			// ��¼ftp
			ftp.login(username, EncryptUtil.getDecrypt(password));
			// �����ص�ֵ�ǲ���230������ǣ���ʾ��½�ɹ�
			reply = ftp.getReplyCode();
			// ��2��ͷ�ķ���ֵ�ͻ�Ϊ��
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				throw new SystemException("���ӷ�����ʧ��!");
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("����ʧ�� "+e);
		}
		return ftp;
	}	
	/**
	 * FTP�˳�����
	 * 
	 */
	public static void logoutFTP(FTPClient ftp) {
		
		if(ftp!=null){
			try{
			ftp.isConnected();
			}catch(Exception e){
				e.printStackTrace();
				throw new SystemException("FTP�˳�ʧ�� "+e);
			}
		}
	}
	
	/**
	 * �ϴ����򷽷�
	 * 
	 */
	public static boolean uploadFile(FTPClient ftp, String path, String filename,InputStream input) {
		// filename:Ҫ�ϴ����ļ�
		// path :�ϴ���·��
		// ��ʼ��ʾ�ϴ�ʧ��
		boolean success = false;
		
		try {
			
			int reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				throw new SystemException("���ӷ�����ʧ��!");
			}
			if(!StringUtil.isBlank(path)){
				ftp.changeWorkingDirectory(path);// ת�Ƶ�FTP������Ŀ¼
			}
			FTPFile[] fs = ftp.listFiles(); // �õ�Ŀ¼����Ӧ�ļ��б�
//			System.out.println(fs.length);
//			System.out.println(filename);
			String filename1 = FtpUtil.changeName(filename, fs);
			String filename2 = new String(filename1.getBytes("GBK"),
					"ISO-8859-1");
			String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
			// ת��ָ���ϴ�Ŀ¼
			ftp.changeWorkingDirectory(path1);
			// ���ϴ��ļ��洢��ָ��Ŀ¼
			// ftp.appendFile(new String(filename.getBytes("GBK"),"ISO-8859-1"),
			// input);
			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// ���ȱʡ�þ� ����txt���� ��ͼƬ��������ʽ���ļ������������
			ftp.storeFile(filename2, input);
			// �ر�������
			input.close();
			// ��ʾ�ϴ��ɹ�
			success = true;
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("�ϴ�����ʧ�� "+e);
		}
		return success;
	}
	/**
	 * �ϴ����򷽷�
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String code �ַ��� Ĭ��GBK
	 * @param String path �ϴ��ļ��ı���Ŀ¼
	 * @param String fileName   �ļ����� 
	 */
	public static boolean uploadFile(String url,String code, String path, String filename) {

		// ��ʼ��ʾ�ϴ�ʧ��
		boolean success = false;
		FTPClient ftp=null;
		try {
			ftp =connetFTP(url,code);
			int reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				throw new SystemException("���ӷ�����ʧ��!");
			}

			
			FTPFile[] fs = ftp.listFiles(); // �õ�Ŀ¼����Ӧ�ļ��б�
			
			
//			System.out.println(fs.length);
//			System.out.println(filename);
			String filename1 = FtpUtil.changeName(filename, fs);
			String flienameTemp = filename1+"_temp";
			String filename2 = new String(filename1.getBytes("GBK"),
					"ISO-8859-1");
			//����ʱ�ļ�����_temp
			String flienameTemp2 = new String(flienameTemp.getBytes("GBK"),
			"ISO-8859-1");
			String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
			
			String pathFilename=path1+filename;
			InputStream inStream = new FileInputStream(pathFilename);
			

			ftp.setFileType(FTP.BINARY_FILE_TYPE);
			// ���ȱʡ�þ� ����txt���� ��ͼƬ��������ʽ���ļ������������
			ftp.storeFile(flienameTemp2, inStream);
			// �ر�������
			inStream.close();
			//�ĳ���ȷ���ļ���
			ftp.rename(flienameTemp2, filename2);
			// �˳�ftp
//			ftp.logout();
			
			// ��ʾ�ϴ��ɹ�
			success = true;
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("�ϴ�����ʧ�� "+e);
		} finally {
			   if (ftp.isConnected()) {
				   try {
						ftp.logout();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				try {
					ftp.disconnect();
				} catch (IOException ioe) {
				}
			}
		}
		return success;
	}
	/**
	 * ɾ������
	 * 
	 */
	public static boolean deleteFile(FTPClient ftp, String path, String filename) {
		// filename:Ҫ�ϴ����ļ�
		// path :�ϴ���·��
		// ��ʼ��ʾ�ϴ�ʧ��
		boolean success = false;
		try {
			
			int reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				throw new SystemException("���ӷ�����ʧ��!");
			}
			
			String filename2 = new String(filename.getBytes("GBK"),
					"ISO-8859-1");
			if(!StringUtil.isBlank(path)){
				String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
				// ת��ָ���ϴ�Ŀ¼
				ftp.changeWorkingDirectory(path1);
			}
			ftp.deleteFile(filename2);
			success = true;
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("ɾ��ʧ�� ",e.getLocalizedMessage());
		}
		return success;
	}

 	/**
	 * ���س���
	 * @param FTPClient ftp
	 * @param String remotePath ftp������Ŀ¼
	 * @param String fileName   �ļ����� 
	 * @param String localPath  ����Ŀ¼
	 * @param String isDel      ���سɹ����Ƿ�ɾ��  Y ɾ��  N ��ɾ��
	 */
	public static boolean downFile(FTPClient ftp, String remotePath,
			String fileName,String localPath,String isDel) {

		boolean success = false;

		try {
			
			int reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftp.disconnect();
				throw new SystemException("���ӷ�����ʧ��!");
			}
			if(!StringUtil.isBlank(remotePath)){
				ftp.changeWorkingDirectory(remotePath);// ת�Ƶ�FTP������Ŀ¼
			}
			FTPFile[] fs = ftp.listFiles(); // �õ�Ŀ¼����Ӧ�ļ��б�

			for (int i = 0; i < fs.length; i++) {
				FTPFile ff = fs[i];
				if (ff.getName().equals(fileName)) {
					
					File localFile = new File(localPath + "/" + ff.getName());   
					FileOutputStream is = new FileOutputStream(localFile);    
			        // �����ļ�    
			        ftp.retrieveFile(ff.getName(), is);  
			        is.flush();
			        is.close();    
			        
			        //ɾ��FTP���������ļ�
			        if(!StringUtil.isBlank(isDel)&&"Y".equals(isDel)){
						String filename2 = new String(fileName.getBytes("GBK"),"ISO-8859-1");
			        	ftp.deleteFile(filename2);
			        }
			        success = true;
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("���س���ʧ�� "+e);
		}
		return success;
	}

 	/**
	 * ���س���
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String code �ַ��� Ĭ��GBK
	 * @param String remotePath ftp������Ŀ¼
	 * @param String fileName   �ļ����� 
	 * @param String localPath  ����Ŀ¼
	 * @param String isDel      ���سɹ����Ƿ�ɾ��  Y ɾ��  N ��ɾ��
	 */
	public static boolean downFile(String url,String code, String remotePath,
			String fileName,String localPath,String isDel) {
		
		boolean success = false;
		FTPClient ftp = null;
		try {
			ftp = connetFTP(url,code);
			success=downFile(ftp, remotePath, fileName, localPath, isDel);
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("���س���ʧ�� "+e);
		} finally {
			   if (ftp!=null&&ftp.isConnected()) {
				   try {
						ftp.logout();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						ftp.disconnect();
					} catch (IOException ioe) {
						ioe.printStackTrace();
					}
				}
			}
		return success;
		
	}
	
 	/**
	 * �ж��Ƿ�����������
	 * 
	 */
	public static boolean isDirExist(String fileName, FTPFile[] fs) {
		for (int i = 0; i < fs.length; i++) {
			FTPFile ff = fs[i];
			if (ff.getName().equals(fileName)) {
				return true; // ������ڷ��� ��ȷ�ź�
			}
		}
		return false; // ��������ڷ��ش����ź�
	}
 	/**
	 * ���������жϵĽ�� �����µ��ļ�������
	 * 
	 */
	public static String changeName(String filename, FTPFile[] fs) {
//		int n = 0;
//		// ����һ���ɱ���ַ������� ��StringBuffer���󣬰�filenameֵ�����ö���
//		StringBuffer filename1 = new StringBuffer("");
//		filename1 = filename1.append(filename);
////		System.out.println(filename1);
//		while (isDirExist(filename1.toString(), fs)) {
//			n++;
//			String a = "[" + n + "]";
////			System.out.println("�ַ���a��ֵ�ǣ�" + a);
//			int b = filename1.lastIndexOf(".");// ���һ����С�����λ��
//			int c = filename1.lastIndexOf("[");// ���һ��"["���ֵ�λ��
//			if (c < 0) {
//				c = b;
//			}
//			StringBuffer name = new StringBuffer(filename1.substring(0, c));// �ļ�������
//			StringBuffer suffix = new StringBuffer(filename1.substring(b + 1));// ��׺������
//
//			filename1 = name.append(a).append(".").append(suffix);
//
//		}
//		return filename1.toString();
		return filename;
	}
 	/**
	 * ��ȡFTPĿ¼�������ļ��б�
	 * path ����Ĭ��ΪFTP��Ŀ¼
	 */
	public static FTPFile[] getFileList(FTPClient ftp,String path) {
		FTPFile[] fs = null;
		try {
			 if(!StringUtil.isBlank(path)){
				String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
				// ת��ָ���ϴ�Ŀ¼
				ftp.changeWorkingDirectory(path1);
			 }
			fs = ftp.listFiles(); // �õ�Ŀ¼����Ӧ�ļ��б�
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("��ȡ�ļ�·��ʧ�� "+e);
		}
		return fs;
	}
 	/**
	 * ��ȡFTPĿ¼�������ļ�����
	 * path ����Ĭ��ΪFTP��Ŀ¼
	 */
	public  static String[] getNameList(FTPClient ftp,String path) {
		String[] fs = null;
		try {
			 if(!StringUtil.isBlank(path)){
				String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
				// ת��ָ���ϴ�Ŀ¼
				ftp.changeWorkingDirectory(path1);
			 }
			fs = ftp.listNames(); // �õ�Ŀ¼����Ӧ�ļ��б�
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("��ȡ�ļ�·��ʧ�� "+e);
		}
		return fs;
	}
 	/**
	 * ��ȡFTPĿ¼�������ļ��б� ������Ŀ¼
	 * path ����Ĭ��ΪFTP��Ŀ¼
	 * qryFlag 1.�ļ� 2.Ŀ¼ ���� ȫ�� 
	 */
	public static List<String> getFileInfoList(FTPClient ftp,String path,String qryFlag) {
		FTPFile[] fs = null;
		List<String> fileNameList=new ArrayList<String>();
		try {
			 if(!StringUtil.isBlank(path)){
				String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
				// ת��ָ���ϴ�Ŀ¼
				ftp.changeWorkingDirectory(path1);
			 }
			fs = ftp.listFiles(); // �õ�Ŀ¼����Ӧ�ļ��б�
			 for (FTPFile ff : fs) {    
				 if("1".equals(qryFlag)&&ff.isFile()){
					 fileNameList.add(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
				 }else if("2".equals(qryFlag)&&ff.isDirectory()){
					 fileNameList.add(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
				 }else{
					 fileNameList.add(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
				 }
			 }
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("��ȡ�ļ�·��ʧ�� "+e);
		}
		return fileNameList;
	}
	/**
	 * ����FTP��׼����½��ת����ӦĿ¼
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String code �ַ��� Ĭ��GBK
	 * @throws MalformedURLException 
	 */
	public static FTPClient connetFTP(String url,String code) throws MalformedURLException {
		
		 URL aURL = new URL(url);
		 
//		 String protocol=aURL.getProtocol();
		 String userInfo=aURL.getUserInfo();
		 String host=aURL.getHost();
		 int port=aURL.getPort();
		 String path=aURL.getPath();
		 String user="";
		 String pass="";
		 
		 if(StringUtil.isBlank(host)){
			 throw new SystemException("ftp��½ʧ��:ftp��ַ����Ϊ��!");
		 }
		 if(!StringUtil.isBlank(userInfo)){
			 String[] userInfoArray=userInfo.split(":");
			 if(userInfoArray.length<2){
				 throw new SystemException("ftp��½ʧ��:�û�����������Ϣ����Ϊ��!");
			 }else{
				 user=userInfoArray[0];
				 pass=userInfoArray[1];
			 }
		 }else{
			 throw new SystemException("ftp��½ʧ��:�û�����������Ϣ����Ϊ��!");
		 }
		 if(StringUtil.isBlank(user)){
			 throw new SystemException("ftp��½ʧ��:�û�������Ϊ��!");
		 }
		 if(StringUtil.isBlank(pass)){
			 throw new SystemException("ftp��½ʧ��:���벻��Ϊ��!");
		 }
		 
		 FTPClient ftp = connetFTP(host, port, user, pass,code);
			 
		 if(ftp!=null){
			 try {
				//�ж��ϴ�·���Ƿ���ڣ����������ڣ��½��ϴ�·��
				 if(!StringUtil.isBlank(path)){
					 String path1 = new String(path.getBytes("GBK"), "ISO-8859-1");
//					 if(isDirectoryExists(path1,ftp)){
//							 // ת��ָ��Ŀ¼
//						ftp.changeWorkingDirectory(path1);
//					 }else{
//						 ftp.makeDirectory(path1);
//						 ftp.changeWorkingDirectory(path1);
//					 }
					 if(!ftp.changeWorkingDirectory(path1)){
						 ftp.mkd(path1);
						 ftp.changeWorkingDirectory(path1);
					 }else{
						 ftp.changeWorkingDirectory(path1);
					 }
				 }
				 
			} catch (IOException e) {
				e.printStackTrace();
				throw new SystemException("ftp��½ʧ�� "+e);
			}
		 }
		 
		return ftp;
	}
 	/**
	 * ���س���
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String fileName   �ļ����� 
	 * @param String localPath  ����Ŀ¼
	 * @param String isDel      ���سɹ����Ƿ�ɾ��  Y ɾ��  N ��ɾ��
	 */
	public static boolean downFile(String url,String fileName,String localPath,String isDel) {
		
		return downFile(url, "", "", fileName, localPath, isDel);
	}
	/**
	 * �ϴ����򷽷�
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String path �ϴ��ļ��ı���Ŀ¼
	 * @param String fileName   �ļ����� 
	 */
	public static boolean uploadFile(String url, String path, String fileName) {
		return uploadFile(url,"", path, fileName);
		
	}
	/**
	 * �ϴ����򷽷�
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String path �ϴ��ļ��ı���Ŀ¼
	 * @param String fileName   �ļ����� 
	 */
	public static boolean uploadFile(String url, String pathFileName) {
		int index = pathFileName.lastIndexOf(File.separator);
		return uploadFile(url,"", pathFileName.substring(0,index+1), pathFileName.substring(index+1,pathFileName.length()));
		
	}
 	/**
 	 * �鿴Ŀ¼�ļ�������Ŀ¼����
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String code �ַ��� Ĭ��GBK
	 * @param qryFlag 1.�ļ� 2.Ŀ¼ ���� ȫ�� 
	 */
	public static List<String> getFileInfoList(String url,String code,String qryFlag) {
		FTPClient ftp = null;
		List<String> fileNameList=new ArrayList<String>();
		try {
			ftp = connetFTP(url,code);
			fileNameList=getFileInfoList(ftp,"", qryFlag);
			
			// �˳�ftp
		} catch (IOException e) {
			e.printStackTrace();
			throw new SystemException("�鿴Ŀ¼ʧ�� "+e);
		} finally {
			   if (ftp.isConnected()) {
				   try {
						ftp.logout();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						ftp.disconnect();
					} catch (IOException ioe) {
					}
				}
			}
		return fileNameList;
	}
 	/**
 	 * �鿴Ŀ¼�ļ�������Ŀ¼����
	 * @param String url ��:ftp://user:pass@foo.bar:21/path/path2/path3 
	 * @param String code �ַ��� Ĭ��GBK
	 * @param qryFlag 1.�ļ� 2.Ŀ¼ ���� ȫ�� 
	 */
	public static List<String> getFileInfoList(String url,String qryFlag) {
		
		return getFileInfoList(url,"", qryFlag);
	}
	/**
	 * �ж��ϴ�·���Ƿ����
	 * @param path
	 * @param ftpClient
	 * @return
	 * @throws IOException
	 */
	public static boolean isDirectoryExists(String path,FTPClient ftpClient) throws IOException {

        boolean flag = false;
        FTPFile[] ftpFileArr = ftpClient.listFiles(path);
        for (FTPFile ftpFile : ftpFileArr) {
               if (ftpFile.isDirectory()
                             && ftpFile.getName().equalsIgnoreCase(path)) {
                      flag = true;
                      break;
               }
        }
        return flag;
 }


 /**
  * @param args
 * @throws IOException 
  */
 public static void main(String[] args) throws IOException {

/*	 FtpUtil a = new FtpUtil();
	 FTPClient ftp=a.connetFTP("aiftp.asiainfo.com", 0, "ailk\\yansd", "44444444");
	 if(ftp==null){
		 System.out.println("��½ʧ��");
	 }else{
		 System.out.println("��½�ɹ�");
	 }
	 
	 //��ȡ�ļ��б�
	 FTPFile[] getFileList= a.getFileList(ftp,"zjy");
	 for (FTPFile ff : getFileList) {    
		 System.out.println(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
	 }
	 
	 //�ϴ��ļ�
	 InputStream inStream = new FileInputStream("C:\\testFtp.txt");
	 boolean sss=a.uploadFile(ftp, "zjy", "testFtp.txt", inStream);
	 if(sss){
		 System.out.println("�ϴ��ɹ�");
	 }else{
		 System.out.println("�ϴ�ʧ��");
	 }
	 ftp.setControlEncoding("GBK");
	 //��ȡ�ļ��б�
	 getFileList= a.getFileList(ftp,"zjy");
	 for (FTPFile ff : getFileList) {    
		 System.out.println(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
	 }
	 
	 //�����ļ�
	 sss=a.downFile(ftp, "/zjy", "testFtp.txt","D:\\" );
	 if(sss){
		 System.out.println("���سɹ�");
	 }else{
		 System.out.println("����ʧ��");
	 }
	 
	 //ɾ���ļ�
	 sss=a.deleteFile(ftp, "zjy", "testFtp.txt");
	 if(sss){
		 System.out.println("ɾ���ɹ�");
	 }else{
		 System.out.println("ɾ��ʧ��");
	 }
	 
	 //��ȡ�ļ��б�
	 getFileList= a.getFileList(ftp,"zjy");
	 for (FTPFile ff : getFileList) {    
		 System.out.println(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
	 }
	 //�˳�
	 a.logoutFTP(ftp); */
	 
	 
	 
	 /****2.ͨ��������********************************************************************/
//	 FtpUtil a = new FtpUtil();
//	 FTPClient ftp=a.connetFTP("ftp://ailk\\yansd:����@aiftp.asiainfo.com/zjy","");
//	 System.out.println(ftp.printWorkingDirectory());
//	 
//	 
//	 //�����ļ�
//	 boolean sss=a.downFile(ftp, "/zjy", "testFtp.txt","D:\\" ,"Y");
//	 if(sss){
//		 System.out.println("���سɹ�");
//	 }else{
//		 System.out.println("����ʧ��");
//	 }
//	 
//	 FTPFile[] getFileList= a.getFileList(ftp,"zjy");
//	 System.out.println(ftp.printWorkingDirectory());
//	 for (FTPFile ff : getFileList) {    
//		 System.out.println(URLEncoder.encode(ff.getName(), "ISO-8859-1"));
//		 
//	 }
	 
	 //��ȡĳĿ¼�������ļ��б� ������Ŀ¼
//	 List<String> ss= a.getFileInfoList(ftp,"","1");
//	 System.out.println(ftp.printWorkingDirectory());
//	 for (String ff : ss) {    
//		 System.out.println(URLEncoder.encode(ff, "ISO-8859-1"));
//		 
//	 }
	 
	 /***3.����ĵ��÷�ʽ*********************************************************************/
//	 FtpUtil a = new FtpUtil();
	 
	 //1.�ϴ�
	// boolean success= a.uploadFile("ftp://ailk\\yansd:dener23^@aiftp.asiainfo.com/zjy", "C:\\", "testFtp.txt");
	//  2.�鿴�ļ�
//	 List<String> fileNameList=FtpUtil.getFileInfoList("ftp://ailk\\yansd:dener23^@aiftp.asiainfo.com/zjy", "1");
//	 for (String fileName : fileNameList) {    
//		 System.out.println(URLEncoder.encode(fileName, "ISO-8859-1"));
//	 }
	 //3.�����ļ� ���سɹ��� ɾ��ftp�������ļ�
	 // boolean success=a.downFile("ftp://ailk\\yansd:����@aiftp.asiainfo.com/zjy", "testFtp.txt", "D:\\", "Y");
	 
 }
}