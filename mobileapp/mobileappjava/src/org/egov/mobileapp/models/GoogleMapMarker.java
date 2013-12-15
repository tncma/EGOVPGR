package org.egov.mobileapp.models;

public class GoogleMapMarker {

	GoogleMapMarker(Double latitude, Double longitude, String data, String colour, String content) {
		this.latitude = latitude;
		this.longitude = longitude;
		this.data = data;
		this.colour = colour;
		this.content = content;

	}
	
	@Override
	public boolean equals(Object o){

		if(o instanceof GoogleMapMarker ){
			GoogleMapMarker obj=(GoogleMapMarker)o;
			if(obj.getLatitude()!=null && obj.getLatitude().equals(this.getLatitude()) && obj.getLongitude()!=null && obj.getLongitude().equals(this.longitude)){
				return true;
			}else return false;
		}else
			return false;

	}

	public GoogleMapMarker() {
		// TODO Auto-generated constructor stub
	}

	Double latitude;

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	Double longitude;
	String data;
	String colour;
	String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

}
