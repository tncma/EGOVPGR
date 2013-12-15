package org.egov.mobileapp.web.actions.pgr;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.egov.EGOVRuntimeException;
import org.egov.mobileapp.web.actions.constants.MobileAppConstants;

import com.egov.grievance.admin.pojo.Report;
import com.egov.grievance.client.Complaint;
import com.egov.grievance.client.ComplaintStatus;
import com.egov.grievance.client.Redressal;
import com.egov.grievance.server.ComplaintsReportBean;
import com.egov.struts.grievance.delegate.ComplaintDelegate;

public class GrievanceAction extends CommonGrievanceAction {
	private static final long serialVersionUID = 1L;

	public String userform() {
		addDropdownData("complainttypelist", new ArrayList<String>(0));
		return "user";
	}

	public String getReportForComplaint() {

		ComplaintsReportBean report = new ComplaintsReportBean();
		if (getReportView() != null && getReportView().equals("chart")) {
			reportlist = report.getTotalComplaintsbyType(getComplaintTypeId());
			return "report";
		} else if (getReportView() != null
				&& getReportView().equals("piechart")) {
			reportlist = report.getTotalComplaintsbyType(getComplaintTypeId());
			return "piechart";
		} else {
			return "reportmap";
		}
	}

	public String getreportbyCategory() {

		ComplaintsReportBean report = new ComplaintsReportBean();

		catMap.put("Health", new TreeMap<String, Long>());
		catMap.put("General", new TreeMap<String, Long>());
		catMap.put("Engineering", new TreeMap<String, Long>());
		catMap.put("Revenue", new TreeMap<String, Long>());
		catMap.put("Solid Waste Management", new TreeMap<String, Long>());
		reportlist = report
				.getTotalComplaintsbyCategory(getComplaintCategoryId());

		for (Report rep : reportlist) {
			TreeMap<String, Long> reportsMap = catMap.get(rep
					.getComplainttype());
			reportsMap.put(rep.getStatus(), rep.getComplaintid());

		}
		return "reportList";

	}

	public String getMarkersforReportMap() {
		ComplaintsReportBean report = new ComplaintsReportBean();
		reportlist = report.getComplaintsbyType(getComplaintTypeId());
		prepareGoogleMapData(reportlist);
		return "allcomplaintsmap";

	}

	public String getMarkersforStatusReportMap() {
		ComplaintsReportBean report = new ComplaintsReportBean();
		reportlist = report.getTotalComplaintsbyStatusType(
				getComplaintTypeId(), getComplaintStatus());
		prepareGoogleMapData(reportlist);
		return "allcomplaintsmap";

	}

	@SkipValidation
	public String viewUserComplaints() {
		try {
			ComplaintDelegate complaintDelegate = null;
			Integer userid = (Integer) getSession().get(
					MobileAppConstants.MOBILE_SESSION_VAR_LOGIN_USER_ID);
			String cityid = (String) getSession().get(
					MobileAppConstants.MOBILE_SESSION_VAR_TOP_BNDRY_ID);
			int toplevelbndryID = 0;
			if (cityid != null && !cityid.equals("0")) {
				toplevelbndryID = Integer.parseInt(cityid);
			}
			if (userid != null) {
				getSession().put(MobileAppConstants.MOBILE_USERID, userid);
			}
			complaintDelegate = ComplaintDelegate.getInstance();
			List complaintsByUser = complaintDelegate.getAllNotCompleatedComplaintsByUserandTopLevelBndryID(
							userid, toplevelbndryID);
			ComplaintsReportBean reportBean = new ComplaintsReportBean();
			reportlist = reportBean.getAllComplaintsReportList(complaintDelegate, complaintsByUser);

			return "viewComplaintsList";
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new EGOVRuntimeException(e.getMessage());

		}
	}
	
	public String getStatusReportForComplaint() {
		
		return "statusreportmap";
		
	}
}
