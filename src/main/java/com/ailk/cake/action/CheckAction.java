package com.ailk.cake.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ailk.api.CheckIfc;
import com.ailk.api.impl.CheckManager;

@Controller
public class CheckAction extends BaseAction {

	@RequestMapping("/auth/check/saveAd.do")
	public void saveAd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.SaveAdRequest requestObj = gson.fromJson(data, CheckIfc.SaveAdRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.saveAd(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/getAds.do")
	public void getAds(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.GetAdsRequest requestObj = gson.fromJson(data, CheckIfc.GetAdsRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.getAds(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/getChecks.do")
	public void getChecks(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.GetChecksRequest requestObj = gson.fromJson(data, CheckIfc.GetChecksRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.getChecks(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/acceptPromotion.do")
	public void acceptPromotion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.AcceptPromotionRequest requestObj = gson.fromJson(data, CheckIfc.AcceptPromotionRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.acceptPromotion(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/rejectPromotion.do")
	public void rejectPromotion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.RejectPromotionRequest requestObj = gson.fromJson(data, CheckIfc.RejectPromotionRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.rejectPromotion(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/getPayRqst.do")
	public void getPayRqst(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.GetPayRequest requestObj = gson.fromJson(data, CheckIfc.GetPayRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.getPayRqst(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/acceptPayRqst.do")
	public void acceptPayRqst(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.AcceptPayRequest requestObj = gson.fromJson(data, CheckIfc.AcceptPayRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.acceptPayRqst(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/rejectPayRqst.do")
	public void rejectPayRqst(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.RejectPayRequest requestObj = gson.fromJson(data, CheckIfc.RejectPayRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.rejectPayRqst(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/getFeedback.do")
	public void getFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.GetFeedbackRequest requestObj = gson.fromJson(data, CheckIfc.GetFeedbackRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.getFeedback(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

	@RequestMapping("/auth/check/handleFeedback.do")
	public void handleFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = getParameter(request.getInputStream());
		HttpSession session = request.getSession();
		auditManager.audit(getCustId(session), data);

		CheckIfc.HandleFeedbackRequest requestObj = gson.fromJson(data, CheckIfc.HandleFeedbackRequest.class);
		CheckIfc ifc = new CheckManager();

		String result = toJson(session, requestObj, ifc.handleFeedback(session, requestObj));

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
	}

}