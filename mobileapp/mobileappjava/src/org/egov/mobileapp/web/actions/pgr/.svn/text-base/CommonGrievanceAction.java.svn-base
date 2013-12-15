package org.egov.mobileapp.web.actions.pgr;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import javax.mail.internet.MimeUtility;

import org.apache.log4j.Logger;
import org.apache.struts.upload.FormFile;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.egov.EGOVRuntimeException;
import org.egov.infstr.client.filter.EGOVThreadLocals;
import org.egov.lib.admbndry.Boundary;
import org.egov.lib.rjbac.user.User;
import org.egov.lib.rjbac.user.dao.UserDAO;
import org.egov.mobileapp.models.GoogleMapMarker;
import org.egov.web.actions.BaseFormAction;

import com.egov.grievance.admin.constants.Pgr_Constants;
import com.egov.grievance.admin.pojo.ComplaintGroup;
import com.egov.grievance.admin.pojo.ComplaintTypeMaster;
import com.egov.grievance.admin.pojo.Report;
import com.egov.grievance.client.ComplaintTypeID;
import com.egov.grievance.client.PGRUtil;
import com.egov.struts.grievance.GrievanceForm;

public class CommonGrievanceAction extends BaseFormAction {
	private static final long serialVersionUID = 1L;
	protected static final Logger LOGGER = Logger.getLogger(CommonGrievanceAction.class);
	protected GrievanceForm grievanceForm = new GrievanceForm();
	protected String userName;
	protected String emailId;
	protected Long latitude;
	protected Long longitude;
	protected Date grievanceDate;
	protected String categoryType;
	protected String comments;
	protected FormFile fileToUpload;
	protected Integer categoryTypeId;
	protected String mobileNumber;
	protected Integer complaintId;
	protected Report complaint = new Report();
	protected String ajaxPhoneNum;
	protected String reportView;
	protected Integer complaintTypeId;
	protected Integer complaintStatus;
	protected Integer departmentId;
	protected TreeMap<String, TreeMap<String, Long>> catMap = new TreeMap<String, TreeMap<String, Long>>();
	protected User loggedInuser;
	List<Boundary> areaList = new ArrayList<Boundary>();
	protected List<Boundary> locationList = new ArrayList<Boundary>();
	protected List<Boundary> streetList = new ArrayList<Boundary>();
	protected Integer pageSize, PageNo;
	protected String source;

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNo() {
		return PageNo;
	}

	public void setPageNo(Integer pageNo) {
		PageNo = pageNo;
	}

	public User getLoggedInuser() {
		return loggedInuser;
	}

	public void setLoggedInuser(User loggedInuser) {
		this.loggedInuser = loggedInuser;
	}

	public TreeMap<String, TreeMap<String, Long>> getCatMap() {
		return catMap;
	}

	public void setCatMap(TreeMap<String, TreeMap<String, Long>> catMap) {
		this.catMap = catMap;
	}

	private Integer complaintCategoryId;

	public Integer getComplaintCategoryId() {

		return complaintCategoryId;
	}

	public void setComplaintCategoryId(Integer complaintCategoryId) {
		this.complaintCategoryId = complaintCategoryId;
	}

	public Integer getComplaintStatus() {
		return complaintStatus;
	}

	public void setComplaintStatus(Integer complaintStatus) {
		this.complaintStatus = complaintStatus;
	}

	public Integer getComplaintTypeId() {
		return complaintTypeId;
	}

	public void setComplaintTypeId(Integer complaintTypeId) {
		this.complaintTypeId = complaintTypeId;
	}

	public String getReportView() {
		return reportView;
	}

	public void setReportView(String reportView) {
		this.reportView = reportView;
	}

	List<GoogleMapMarker> markerList = new ArrayList<GoogleMapMarker>();

	public List<GoogleMapMarker> getMarkerList() {
		return markerList;
	}

	public void setMarkerList(List<GoogleMapMarker> markerList) {
		this.markerList = markerList;
	}

	public String getAjaxPhoneNum() {
		return ajaxPhoneNum;
	}

	public void setAjaxPhoneNum(String ajaxPhoneNum) {
		this.ajaxPhoneNum = ajaxPhoneNum;
	}

	public Report getComplaint() {
		return complaint;
	}

	public void setComplaint(Report complaint) {
		this.complaint = complaint;
	}

	public Integer getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(Integer complaintId) {
		this.complaintId = complaintId;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	protected List<Report> reportlist = new ArrayList<Report>();

	public List<Report> getReportlist() {
		return reportlist;
	}

	public void setReportlist(List<Report> reportlist) {
		this.reportlist = reportlist;
	}

	protected List<ComplaintTypeMaster> complainttypelist = new ArrayList<ComplaintTypeMaster>();

	public List<ComplaintTypeMaster> getComplainttypelist() {
		return complainttypelist;
	}

	public void setComplainttypelist(List<ComplaintTypeMaster> complainttypelist) {
		this.complainttypelist = complainttypelist;
	}

	public Integer getCategoryTypeId() {
		return categoryTypeId;
	}

	public void setCategoryTypeId(Integer categoryTypeId) {
		this.categoryTypeId = categoryTypeId;
	}

	/*
	 * private File fileUpload; private String fileUploadContentType; private
	 * String fileUploadFileName;
	 */
	private Map categoryMap = new HashMap();

	public Map getCategoryMap() {
		return categoryMap;
	}

	public void setCategoryMap(Map categoryMap) {
		this.categoryMap = categoryMap;
	}

	@Override
	public Object getModel() {
		return grievanceForm;
	}

	public String getStatusReportforcomplaint() {

		return "statusreportmap";

	}

	public HashMap<Integer, String> getStatusMap() {
		EGOVThreadLocals.getUserId();
		HashMap<Integer, String> complaintstatusMap = new HashMap<Integer, String>();
		complaintstatusMap.put(2, Pgr_Constants.COMPLAINTNAME_REGISTERED);
		complaintstatusMap.put(3, Pgr_Constants.COMPLAINTNAME_FORWARDED);
		complaintstatusMap.put(4, Pgr_Constants.COMPLAINTNAME_PROCESSING);
		complaintstatusMap.put(5, Pgr_Constants.COMPLAINTNAME_COMPLETED);
		complaintstatusMap.put(6, Pgr_Constants.COMPLAINTNAME_REJECTED);
		complaintstatusMap.put(7, Pgr_Constants.COMPLAINTNAME_WITHDRAWN);
		complaintstatusMap.put(8, Pgr_Constants.COMPLAINTNAME_REOPENED);

		return complaintstatusMap;
	}

	protected void prepareGoogleMapData(List<Report> reportlist) {
		for (Report rep : reportlist) {
			GoogleMapMarker mark = new GoogleMapMarker();
			mark.setLatitude(rep.getLatitude());
			mark.setLongitude(rep.getLongitude());
			mark.setData(rep.getComplaintno());
			StringBuffer buf = new StringBuffer();
			buf.append(rep.getComplaintid()).append("^").append("Complaint No:").append(rep.getComplaintno()).append("^").append("Date: ").append(rep.getDate()).append("^")
					.append("Type: ").append(rep.getComplainttype()).append("^").append("Status:" + rep.getStatus()).append("^");
			mark.setContent(buf.toString());
			if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_REGISTERED)) {
				mark.setColour("red");
			} else if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_COMPLETED)) {
				mark.setColour("green");
			} else if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_WITHDRAWN)) {
				mark.setColour("yellow");
			} else if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_REJECTED)) {
				mark.setColour("blue");
			} else if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_FORWARDED)) {
				mark.setColour("white");
			} else if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_PROCESSING)) {
				mark.setColour("orange");
			} else if (rep.getStatus().equals(Pgr_Constants.COMPLAINTNAME_REOPENED)) {
				mark.setColour("black");
			}
			if (mark.getLatitude() != null || mark.getLatitude() != 0 && mark.getLongitude() != null || mark.getLongitude() != 0)
				if (!markerList.contains(mark))
					markerList.add(mark);
				else {
					GoogleMapMarker existingmarker = markerList.get(markerList.indexOf(mark));
					existingmarker.setColour("multiple");
					existingmarker.setContent(existingmarker.getContent() + '~' + mark.getContent());

				}
		}
	}

	public String encode(String name) {
		if (name != null) {
			byte[] bytes = new byte[name.length()];
			for (int i = 0; i < name.length(); i++) {
				bytes[i] = (byte) name.charAt(i);
			}
			try {
				name = new String(bytes, "UTF-8");
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		return name;
	}

	public static byte[] decode(byte[] b) throws Exception {
		Properties props = System.getProperties();
		props.setProperty("mail.store.protocol", "imaps");
		props.setProperty("mail.imaps.partialfetch", "false");

		ByteArrayInputStream bais = new ByteArrayInputStream(b);
		InputStream b64is = MimeUtility.decode(bais, "base64");
		byte[] tmp = new byte[b.length];
		int n = b64is.read(tmp);
		byte[] res = new byte[n];
		System.arraycopy(tmp, 0, res, 0, n);
		return res;
	}

	public static byte[] encode(byte[] b) throws Exception {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		OutputStream b64os = MimeUtility.encode(baos, "base64");
		b64os.write(b);
		b64os.close();
		return baos.toByteArray();
	}

	@Override
	@SkipValidation
	public void prepare() {

		Integer userId = EGOVThreadLocals.getUserId() != null ? Integer.parseInt(EGOVThreadLocals.getUserId()) : null;
		if (userId != null) {
			UserDAO userdao = new UserDAO();
			loggedInuser = userdao.getUserByID(userId);

		}
		List<ComplaintGroup> listmap = getComplaintGroupList();
		addDropdownData("complaintgrouplist", listmap);
		addDropdownData("complainttypelist", new ArrayList<ComplaintTypeMaster>());

		addDropdownData(Pgr_Constants.DROPDOWN_AREA_LIST, areaList);
		addDropdownData(Pgr_Constants.DROPDOWN_LOCATION_LIST, locationList);
		addDropdownData(Pgr_Constants.DROPDOWN_STREET_LIST, streetList);
	}

	public List<ComplaintGroup> getComplaintGroupList() {
		List<ComplaintGroup> listmap = new ArrayList<ComplaintGroup>();

		Map<Integer, String> complaintGroupMap = PGRUtil.getComplaintGroupMap();

		for (Map.Entry<Integer, String> entry : complaintGroupMap.entrySet()) {
			ComplaintGroup complaintGroup = new ComplaintGroup();
			complaintGroup.setComplaintGroupId(entry.getKey());
			complaintGroup.setComplaintGroupName(entry.getValue());
			listmap.add(complaintGroup);
		}
		return listmap;
	}

	@SuppressWarnings("unchecked")
	@SkipValidation
	public String complaintTypes() {

		try {
			if (getCategoryTypeId() != null) {
				complainttypelist.addAll(getComplaintTypeListByGroup(getCategoryTypeId()));

				return "ajaxcomplainttype";
			} else
				return null;
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw new EGOVRuntimeException(e.getMessage());

		}
	}

	public List<ComplaintTypeMaster> getComplaintTypeListByGroup(int categoryId) {
		Map<Integer, String> complaintTypeMap = (Map<Integer, String>) ComplaintTypeID.getComplaintTypeListByGroup(categoryId);
		List<ComplaintTypeMaster> compType = new ArrayList<ComplaintTypeMaster>();

		for (Map.Entry<Integer, String> entry : complaintTypeMap.entrySet()) {
			ComplaintTypeMaster complaintType = new ComplaintTypeMaster();
			complaintType.setComplaintTypeId(entry.getKey());
			complaintType.setComplaintTypeName(entry.getValue());
			compType.add(complaintType);
		}
		return compType;
	}

	protected String getMessage(String key) {
		return getText(key);
	}

	public GrievanceForm getGrievanceForm() {
		return grievanceForm;
	}

	public void setGrievanceForm(GrievanceForm grievanceForm) {
		this.grievanceForm = grievanceForm;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Long getLatitude() {
		return latitude;
	}

	public void setLatitude(Long latitude) {
		this.latitude = latitude;
	}

	public Long getLongitude() {
		return longitude;
	}

	public void setLongitude(Long longitude) {
		this.longitude = longitude;
	}

	public Date getGrievanceDate() {
		return grievanceDate;
	}

	public void setGrievanceDate(Date grievanceDate) {
		this.grievanceDate = grievanceDate;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public FormFile getFileToUpload() {
		return fileToUpload;
	}

	public void setFileToUpload(FormFile fileToUpload) {
		this.fileToUpload = fileToUpload;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public List<Boundary> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<Boundary> areaList) {
		this.areaList = areaList;
	}

	public List<Boundary> getLocationList() {
		return locationList;
	}

	public void setLocationList(List<Boundary> locationList) {
		this.locationList = locationList;
	}

	public List<Boundary> getStreetList() {
		return streetList;
	}

	public void setStreetList(List<Boundary> streetList) {
		this.streetList = streetList;
	}

}