package com.ailk.cake.dao.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ailk.cake.dao.MediaDao;

/**
 * 
 * @author Mia
 * 
 */
public class MediaDaoImpl implements MediaDao {

	/**
	 * 
	 * @param upFilePath
	 *            �ϴ���ԴĿ¼
	 * @return ���� 0 Ϊ���� ��������Ϊ�����㣬��Ҫת
	 */
	private static int checkContentType(String upFilePath) {
		String type = upFilePath.substring(upFilePath.lastIndexOf(".") + 1,
				upFilePath.length()).toLowerCase();

		// ��Ϊƽ̨�����ԣ�ֻ��֧��mp4��������ʽ��Ҫת

		if (type.equals("mp4")) {
			return 0;
		} else if (type.equals("mpg")) {
			return 1;
		} else if (type.equals("wmv")) {
			return 1;
		} else if (type.equals("3gp")) {
			return 1;
		} else if (type.equals("mov")) {
			return 1;
		} else if (type.equals("avi")) {
			return 1;
		} else if (type.equals("asf")) {
			return 1;
		} else if (type.equals("asx")) {
			return 1;
		} else if (type.equals("flv")) {
			return 1;
		} else if (type.equals("wmv9")) {
			return 1;
		} else if (type.equals("rm")) {
			return 1;
		} else if (type.equals("rmvb")) {
			return 1;
		}
		return 9;
	}

	private static boolean checkfile(String path) {
		File file = new File(path);
		if (!file.isFile()) {
			return false;
		}
		return true;
	}

	// ��ffmpeg�޷��������ļ���ʽ(wmv9��rm��rmvb��), �������ñ�Ĺ��ߣ�mencoder��ת��Ϊavi(ffmpeg�ܽ�����)��ʽ.
	private static String processMP4(String ffmpegPath, int type,
			String upFilePath, String codcFilePath) {
		List<String> commend = new ArrayList<String>();
		commend.add(ffmpegPath);
		commend.add(" -y -i");
		commend.add(upFilePath);
		commend.add("-vcodec mpeg4");
		commend.add("-s 1280x720");
		commend.add("-r 25");
		commend.add("-b 750");
		commend.add("-aspect 16:9");
		commend.add("-acodec libfaac ");
		commend.add("-ac 2");
		commend.add("-ar 44100");
		commend.add("-ab 128");
		commend.add("-f mp4");
		commend.add(codcFilePath);
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			Process process = builder.start();
			InputStream fis = process.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(fis));
			String line = null;
			StringBuffer cmdout = new StringBuffer();
			while ((line = br.readLine()) != null) {
				cmdout.append(line);
			}
			process.waitFor();
			return codcFilePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// ffmpeg�ܽ����ĸ�ʽ����asx��asf��mpg��wmv��3gp��mp4��mov��avi��flv�ȣ�
	private static boolean processIMG(String ffmpegPath, String filepath,
			String mediaPicPath, String second) {

		if (!checkfile(filepath)) {
			System.out.println(filepath + " is not file");
			return false;
		}

		// ����һ��List�������������Ƶ�н�ȡͼƬ������
		List<String> cutpic = new ArrayList<String>();
		cutpic.add(ffmpegPath);
		cutpic.add("-i");
		cutpic.add(filepath); // ͬ�ϣ�ָ�����ļ���������ת��Ϊflv��ʽ֮ǰ���ļ���Ҳ������ת����flv�ļ���
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss"); // ��Ӳ�����-ss�����ò���ָ����ȡ����ʼʱ��
		cutpic.add(second); // �����ʼʱ��Ϊ��17��
		cutpic.add("-t"); // ��Ӳ�����-t�����ò���ָ������ʱ��
		cutpic.add("0.001"); // ��ӳ���ʱ��Ϊ1����
		cutpic.add("-s"); // ��Ӳ�����-s�����ò���ָ����ȡ��ͼƬ��С
		cutpic.add("450*254"); // ��ӽ�ȡ��ͼƬ��СΪ350*240
		cutpic.add(mediaPicPath); // ��ӽ�ȡ��ͼƬ�ı���·��

		ProcessBuilder builder = new ProcessBuilder();
		try {
			builder.command(cutpic);
			builder.redirectErrorStream(true);
			// ���������Ϊ true�����κ���ͨ���˶���� start() ���������ĺ����ӽ������ɵĴ�������������׼����ϲ���
			// ������߾���ʹ�� Process.getInputStream() ������ȡ����ʹ�ù���������Ϣ����Ӧ�������ø�����
			builder.start();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	/**
	 * ��Ƶת��
	 * 
	 * @param ffmpegPath
	 *            ת�빤�ߵĴ��·��
	 * @param upFilePath
	 *            ����ָ��Ҫת����ʽ���ļ�,Ҫ��ͼ����ƵԴ�ļ�
	 * @param codcFilePath
	 *            ��ʽת����ĵ��ļ�����·��
	 * @param mediaPicPath
	 *            ��ͼ����·��
	 * @return
	 * @throws Exception
	 */
	public boolean executeCodecs(String ffmpegPath, String upFilePath,
			 String mediaPicPath, String second)
			throws Exception {
		int type = checkContentType(upFilePath);
		boolean status = false;
		if (type == 0) {
			System.out.println("��������mp4�ļ�������ת");
			status = processIMG(ffmpegPath, upFilePath, mediaPicPath, second);// ֱ�ӽ��ļ�תΪflv�ļ�
		} 
//		else if (type == 1) {
//			String avifilepath = processMP4(ffmpegPath, type, upFilePath,
//					codcFilePath);
//			if (avifilepath == null)
//				return false;// avi�ļ�û�еõ�
//			status = processIMG(ffmpegPath, avifilepath, mediaPicPath, second);// ��aviתΪflv
//		}
		return status;
	}
}
