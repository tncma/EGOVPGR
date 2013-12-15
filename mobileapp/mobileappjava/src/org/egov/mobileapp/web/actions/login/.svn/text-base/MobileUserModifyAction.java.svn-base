package org.egov.mobileapp.web.actions.login;

import java.util.Arrays;
import java.util.Date;

import org.apache.log4j.Logger;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletActionRedirectResult;
import org.egov.EGOVRuntimeException;
import org.egov.infstr.ValidationError;
import org.egov.infstr.ValidationException;
import org.egov.infstr.client.filter.EGOVThreadLocals;
import org.egov.infstr.security.utils.CryptoHelper;
import org.egov.lib.address.model.Address;
import org.egov.lib.rjbac.user.UserImpl;
import org.egov.mobileapp.web.actions.constants.MobileAppConstants;
import org.egov.mobileapp.web.actions.login.registration.MobileUserAction;

@Results({ @Result(name = "homepage", type = ServletActionRedirectResult.class, value = "registerGrievance", params = {"namespace", "/mobile/pgr", "method", "changePwdSuccessForm",
		"prependServletContext", "false" ,"supressEmptyParameters","true"}) })
@ParentPackage("egov")
public class MobileUserModifyAction extends MobileUserAction {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(MobileUserModifyAction.class);

	public void prepare() {
		super.prepare();
	}

	@Override
	public UserImpl getModel() {

		return user;
	}

	public MobileUserModifyAction() {
		addRelatedEntity("address", Address.class);

	}

	public String modifyForm() {
		buildPortalUserForModify();
		setMode(EDIT);
		return "regform";
	}

	public String viewForm() {
		buildPortalUserForModify();
		setMode("view");
		return "regform";
	}

	private void buildPortalUserForModify() {

		LOGGER.debug("PortalUserAction || buildPortalUserForModify || start");
		try {
			/**
			 * TODO: Instead to getting from EGOVThreadLocals, use getSession() provided
			 * in BaseFormAction, as all the EGOVThreadLocals variables are set into session
			 * in the filter 'SetSessionVarFilter'
			 * 
			 */
			LOGGER.debug(" loginUserId " + EGOVThreadLocals.getUserId());
			if (null != EGOVThreadLocals.getUserId())
				user = egiPortalUserService.getPortalUserById(Integer.parseInt(EGOVThreadLocals.getUserId()));
			if (loginUserName == null || null == user) {
				throw new EGOVRuntimeException("Portal User is not found");
			} else if (null != user && !user.getIsPortalUser()) {
				throw new EGOVRuntimeException(" User is not citizen");
			}

			setUserNameTemp(user.getUserName());

		} catch (EGOVRuntimeException ex) {
			LOGGER.error("Exception Inside buildPortalUserForModify Method" + ex.getMessage());
			if (ex != null && ex.getMessage() != null) {
				throw new ValidationException(Arrays.asList(new ValidationError(ex.getMessage(), ex.getMessage())));
			}
		}
		LOGGER.debug("PortalUserAction || buildPortalUserForModify || start");
	}

	public String changePassword() {
		LOGGER.debug("PortalUserAction || changePassword || start");
		try {
			/**
			 * TODO: Remove commented code and use getSession() of BaseFormAction 
			 */
			/*
			 * if(null!=getPortalUserId()) user =
			 * egiPortalUserServicegetPortalUserById(getPortalUserId());
			 */
			LOGGER.debug(" loginUserName " + loginUserName);
			if (null != loginUserName)
				user = egiPortalUserService.getPortalUserById(Integer.parseInt(EGOVThreadLocals.getUserId()));
			else {
				addActionError(getText("change.user.notpresent"));
				return MobileAppConstants.CHANGE_PASSWORD;
			}
		} catch (EGOVRuntimeException ex) {
			LOGGER.error("Inside changePassword Method" + ex.getMessage());
			if (ex != null && ex.getMessage() != null) {
				throw new ValidationException(Arrays.asList(new ValidationError(ex.getMessage(), ex.getMessage())));
			}
		}
		LOGGER.debug("PortalUserAction || changePassword || start");
		return MobileAppConstants.CHANGE_PASSWORD;
	}

	public String saveChangePassword() {

		LOGGER.debug("PortalUserAction || saveChangePassword || start");
		try {
			/**
			 * TODO: Use getSession() as mentioned above
			 */

			LOGGER.debug(" loginUserId " + EGOVThreadLocals.getUserId());
			if (null != EGOVThreadLocals.getUserId()) {
				user = egiPortalUserService.getPortalUserById(Integer.parseInt(EGOVThreadLocals.getUserId()));
				if (null != user) {
					if (!CryptoHelper.getDecryptedString(user.getPwd()).equalsIgnoreCase(currentPassword)) {
						LOGGER.debug("Current Password entered is incorrect! Password entered----" + currentPassword);
						addActionError(getText("change.password.incorrect.password"));
						return MobileAppConstants.CHANGE_PASSWORD;
					}else if(CryptoHelper.getDecryptedString(user.getPwd()).equalsIgnoreCase(newPassword)){
						addActionError(getText("change.password.same.password"));
						return MobileAppConstants.CHANGE_PASSWORD;
					}
					else {
						user.setPwdReminder(newPassword);
						user.setPwd(CryptoHelper.getEncryptedString(newPassword));
						user.setPwdModifiedDate(new Date());
					}
					user = egiPortalUserService.save(user);
				} else {
					addActionError(getText("change.user.notpresent"));
					return MobileAppConstants.CHANGE_PASSWORD;
				}
			} else {
				addActionError(getText("change.user.notpresent"));
				return MobileAppConstants.CHANGE_PASSWORD;
			}

		} catch (EGOVRuntimeException ex) {
			LOGGER.error("Inside saveChangePassword Method" + ex.getMessage());
			if (ex != null && ex.getMessage() != null) {
				throw new ValidationException(Arrays.asList(new ValidationError(ex.getMessage(), ex.getMessage())));
			}
		}
	
		LOGGER.debug("PortalUserAction || saveChangePassword || start");
		return "homepage";
	}

}
