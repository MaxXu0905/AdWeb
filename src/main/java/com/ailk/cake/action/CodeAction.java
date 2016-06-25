package com.ailk.cake.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ailk.api.CodeIfc;
import com.ailk.api.impl.CodeManager;

@Controller
public class CodeAction extends BaseAction {
	
	@RequestMapping("/code/getGroup.do")
	public void getGroup(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String parameter = getParameter(request.getInputStream());
		String requestObj = gson.fromJson(parameter, String.class);
		CodeIfc ifc = new CodeManager();
		
		String result = gson.toJson(ifc.getGroup(requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/code/addGroup.do")
	public void addGroup(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String parameter = getParameter(request.getInputStream());
		CodeIfc.GroupRequest requestObj = gson.fromJson(parameter, CodeIfc.GroupRequest.class);
		CodeIfc ifc = new CodeManager();
		
		String result = gson.toJson(ifc.setGroup(requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/code/getCode.do")
	public void getCode(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String parameter = getParameter(request.getInputStream());
		CodeIfc.CodeRequest requestObj = gson.fromJson(parameter, CodeIfc.CodeRequest.class);
		CodeIfc ifc = new CodeManager();
		
		String result = gson.toJson(ifc.getCode(requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/code/getCities.do")
	public void getCities(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CodeIfc ifc = new CodeManager();
		String result = gson.toJson(ifc.getCities());
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/code/getPeriods.do")
	public void getPeriods(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CodeIfc ifc = new CodeManager();
		String result = gson.toJson(ifc.getPeriods());
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

}