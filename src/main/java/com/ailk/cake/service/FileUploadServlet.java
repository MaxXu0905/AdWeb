package com.ailk.cake.service;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ailk.cake.frame.util.OssClientUtil;
import com.aliyun.openservices.oss.OSSClient;


public class FileUploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FileUploadServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (isMultipart) {
			try {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> items = upload.parseRequest(request);

				OssClientUtil clientUtil = new OssClientUtil();
				OSSClient client = clientUtil.init("MOG6VQEIxSKvrvCB", "K6PAK5pdESHGiOcnCo2cj6dxN2Kja7");
				
				String bucketName = "adlooker";
				String basePath = getServletContext().getRealPath("/tempVideo");
				System.out.println(basePath);
				
				for (FileItem item : items) {
					if(item.isFormField()){ // 文本
						String name = item.getFieldName();
						String value = item.getString();
					}else { // 文件
						String filename = item.getName();
						filename = new String(filename.getBytes("ISO-8859-1"), "utf-8");
						
						clientUtil.ensureBucket(client, bucketName);
						
						clientUtil.uploadFile(client,  bucketName,filename, item.getInputStream(),item.getSize(),"image/jpeg");
						// 获取配置的转换工具（ffmpeg.exe）的存放路径
						
						String pathname = getServletContext().getRealPath("tempVideo.png");
						
                        String ffmpegPath = getServletContext().getRealPath("/tools/ffmpeg.exe");
                        
                        System.out.println(pathname + "    "+ffmpegPath);
                        
                        //MediaDao mediaDao = DaoFactory.getMediaDao();
                        //File uploadFile = new File(pathname);
                       // flag = mediaDao.executeCodecs(ffmpegPath, uploadFile.getAbsolutePath(), codcFilePath, mediaPicPath);
						
						String callback = request.getParameter("CKEditorFuncNum"); 
						PrintWriter out = response.getWriter();  				
						out.println("<script type=\"text/javascript\">");  
						out.println("window.parent.CKEDITOR.tools.callFunction("+ callback + ",'" +"http://"+bucketName+".oss.aliyuncs.com/"+ filename + "','')");   
						out.println("</script>");  
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String result = "";
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(result);
		}
	}

	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
