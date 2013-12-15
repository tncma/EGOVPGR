/*
 * @(#)HomepageAction.java 1.0 5 Aug, 2010 4:17:18 PM 
 * Copyright 2009 eGovernments Foundations. All rights reserved. 
 * eGov PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package org.egov.mobileapp.web.actions.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.ParentPackage;
import org.egov.EGOVRuntimeException;
import org.egov.infstr.client.filter.EGOVThreadLocals;
import org.egov.infstr.commons.Module;
import org.egov.infstr.commons.dao.ModuleDao;
import org.egov.lib.admbndry.Boundary;
import org.egov.lib.admbndry.CityWebsite;
import org.egov.lib.admbndry.CityWebsiteDAO;
import org.egov.lib.admbndry.ejb.api.BoundaryManager;
import org.egov.lib.rjbac.user.User;
import org.egov.lib.rjbac.user.ejb.api.UserManager;
import org.egov.web.actions.BaseFormAction;

/**
 * The Class HomepageAction. ERP Mobile Page Rendering
 */
@ParentPackage("egov")
public class MobileHomepageAction extends BaseFormAction {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger
			.getLogger(MobileHomepageAction.class);
	private transient CityWebsiteDAO cityWebsiteDAO;
	private transient BoundaryManager boundaryManager;
	private transient UserManager userManager;
	private transient ModuleDao moduleDAO;
	Map<String, Object> homePageInfoMap = null;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.ModelDriven#getModel()
	 */
	@Override
	public Object getModel() {
		return null;
	}

	/**
	 * Invokes automatically after successful user login.
	 * 
	 * @return the string
	 */
	@Override
	public String execute() {
		String status = ERROR;
		try {
			/**
			 * TODO: 
			 * 1. Instead to getting from EGOVThreadLocals, use getSession() provided
			 * in BaseFormAction, as all the EGOVThreadLocals variables are set into session
			 * in the filter 'SetSessionVarFilter'
			 * 
			 * 2. Use getSession() of BaseFormAction in place HttpSession
			 * 
			 */
			final HttpServletRequest req = ServletActionContext.getRequest();
			final HttpSession session = req.getSession();
			final Boundary boundary = boundaryManager.getBoundary(Integer
					.valueOf((String) session
							.getAttribute("org.egov.topBndryID")));
			if (boundary == null) {
				throw new EGOVRuntimeException("City does not found");
			}
			final CityWebsite cityWebsite = cityWebsiteDAO
					.getCityWebSiteByURL((String) session
							.getAttribute("cityurl"));
			if (cityWebsite == null) {
				throw new EGOVRuntimeException("City Website does not found");
			}
			final User user = userManager.getUserByID(Integer.valueOf(EGOVThreadLocals.getUserId()));
			if (user == null) {
				throw new EGOVRuntimeException("User does not found");
			}
			/**
			 * TODO: Remove unused variable username
			 */
			final String userName = user.getUserName() == null ? "Anonymous"
					: user.getUserName();
			if (LOGGER.isDebugEnabled()) {
				LOGGER.debug("execute : User - " + user.getUserName()
						+ " UserRoles - " + user.getRoles());
			}
			List<Module> moduleBeanList = moduleDAO
					.getModuleInfoForRoleIds(user.getRoles());
			if (LOGGER.isDebugEnabled()) {
				LOGGER.debug("execute : moduleBeanList - " + moduleBeanList);
			}
			List<Module> moduleList =  new ArrayList<Module>();
			/**
			 * TODO: Use generic Iterator instead i.e.,   Iterator<Module>
			 */
			
			Iterator itr = moduleBeanList.iterator();
			while (itr.hasNext()) {
				Module mod = (Module) itr.next();
				if (mod.getModuleName().equalsIgnoreCase("PGR")) {
					moduleList.add(mod);
				}
			}
			homePageInfoMap = new HashMap<String, Object>();
			for(Module mod: moduleList )
			homePageInfoMap.put(mod.getModuleName(), "../pgr/grievance!userform.action");
			status = SUCCESS;
		} catch (final EGOVRuntimeException e) {
			LOGGER.error(
					"Error occurred while preparing Mobile Home Page, Cause : "
							+ e.getMessage(), e);
		} catch (final Exception e) {
			LOGGER.error(
					"Error occurred while preparing Mobile Home Page, Cause : "
							+ e.getMessage(), e);
		}
		return status;
	}

	/**
	 * Sets the boundary manager.
	 * 
	 * @param boundaryManager
	 *            the new boundary manager
	 */
	public void setBoundaryManager(final BoundaryManager boundaryManager) {
		this.boundaryManager = boundaryManager;
	}

	/**
	 * Sets the city website dao.
	 * 
	 * @param cityWebsiteDAO
	 *            the new city website dao
	 */
	public void setCityWebsiteDAO(final CityWebsiteDAO cityWebsiteDAO) {
		this.cityWebsiteDAO = cityWebsiteDAO;
	}

	/**
	 * Sets the module dao.
	 * 
	 * @param moduleDAO
	 *            the new module dao
	 */
	public void setModuleDAO(final ModuleDao moduleDAO) {
		this.moduleDAO = moduleDAO;
	}

	/**
	 * Sets the user manager.
	 * 
	 * @param userManager
	 *            the new user manager
	 */
	public void setUserManager(final UserManager userManager) {
		this.userManager = userManager;
	}

	public Map<String, Object> getHomePageInfoMap() {
		return homePageInfoMap;
	}

	public void setHomePageInfoMap(Map<String, Object> homePageInfoMap) {
		this.homePageInfoMap = homePageInfoMap;
	}

}
