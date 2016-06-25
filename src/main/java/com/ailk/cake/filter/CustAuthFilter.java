package com.ailk.cake.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ailk.cake.action.BaseAction;
import com.ailk.cake.action.CustAction;
import com.ailk.api.CustIfc;
import com.ailk.api.impl.BaseResponse;
import com.ailk.jdbc.entity.InfoCust;

public class CustAuthFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpSession session = request.getSession(true);
		
		InfoCust infoCust = (InfoCust) session.getAttribute(CustIfc.CUST_ATTR);
		if (infoCust == null) {
			session.setAttribute(CustAction.LAST_URL_ATTR, request.getRequestURL().toString());

			String requestType = request.getHeader("X-Requested-With");
			if (requestType != null && requestType.equals("XMLHttpRequest")) {
				HttpServletResponse response = (HttpServletResponse) servletResponse;
				BaseResponse result = new BaseResponse();
				result.setErrorCode(BaseResponse.ENOSESSION);

				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write(BaseAction.gson.toJson(result));
			} else {
				request.getRequestDispatcher("/login.jsp").forward(servletRequest, servletResponse);
			}
		} else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void init(FilterConfig filterconfig) throws ServletException {
	}

}
