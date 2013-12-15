package org.egov.mobileapp.web.actions.login.registration;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.ServletActionRedirectResult;
import org.apache.struts2.dispatcher.StreamResult;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.egov.EGOVRuntimeException;
import org.egov.infstr.ValidationError;
import org.egov.infstr.ValidationException;
import org.egov.infstr.client.filter.EGOVThreadLocals;
import org.egov.infstr.security.utils.CryptoHelper;
import org.egov.infstr.utils.StringUtils;
import org.egov.infstr.utils.UtilityMethods;
import org.egov.lib.admbndry.CityWebsite;
import org.egov.lib.admbndry.CityWebsiteDAO;
import org.egov.lib.rjbac.user.UserImpl;
import org.egov.lib.rjbac.user.UserRole;
import org.egov.lib.rjbac.user.dao.UserDAO;
import org.egov.mobileapp.web.actions.constants.MobileAppConstants;
import org.egov.portal.services.PortalUserRegistrationService;
import org.egov.web.actions.BaseFormAction;
import org.egov.web.annotation.ValidationErrorPage;

@Results({
		@Result(name = "modify", type = ServletActionRedirectResult.class, value = "registerGrievance", params = { "namespace", "/mobile/pgr", "method", "modifyUserSuccessForm",
				"prependServletContext", "false" }),
		@Result(name = MobileAppConstants.AJAX_RESULT, type = StreamResult.class, value = "returnStream", params = { "contentType", "text/plain" }) })
@ParentPackage("egov")
public class MobileUserAction extends BaseFormAction {
	private static final long serialVersionUID = 1L;
	protected UserImpl user = new UserImpl();
	private static final Logger LOGGER = Logger.getLogger(MobileUserAction.class);
	private String mode;
	private Set<UserRole> userRolesSet = null;
	protected PortalUserRegistrationService egiPortalUserService;
	private String todaysDate;
	private String ipAddress;
	protected String loginUserName;
	private transient CityWebsiteDAO cityWebsiteDAO;
	private String cityName;
	private String logoName;
	private String userNameCheck;
	private String returnStream = "";
	private String registeredUserName;
	private String device;
	protected String currentPassword;
	protected String newPassword;
	protected String userNameTemp;
	public UserDAO userDao;
	public String addressdetail;
	private String deviceUser;
	



	public String getAddressdetail() {
		StringBuffer addressdtl = new StringBuffer(getModel().getAddress().getStreetAddress1());
		addressdtl.append(",");
		addressdtl.append(getModel().getAddress().getLocality());
		return addressdtl.toString();
	}

	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}

	public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	public String getUserNameTemp() {
		return userNameTemp;
	}

	public void setUserNameTemp(String userNameTemp) {
		this.userNameTemp = userNameTemp;
	}

	@Override
	public UserImpl getModel() {

		return user;
	}

	public String loginForm() {
		LOGGER.info("MOBILELOGIN "+"BROWSERUSED "+ServletActionContext.getRequest().getHeader("user-agent"));
		return LOGIN;
	}

	public void prepare() {
		super.prepare();
		final HttpServletRequest req = ServletActionContext.getRequest();
		final HttpSession session = req.getSession();
		loginUserName = (String) session.getAttribute("com.egov.user.LoginUserName");

		if (session.getAttribute("cityurl") != null && !"".equals(session.getAttribute("cityurl"))) {
			CityWebsite cityWebsite = cityWebsiteDAO.getCityWebSiteByURL((String) session.getAttribute("cityurl"));
			if (cityWebsite != null) {
				cityName = cityWebsite.getCityName();
				logoName = cityWebsite.getLogo();
			}
		}
		ipAddress = req.getRemoteAddr();
		String proxiedIPAddress = req.getHeader("X-Forwarded-For");
		if (StringUtils.isNotBlank(proxiedIPAddress)) {
			String[] ipAddresses = proxiedIPAddress.split(",");
			ipAddress = ipAddresses[ipAddresses.length - 1].trim();
		}

		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
		todaysDate = dateFormatter.format(new Date());
		setDevice("mobile");
		setDeviceUser("citizen");
	}

	@SkipValidation
	public String regform() {
		return "regform";
	}

	public String checkUniquenessForUserName() {
		boolean userNameValidityStatus = egiPortalUserService.checkUniquenessForUserName(userNameCheck);
		if (userNameValidityStatus)
			returnStream = "true";
		else
			returnStream = "false";

		return MobileAppConstants.AJAX_RESULT;
	}

	public String checkForPortalUserLogin() {
		boolean userNameValidityStatus = egiPortalUserService.checkForPortalUserLogin(userNameCheck);
		if (userNameValidityStatus)
			returnStream = "true";
		else
			returnStream = "false";

		return MobileAppConstants.AJAX_RESULT;
	}

	public String save() {
		LOGGER.debug("MobileLoginAction || save || start");
		try {
			user.setOrganization(null);
			LOGGER.debug("Mode " + getMode());
			if (null != user && null != user.getId()) {
				user.getUserRoles().clear();
				userRolesSet = new HashSet<UserRole>(egiPortalUserService.getUserRoleListByUser(user));
				if (null != userRolesSet && !userRolesSet.isEmpty())
					user.setUserRoles(userRolesSet);
			}
			if (getMode().equals("edit")) {
				String pwd = CryptoHelper.getDecryptedString(userDao.getUserByID(Integer.parseInt(EGOVThreadLocals.getUserId())).getPwd());
				user.setPwd(CryptoHelper.getEncryptedString(pwd));
			}
			user = egiPortalUserService.save(user);

		} catch (EGOVRuntimeException ex) {
			LOGGER.error("Inside save  Method" + ex.getMessage());
			if (ex != null && ex.getMessage() != null) {
				throw new ValidationException(Arrays.asList(new ValidationError(ex.getMessage(), ex.getMessage())));
			}
		}
		LOGGER.debug("MobileLoginAction || save || end");
		if (getMode().equals("edit"))
			return "modify";
		else
			return "loginsuccess";
	}

	public String resetPassword() {
		return MobileAppConstants.RESET_PASSWORD;
	}

	@ValidationErrorPage(value = MobileAppConstants.RESET_PASSWORD)
	public String generateNewPassword() {
		LOGGER.debug("PortalUserAction || generateNewPassword || start");
		try {
			LOGGER.debug("UserName " + user.getUserName());
			UserImpl portaluser = egiPortalUserService.getPortalUserByName(user.getUserName());
			if (portaluser == null) {
				addActionError(getText("reset.password.emailid.notpresent"));
				return MobileAppConstants.RESET_PASSWORD;
			}

			String newPassword = new StringBuffer(UtilityMethods.getRandomString()).reverse().toString() + UtilityMethods.getRandomString();
			portaluser.setPwdReminder(newPassword);
			portaluser.setPwd(CryptoHelper.getEncryptedString(newPassword));
			portaluser.setPwdModifiedDate(new Date());
			user = egiPortalUserService.save(portaluser);
			if (user != null) {
				egiPortalUserService.sendEmail(user.getUserName(),
						getText("registration.reset.password.body", new String[] { user.getUserName(), newPassword, getText("reports.title.corporation_name") }),
						getText("registration.reset.password.subject"));
			}
			setMode(MobileAppConstants.VIEW);
		} catch (EGOVRuntimeException ex) {
			LOGGER.error("Inside generateNewPassword  Method" + ex.getMessage());
			if (ex != null && ex.getMessage() != null) {
				throw new ValidationException(Arrays.asList(new ValidationError(ex.getMessage(), ex.getMessage())));
			}
		}
		LOGGER.debug("PortalUserAction || generateNewPassword || start");
		return MobileAppConstants.RESET_PASSWORD;
	}

	public InputStream getReturnStream() {
		return new ByteArrayInputStream(returnStream.getBytes());

	}

	public String getTodaysDate() {
		return todaysDate;
	}

	public void setTodaysDate(String todaysDate) {
		this.todaysDate = todaysDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getLoginUserName() {
		return loginUserName;
	}

	public void setLoginUserName(String loginUserName) {
		this.loginUserName = loginUserName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getLogoName() {
		return logoName;
	}

	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}

	public PortalUserRegistrationService getEgiPortalUserService() {
		return egiPortalUserService;
	}

	public void setEgiPortalUserService(PortalUserRegistrationService egiPortalUserService) {
		this.egiPortalUserService = egiPortalUserService;
	}

	public String getUserNameCheck() {
		return userNameCheck;
	}

	public void setUserNameCheck(String userNameCheck) {
		this.userNameCheck = userNameCheck;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public CityWebsiteDAO getCityWebsiteDAO() {
		return cityWebsiteDAO;
	}

	public void setCityWebsiteDAO(CityWebsiteDAO cityWebsiteDAO) {
		this.cityWebsiteDAO = cityWebsiteDAO;
	}

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getRegisteredUserName() {
		return registeredUserName;
	}

	public void setRegisteredUserName(String registeredUserName) {
		this.registeredUserName = registeredUserName;
	}

	public String getDeviceUser() {
		return deviceUser;
	}

	public void setDeviceUser(String deviceUser) {
		this.deviceUser = deviceUser;
	}

}
