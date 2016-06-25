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
	 *            上传的源目录
	 * @return 返回 0 为满足 ，其他则为不满足，需要转
	 */
	private static int checkContentType(String upFilePath) {
		String type = upFilePath.substring(upFilePath.lastIndexOf(".") + 1,
				upFilePath.length()).toLowerCase();

		// 因为平台兼容性，只能支持mp4，其他格式需要转

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

	// 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等), 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式.
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

	// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
	private static boolean processIMG(String ffmpegPath, String filepath,
			String mediaPicPath, String second) {

		if (!checkfile(filepath)) {
			System.out.println(filepath + " is not file");
			return false;
		}

		// 创建一个List集合来保存从视频中截取图片的命令
		List<String> cutpic = new ArrayList<String>();
		cutpic.add(ffmpegPath);
		cutpic.add("-i");
		cutpic.add(filepath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
		cutpic.add(second); // 添加起始时间为第17秒
		cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
		cutpic.add("0.001"); // 添加持续时间为1毫秒
		cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
		cutpic.add("450*254"); // 添加截取的图片大小为350*240
		cutpic.add(mediaPicPath); // 添加截取的图片的保存路径

		ProcessBuilder builder = new ProcessBuilder();
		try {
			builder.command(cutpic);
			builder.redirectErrorStream(true);
			// 如果此属性为 true，则任何由通过此对象的 start() 方法启动的后续子进程生成的错误输出都将与标准输出合并，
			// 因此两者均可使用 Process.getInputStream() 方法读取。这使得关联错误消息和相应的输出变得更容易
			builder.start();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	/**
	 * 视频转码
	 * 
	 * @param ffmpegPath
	 *            转码工具的存放路径
	 * @param upFilePath
	 *            用于指定要转换格式的文件,要截图的视频源文件
	 * @param codcFilePath
	 *            格式转换后的的文件保存路径
	 * @param mediaPicPath
	 *            截图保存路径
	 * @return
	 * @throws Exception
	 */
	public boolean executeCodecs(String ffmpegPath, String upFilePath,
			 String mediaPicPath, String second)
			throws Exception {
		int type = checkContentType(upFilePath);
		boolean status = false;
		if (type == 0) {
			System.out.println("本来就是mp4文件，不用转");
			status = processIMG(ffmpegPath, upFilePath, mediaPicPath, second);// 直接将文件转为flv文件
		} 
//		else if (type == 1) {
//			String avifilepath = processMP4(ffmpegPath, type, upFilePath,
//					codcFilePath);
//			if (avifilepath == null)
//				return false;// avi文件没有得到
//			status = processIMG(ffmpegPath, avifilepath, mediaPicPath, second);// 将avi转为flv
//		}
		return status;
	}
}
