package com.vo;

import java.util.Date;

public class Match {
	private Long ID;
	private String match_name;
	private String match_type;
	private String applicant;
	private String reviewer;
	private Date match_time;
	private String place;
	private String recorder;
	private String result;
	private String state;
	
	private String timeA;
	private String timeB;
	
	public Long getID() {
		return ID;
	}
	public void setID(Long ID) {
		this.ID = ID;
	}

	public String getmatch_name() {
		return match_name;
	}
	public void setmatch_name(String match_name) {
		this.match_name = match_name;
	}

	public String getmatch_type() {
		return match_type;
	}
	public void setmatch_type(String match_type) {
		this.match_type = match_type;
	}

	public String getapplicant() {
		return applicant;
	}
	public void setapplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getreviewer() {
		return reviewer;
	}
	public void setreviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	public Date getmatch_time() {
		return match_time;
	}
	public void setmatch_time(Date match_time) {
		this.match_time = match_time;
	}

	public String getplace() {
		return place;
	}
	public void setplace(String place) {
		this.place = place;
	}

	public String getrecorder() {
		return recorder;
	}
	public void setrecorder(String recorder) {
		this.recorder = recorder;
	}

	public String getresult() {
		return result;
	}
	public void setresult(String result) {
		this.result = result;
	}

	public String getstate() {
		return state;
	}
	public void setstate(String state) {
		this.state = state;
	}
	
	public String gettimeA() {
		return timeA;
	}
	public void settimeA(String timeA) {
		this.timeA = timeA;
	}
	
	public String gettimeB() {
		return timeB;
	}
	public void settimeB(String timeB) {
		this.timeB = timeB;
	}

}
