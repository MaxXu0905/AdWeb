package com.ailk.cake.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ailk.api.CustIfc;
import com.ailk.api.impl.BaseResponse;
import com.ailk.api.impl.CustManager;
import com.ailk.jdbc.entity.InfoContract;
import com.ailk.jdbc.entity.InfoCust;

@Controller
public class CustAction extends BaseAction {
	
	public static final String LAST_URL_ATTR = "lastUrl";
	
	@RequestMapping("/cust/exists.do")
	public void exits(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		CustIfc.ExistsRequest requestObj = gson.fromJson(data, CustIfc.ExistsRequest.class);
		CustIfc ifc = new CustManager();
		String result = gson.toJson(ifc.exists(requestObj));
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/cust/register.do")
	public void register(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String data = getParameter(request.getInputStream());
		InfoCust requestObj = gson.fromJson(data, InfoCust.class);
		CustIfc ifc = new CustManager();
		CustIfc.RegisterResponse result = ifc.register(requestObj);
		
		if (result.getErrorCode() == 0)
			request.getSession(true).setAttribute(CustIfc.CUST_ATTR, result.getInfoCust());

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(result));
	}
	
	@RequestMapping("/cust/login.do")
	public void login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String data = getParameter(request.getInputStream());
		CustIfc.LoginRequest requestObj = gson.fromJson(data, CustIfc.LoginRequest.class);
		CustIfc ifc = new CustManager();
		CustIfc.LoginResponse result = ifc.login(requestObj);
		
		if (result.getErrorCode() == 0) {
			HttpSession session = request.getSession(true);
			session.setAttribute(CustIfc.CUST_ATTR, result.getInfoCust());
			result.setUrl((String) session.getAttribute(LAST_URL_ATTR));
		}

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(result));
	}
	
	@RequestMapping("/cust/logout.do")
	public void logout(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String data = getParameter(request.getInputStream());
		Long requestObj = gson.fromJson(data, Long.class);
		CustIfc ifc = new CustManager();
		BaseResponse result = ifc.logout(requestObj.longValue());
		
		if (result.getErrorCode() == 0) {
			HttpSession session = request.getSession();
			if (session != null)
				session.removeAttribute(CustIfc.CUST_ATTR);
		}
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(result));
	}
	
	@RequestMapping("/auth/cust/update.do")
	public void update(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		InfoCust requestObj = gson.fromJson(data, InfoCust.class);
		CustIfc ifc = new CustManager();
		CustIfc.UpdateResponse result = ifc.update(requestObj);
		
		if (result.getErrorCode() == 0)
			request.getSession(true).setAttribute(CustIfc.CUST_ATTR, result.getInfoCust());
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(gson.toJson(result));
	}
	
	@RequestMapping("/auth/cust/addContract.do")
	public void addContract(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		InfoContract requestObj = gson.fromJson(data, InfoContract.class);
		CustIfc ifc = new CustManager();
		String result = gson.toJson(ifc.addContract(requestObj));
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/auth/cust/accept.do")
	public void accept(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		CustIfc.AcceptRequest requestObj = gson.fromJson(data, CustIfc.AcceptRequest.class);
		CustIfc ifc = new CustManager();
		String result = gson.toJson(ifc.accept(requestObj));
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/auth/cust/reject.do")
	public void reject(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		CustIfc.RejectRequest requestObj = gson.fromJson(data, CustIfc.RejectRequest.class);
		CustIfc ifc = new CustManager();
		String result = gson.toJson(ifc.reject(requestObj));
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}
	
}