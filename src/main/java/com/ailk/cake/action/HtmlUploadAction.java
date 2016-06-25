package com.ailk.cake.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ailk.api.impl.BaseResponse;
import com.ailk.cake.dao.MediaDao;
import com.ailk.cake.dao.impl.DaoFactory;
import com.ailk.cake.frame.util.OssClientUtil;
import com.ailk.cake.model.SnapShotVo;
import com.aliyun.openservices.oss.OSSClient;

@Controller
public class HtmlUploadAction extends BaseAction {

	@RequestMapping("/html/htmlupload.do")
	public void htmlUpload(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// HttpSession session = request.getSession();
		// InfoCust infoCust = (InfoCust)
		// session.getAttribute(CustIfc.CUST_ATTR);
		// String custId = infoCust.getCustId()+"";

		String data = getParameter(request.getInputStream());

		data = URLDecoder.decode(data, "UTF-8");
		data = "<html><body>" + data + "</body></html>&nbsp;";
		ByteArrayInputStream is = new ByteArrayInputStream(data.getBytes());
		String time = new Date().getTime() + ".html";
		String filename = "CUST_" + 11111 + "/" + time;

		String bucketName = "adlooker";
		OssClientUtil clientUtil = new OssClientUtil();
		OSSClient client = clientUtil.init("MOG6VQEIxSKvrvCB",
				"K6PAK5pdESHGiOcnCo2cj6dxN2Kja7");
		clientUtil.ensureBucket(client, bucketName);
		clientUtil.uploadFile(client, bucketName, filename, is, data.length(),
				"MIME TYPE");

		BaseResponse baseResponse = new BaseResponse();
		baseResponse.setErrorDesc("http://" + bucketName + ".oss.aliyuncs.com/"
				+ filename);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(baseResponse));
	}

	@RequestMapping("/jpg/jpgupload.do")
	public void jpgUpload(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		InputStream is = request.getInputStream();

		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		int ch;
		long length = 0;
		while ((ch = is.read()) != -1) {
			bos.write(ch);
			length++;
		}
		ByteArrayInputStream bis = new ByteArrayInputStream(bos.toByteArray());
		String time = new Date().getTime() + ".jpg";
		String filename = "CUST_" + 11111 + "/" + time;

		String bucketName = "adlooker";
		OssClientUtil clientUtil = new OssClientUtil();
		OSSClient client = clientUtil.init("MOG6VQEIxSKvrvCB",
				"K6PAK5pdESHGiOcnCo2cj6dxN2Kja7");
		clientUtil.ensureBucket(client, bucketName);
		clientUtil.uploadFile(client, bucketName, filename, bis, length,
				"image/jpeg");

		BaseResponse baseResponse = new BaseResponse();
		baseResponse.setErrorDesc("http://" + bucketName + ".oss.aliyuncs.com/"
				+ filename);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(baseResponse));
	}

	/**
	 * �������ɿ���
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/jpg/videoSnapshot.do")
	public void videoSnapshot(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		BaseResponse baseResponse = new BaseResponse();
		String result = "";

		String second = request.getParameter("second"); // �ͻ�ѡȡ������
		String snapshotFileName = request.getParameter("snapshotFileName"); // ��ǰ�Ŀ���ͼƬ���������¿��պ�ɾ��
		// ɾ���ɿ����ļ�
		File oldFile = new File(snapshotFileName); // ��ǰ�Ŀ���ͼƬ���������¿��պ�ɾ��
		if (oldFile.isFile())
			oldFile.delete(); // ɾ��Դ�ļ�

		String videoFileName = request.getParameter("filename"); // ��Ƶ·��
		oldFile = new File(videoFileName); // ��ǰ����ƵͼƬ���������¿��պ�ɾ��
		if (oldFile.isFile())
			oldFile.delete(); // ɾ��Դ�ļ�
		
		if (snapshotFileName == null || snapshotFileName.length() == 0) // ���ԭ��û�п����ļ�������������
		{
			String fileName = new Date().getTime() + "";
			String t_ext = videoFileName.substring(videoFileName
					.lastIndexOf(".") + 1);
			videoFileName = new Date().getTime() + "";
			videoFileName = fileName + "." + t_ext;
			snapshotFileName = new Date().getTime() + ".png";
		}

		// ��ͼ��ŵ�ַ
		String mediaPicPath = request.getSession().getServletContext()
				.getRealPath("/tempImage/" + snapshotFileName);

		String oldFilePath = request.getSession().getServletContext()
				.getRealPath("/tempVideo/" + videoFileName);
		File uploadFile = new File(oldFilePath); // ԴĿ¼·��

		String ffmpegPath = request.getSession().getServletContext()
				.getRealPath("/tools/ffmpeg/ffmpeg.exe");

		MediaDao mediaDao = DaoFactory.getMediaDao();
		boolean flag;
		try {
			flag = mediaDao.executeCodecs(ffmpegPath,
					uploadFile.getAbsolutePath(), mediaPicPath, "1");
			if (flag)
				result = "{'videourl':'" + "/tempVideo/" + videoFileName
						+ "','snapshoturl','" + "tempImage/" + snapshotFileName
						+ "'}";

			baseResponse.setErrorDesc(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			baseResponse.setErrorDesc(e.getMessage());
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(baseResponse));
	}

	/**
	 * �ϴ���Ƶ�����ɿ���
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/video/videoupload.do")
	public void videoUpload(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		BaseResponse baseResponse = new BaseResponse();
		String bucketName = "adlooker";
		String filename = "";
		if (isMultipart) {
			try {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> items = upload.parseRequest(request);

				OssClientUtil clientUtil = new OssClientUtil();
				OSSClient client = clientUtil.init("MOG6VQEIxSKvrvCB",
						"K6PAK5pdESHGiOcnCo2cj6dxN2Kja7");

				String result = "";
				for (FileItem item : items) {
					if (item.isFormField()) { // �ı�
					} else { // �ļ�
						filename = item.getName();
//						filename = new String(filename.getBytes("US-ASCII"),
//								"utf-8");

						String t_ext = filename.substring(filename
								.lastIndexOf(".") + 1);
						String videoFileName = new Date().getTime() + "";
						String snapshotFileName = videoFileName + ".png";
						videoFileName = videoFileName + "." + t_ext;
						// ��ͼ��ŵ�ַ
						String mediaPicPath = request.getSession()
								.getServletContext()
								.getRealPath("/tempImage/" + snapshotFileName);

						String oldFilePath = request.getSession()
								.getServletContext()
								.getRealPath("/tempVideo/" + videoFileName);
						File uploadFile = new File(oldFilePath); // ԴĿ¼·��

						// �ϴ��ļ�
						BufferedInputStream bis = new BufferedInputStream(
								item.getInputStream());
						BufferedOutputStream bos = new BufferedOutputStream(
								new FileOutputStream(new File(oldFilePath)));
						Streams.copy(bis, bos, true);

						// �ϴ���oss
						// clientUtil.ensureBucket(client, bucketName);
						// clientUtil.uploadFile(client, bucketName, filename,
						// item.getInputStream(), item.getSize(),
						// "application/octet-stream");

						String ffmpegPath = request.getSession()
								.getServletContext()
								.getRealPath("/tools/ffmpeg/ffmpeg.exe");

						MediaDao mediaDao = DaoFactory.getMediaDao();
						boolean flag = mediaDao
								.executeCodecs(ffmpegPath,
										uploadFile.getAbsolutePath(),
										mediaPicPath, "1");

						if (flag)
						{
							SnapShotVo snapshot = new SnapShotVo(videoFileName, "/tempVideo/"+videoFileName, "tempImage/" + snapshotFileName);
							result = gson.toJson(snapshot);
						}
					}
				}

				baseResponse.setErrorDesc(result);
			} catch (Exception e) {
				e.printStackTrace();
				baseResponse.setErrorDesc(e.getMessage());
			}

			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(gson.toJson(baseResponse));
		}
	}

}