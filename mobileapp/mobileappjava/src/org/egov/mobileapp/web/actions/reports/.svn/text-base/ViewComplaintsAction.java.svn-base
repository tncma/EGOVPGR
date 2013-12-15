package org.egov.mobileapp.web.actions.reports;

import org.apache.struts2.config.ParentPackage;
import org.egov.mobileapp.web.actions.pgr.CommonGrievanceAction;

import com.egov.grievance.server.ComplaintsReportBean;

@ParentPackage("egov")
public class ViewComplaintsAction extends CommonGrievanceAction {
	private static final long serialVersionUID = 1L;

	public String getCompletedComplaints() {
		ComplaintsReportBean report = new ComplaintsReportBean();
		reportlist = report.getCompletedComplaintsbyPhoneNumber(getAjaxPhoneNum());
		return "completedComplaints";
	}
}
