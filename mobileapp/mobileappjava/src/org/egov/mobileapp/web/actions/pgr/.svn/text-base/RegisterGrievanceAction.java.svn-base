package org.egov.mobileapp.web.actions.pgr;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import org.apache.struts2.dispatcher.StreamResult;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.egov.EGOVRuntimeException;
import org.egov.infstr.utils.DateUtils;
import org.egov.infstr.utils.GetCitizen;
import org.egov.infstr.utils.StringUtils;
import org.egov.lib.rjbac.user.dao.UserDAO;
import org.egov.mobileapp.models.MapPointPolygonFinder;
import org.egov.mobileapp.web.actions.constants.MobileAppConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.egov.grievance.admin.constants.Pgr_Constants;
import com.egov.grievance.admin.pojo.Report;
import com.egov.grievance.client.Complaint;
import com.egov.grievance.client.ComplaintHistory;
import com.egov.grievance.client.PGRUtil;
import com.egov.grievance.client.Redressal;
import com.egov.grievance.server.ComplaintManagerBean;
import com.egov.grievance.server.ComplaintsReportBean;
import com.egov.struts.grievance.RegisterGrievance;
import com.egov.struts.grievance.UpdateGrievance;
import com.egov.struts.grievance.DTO.GreViewDTO;

/**
 * 
 * @author Pradeep Kumar
 * 
 */
@Results({ @Result(name = "pagedresult", type = StreamResult.class, value = "returnStream", params = { "contentType", "text/plain" }) })
@ParentPackage("egov")
public class RegisterGrievanceAction extends CommonGrievanceAction {
	private static final long serialVersionUID = 1L;
	ComplaintHistory complaintHistory = new ComplaintHistory();
	Complaint comp = new Complaint();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
	List<Report> listComm = new ArrayList<Report>();
	private Map frequentComplaintMap;
	List<JSONObject> complaintLists = new ArrayList<JSONObject>();
	private String returnStream = "";
	private Integer totalComplaintsSize;
	private Map<Integer, String> monthMap = new HashMap<Integer, String>(0);
	private Integer searchMonth;
	private Integer searchYear;

	public Integer getSearchMonth() {
		return searchMonth;
	}

	public void setSearchMonth(Integer searchMonth) {
		this.searchMonth = searchMonth;
	}

	public Integer getSearchYear() {
		return searchYear;
	}

	public void setSearchYear(Integer searchYear) {
		this.searchYear = searchYear;
	}

	public Map<Integer, String> getMonthMap() {
		return monthMap;
	}

	public void setMonthMap(Map<Integer, String> monthMap) {
		this.monthMap = monthMap;
	}

	private List<Integer> yearList = new ArrayList<Integer>(0);

	public Integer getTotalComplaintsSize() {
		return totalComplaintsSize;
	}

	public void setTotalComplaintsSize(Integer totalComplaintsSize) {
		this.totalComplaintsSize = totalComplaintsSize;
	}

	public InputStream getReturnStream() {
		return new ByteArrayInputStream(returnStream.getBytes());

	}

	public List<JSONObject> getComplaintLists() {
		return complaintLists;
	}

	public void setComplaintLists(List<JSONObject> complaintLists) {
		this.complaintLists = complaintLists;
	}

	@SkipValidation
	public String newform() {

		grievanceForm.setComplainantFirstName(getLoggedInuser().getFirstName());
		grievanceForm.setComplainantEmail(getLoggedInuser().getEmail());
		grievanceForm.setComplainantMobileTelephone(String.valueOf(getLoggedInuser().getMobileNumber()));
		addDropdownData("complainttypelist", persistenceService.findAllBy("from EgwStatus "));
		frequentComplaintMap = PGRUtil.getFrequentComplaints();
		addDropdownData(Pgr_Constants.DROPDOWN_AREA_LIST, PGRUtil.getAllAreasList());
		return NEW;
	}

	@SkipValidation
	public String changePwdSuccessForm() {
		setSource("changePwdSuccess");
		return newform();
	}

	@SkipValidation
	public String modifyUserSuccessForm() {
		setSource("modifyUserSuccess");
		return newform();
	}

	@SkipValidation
	public String getallComplaints() {
		ComplaintsReportBean report = new ComplaintsReportBean();
		reportlist = report.getComplaintsbyPhoneNumber(getAjaxPhoneNum(), getPageSize(), getPageNo());
		setTotalComplaintsSize(report.getComplaintsbyPhoneNumber(getAjaxPhoneNum()).size());
		return "allcomplaints";
	}

	@SkipValidation
	public String getPaginatedComplaints() throws JSONException {
		ComplaintsReportBean report = new ComplaintsReportBean();
		reportlist = report.getComplaintsbyPhoneNumber(getAjaxPhoneNum(), getPageSize(), getPageNo());
		Integer totalComplaints = report.getComplaintsbyPhoneNumber(getAjaxPhoneNum()).size();
		JSONObject jsonObj = new JSONObject();
		JSONArray jArray = new JSONArray();

		for (Report reports : reportlist) {
			JSONObject childjsonObj = new JSONObject();
			childjsonObj.put("complaintno", reports.getComplaintno());
			childjsonObj.put("complainttype", reports.getComplainttype());
			childjsonObj.put("complaintdetails", reports.getComplaintdetails());
			childjsonObj.put("complaintstatus", reports.getStatus());
			childjsonObj.put("complaintId", reports.getComplaintid());
			childjsonObj.put("complaintdate", reports.getDate());
			jArray.put(childjsonObj);
		}
		jsonObj.put("complaints", jArray);
		jsonObj.put("page", getPageNo());
		jsonObj.put("pagesize", getPageSize());
		jsonObj.put("showingcomplainttotal", (getPageNo() - 1) * getPageSize() + reportlist.size());
		jsonObj.put("total", totalComplaints);
		complaintLists.add(jsonObj);
		returnStream = jsonObj.toString();
		return "pagedresult";
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String viewComplaints() {
		try {
			ComplaintsReportBean report = new ComplaintsReportBean();
			if (getMobileNumber() != null && !"".equals(getMobileNumber()))
				reportlist = report.getComplaintsbyPhoneNumber(getMobileNumber());
			else {
				addActionMessage(getMessage("NoComplaintsAvailable"));
			}

			return "viewComplaint";
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new EGOVRuntimeException(e.getMessage());

		}
	}

	@SkipValidation
	public String viewComplaintDetails() {
		try {
			ComplaintsReportBean report = new ComplaintsReportBean();
			ComplaintManagerBean compBean = new ComplaintManagerBean();
			MapPointPolygonFinder mapPointPolygonFinder = new MapPointPolygonFinder();
			if (getComplaintId() != null && !"".equals(getComplaintId())) {
				complaint = report.getComplaintbyId(getComplaintId());
			    Object assetId =	mapPointPolygonFinder.getAssetIdFromPolygon(complaint.getLatitude(), complaint.getLongitude());
				//Added the following 2 lines  for hackathon demo
			    if(assetId!=null){
				String assetname = (String)assetId;
				complaint = report.getContractorInfoForAsset(assetname,complaint);
			    }
				
				complaintHistory.execute(getComplaintId());
				while (complaintHistory.next()) {
					listComm.add(getComplaintsHistory(complaintHistory));
				}
				complaint.setLastUpdatedComment(complaintHistory.getMessage());
				compBean.ejbCreate();
				comp = compBean.getComplaint(getComplaintId());
				setComplaintId(getComplaintId());
			}
			return "complaintDetails";
		} catch (Exception e) {
			LOGGER.error(e.getMessage());

			throw new EGOVRuntimeException(e.getMessage());
		}  
	}
  
	private Report getComplaintsHistory(ComplaintHistory complaintHistory) {
		Report comHis = new Report();
		comHis.setBndry_Id_Name(complaintHistory.getBndryName());
		comHis.setCommDate(sdf.format(complaintHistory.getTimestamp()));
		comHis.setDepartmentName(complaintHistory.getDepartmentName());
		comHis.setFromUserName(complaintHistory.getFromUserName());
		comHis.setMessage(complaintHistory.getMessage());
		comHis.setRoleName(complaintHistory.getRoleName());
		comHis.setStatusName(complaintHistory.getStatusName());
		comHis.setToUserName(complaintHistory.getToUserName());
		return comHis;

	}

	@SkipValidation
	public String updateComments() {
		ComplaintManagerBean compBean = new ComplaintManagerBean();
		String message = "";
		GreViewDTO greViewDTO = new GreViewDTO();
		try {
			if (getComments() != null) {
				Integer userid = (Integer) getSession().get(MobileAppConstants.MOBILE_SESSION_VAR_LOGIN_USER_ID);
				String cityid = (String) getSession().get(MobileAppConstants.MOBILE_SESSION_VAR_TOP_BNDRY_ID);
				int citID = 0;
				if (cityid != null && !cityid.equals("0")) {
					citID = Integer.parseInt(cityid);
				}
				if (userid != null) {
					getSession().put(MobileAppConstants.MOBILE_USERID, userid);
				}
				compBean.ejbCreate();
				if (getComplaintId() != null && !"".equals(getComplaintId())) {
					comp = compBean.getComplaint(getComplaintId());
					Redressal redressal = compBean.getRedressalByComplaint(getComplaintId());
					greViewDTO.setComplaintId(getComplaintId());
					greViewDTO.setRedressalId(redressal.getRedressalOfficerID());
					greViewDTO.setComplaintStatusID(redressal.getComplaintStatusID());
					greViewDTO.setDepartmentID(comp.getDeptid());
					greViewDTO.setComplaintType(comp.getComplaintType_Int());
					greViewDTO.setMessage1(getComments());
					greViewDTO.setAdminBndry1(citID);
					UpdateGrievance update = new UpdateGrievance();
					message = update.updateComplaint(greViewDTO, ServletActionContext.getRequest(), citID, userid);
				}
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new EGOVRuntimeException(e.getMessage());
		}
		if (message == null || message.equals("")) {
			return "update";
		} else {
			return ERROR;
		}
	}

	public String save() {
		LOGGER.info(" fileToUpload (((((( " + grievanceForm.getFileUpload());
		RegisterGrievance registerGrievance = new RegisterGrievance();
		String complaintNo = "";
		try {
			Object bndryid = (Object) getSession().get(MobileAppConstants.MOBILE_SESSION_VAR_TOP_BNDRY_ID);
			String bndry = (String) bndryid;
			int bndID = Integer.parseInt(bndry);
			Integer userid = (Integer) getSession().get(MobileAppConstants.MOBILE_SESSION_VAR_LOGIN_USER_ID);

			if (userid == null) {
				int citizen = GetCitizen.getCitizen().intValue();
				getSession().put(MobileAppConstants.MOBILE_SESSION_VAR_LOGIN_USER_ID, new Integer(citizen));
				getSession().put(MobileAppConstants.MOBILE_SESSION_VAR_LOGIN_USER_NAME, "Complainant");
				getSession().put(MobileAppConstants.MOBILE_USERID, citizen);
			} else {
				getSession().put(MobileAppConstants.MOBILE_USERID, userid);
			}
			LOGGER.info("Grievance Form image details: " + grievanceForm.getImageDetail());
			if (grievanceForm.getImageDetail() != null) {
				complaintNo = registerGrievance.insertValues(grievanceForm, ServletActionContext.getRequest(), bndID);
				complaint.setComplaintno(complaintNo);
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new EGOVRuntimeException(e.getMessage());
		}
		if (complaintNo != null && !complaintNo.equals("")) {
			return SUCCESS;
		}
		return NEW;
	}

	@SkipValidation
	public String showComplaintonMap() {

		monthMap = DateUtils.getAllMonthsWithFullNames();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, -10);

		for (int i = 0; i < 10; i++) {
			cal.add(Calendar.YEAR, 1);
			yearList.add(cal.get(Calendar.YEAR));
		}

		addDropdownData("yearlist", yearList);
		return "searchComplaintforMap";
	}

	@SkipValidation
	public String getallComplaintsforMap() {
		Integer userid = (Integer) getSession().get(MobileAppConstants.MOBILE_SESSION_VAR_LOGIN_USER_ID);
		if (userid != null) {
			UserDAO userdao = new UserDAO();
			loggedInuser = userdao.getUserByID(userid);

		}
		setMobileNumber(loggedInuser.getMobileNumber());
		return "complaintonmap";
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String getMarkersforMap() {
		ComplaintsReportBean report = new ComplaintsReportBean();
		if (getMobileNumber() != null && !"".equals(getMobileNumber())) {
			if (getSearchMonth() != null && getSearchMonth() != -1 && getSearchYear() != null && getSearchYear() != -1) {
				String startdate = "01" + "/" + getSearchMonth() + "/" + getSearchYear();
				Date firstDate = DateUtils.getDate(getSearchYear(), getSearchMonth() - 1, 1);
				Date endDate = DateUtils.getLastDateOfMonth(firstDate);
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
				String enddate = formatter.format(endDate);
				reportlist = report.getComplaintsbyPhoneNumber(getMobileNumber(), startdate, enddate);
			} else
				reportlist = report.getComplaintsbyPhoneNumber(getMobileNumber());
			
			prepareGoogleMapData(reportlist);

		}
		return "allcomplaintsmap";
	}



	public ComplaintHistory getComplaintHistory() {
		return complaintHistory;
	}

	public void setComplaintHistory(ComplaintHistory complaintHistory) {
		this.complaintHistory = complaintHistory;
	}

	public Complaint getComp() {
		return comp;
	}

	public void setComp(Complaint comp) {
		this.comp = comp;
	}

	public List<Report> getListComm() {
		return listComm;
	}

	public void setListComm(List<Report> listComm) {
		this.listComm = listComm;
	}

	public Map getFrequentComplaintMap() {
		return frequentComplaintMap;
	}

	public void setFrequentComplaintMap(Map frequentComplaintMap) {
		this.frequentComplaintMap = frequentComplaintMap;
	}

	@Override
	public void validate() {
		super.validate();
		if ((StringUtils.isBlank(grievanceForm.getTop5ComplaintTypes()) || grievanceForm.getTop5ComplaintTypes().equals(-1))
				&& (StringUtils.isBlank(grievanceForm.getComplaintype1()) || grievanceForm.getComplaintype1().equals(-1))) {
			addActionError("ComplaintType is Required");
		}
	}
}