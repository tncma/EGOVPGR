package org.egov.mobileapp.web.actions.pgr;

import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.dispatcher.ServletRedirectResult;
import org.egov.EGOVRuntimeException;
import org.egov.lib.admbndry.Boundary;
import org.egov.lib.admbndry.BoundaryDAO;
import org.egov.mobileapp.web.actions.constants.MobileAppConstants;
import org.egov.web.actions.BaseFormAction;

import com.opensymphony.xwork2.Action;

/**
 * The Class AjaxCommonPGRAction. to carry out changes like loading select box,
 * validating the selected or entered data w.r.t user action in the UI
 */
@Result(name = Action.SUCCESS, type = ServletRedirectResult.class, value = "AjaxCommonPGRAction.action")
@ParentPackage("egov")
public class AjaxCommonPGRAction extends BaseFormAction {

	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger.getLogger(AjaxCommonPGRAction.class);

	// String Literals used in Action Errors

	private int divisionId; // Set by Ajax call

	private int areaId; // Set by Ajax call

	private int locationId; // Set by Ajax call

	private List<Boundary> locationList = new LinkedList<Boundary>();

	private List<Boundary> areaList = new LinkedList<Boundary>();

	private List<Boundary> streetList = new LinkedList<Boundary>();

	private String query;

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public List<Boundary> getLocationList() {
		return locationList;
	}

	public List<Boundary> getStreetList() {
		return streetList;
	}

	public List<Boundary> getAreaList() {
		return areaList;
	}

	public String execute() {
		return SUCCESS;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public void setDivisionId(int divisionId) {
		this.divisionId = divisionId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	/**
	 * Populate the location list by area.
	 * 
	 * @return the string
	 */
	public String populateLocations() {
		try {
			locationList = new BoundaryDAO().getChildBoundaries(String.valueOf(areaId));
		} catch (Exception e) {
			LOGGER.error("populateLocations() - Error while loading locations." + e.getMessage());
			addFieldError(MobileAppConstants.LOCATION, "Unable to load location information");
			throw new EGOVRuntimeException("Unable to load location information", e);
		}
		return MobileAppConstants.LOCATIONS;
	}

	/**
	 * Populate streets.
	 * 
	 * @return the string
	 */
	public String populateStreets() {
		try {
			streetList = new BoundaryDAO().getChildBoundaries(String.valueOf(locationId));
		} catch (Exception e) {
			LOGGER.error("populateStreets() - Error while loading streets." + e.getMessage());
			addFieldError(MobileAppConstants.LOCATION, "Unable to load street information");
			throw new EGOVRuntimeException("Unable to load street information", e);
		}
		return MobileAppConstants.STREETS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
