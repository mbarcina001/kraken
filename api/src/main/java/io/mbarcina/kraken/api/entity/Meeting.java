package io.mbarcina.kraken.api.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "meeting")
public class Meeting {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "description")
	private String description;

	@Column(name = "meeting_start_date")
	private Date meetingStartDate;

	@Column(name = "meeting_end_date")
	private Date meetingEndDate;
	
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	@ManyToOne(fetch = FetchType.LAZY, optional=false)
	@JoinColumn(name="organiser_id")
	private Attendant organiser;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade={CascadeType.MERGE })
	@JoinTable(
		name = "meeting_attendant",
		joinColumns = @JoinColumn(name="meeting_id", referencedColumnName="id"),
		inverseJoinColumns = @JoinColumn(name="user_id", referencedColumnName="id")
	)
	private List<Attendant> attendantList;

	public Meeting() {
		this.attendantList = new ArrayList<Attendant>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getMeetingStartDate() {
		return meetingStartDate;
	}

	public void setMeetingStartDate(Date meetingStartDate) {
		this.meetingStartDate = meetingStartDate;
	}

	public Date getMeetingEndDate() {
		return meetingEndDate;
	}

	public void setMeetingEndDate(Date meetingEndDate) {
		this.meetingEndDate = meetingEndDate;
	}

	public Attendant getOrganiser() {
		return organiser;
	}

	public void setOrganiser(Attendant organiser) {
		this.organiser = organiser;
	}

	public List<Attendant> getAttendantList() {
		return attendantList;
	}

	public void setAttendantList(List<Attendant> attendantList) {
		this.attendantList = attendantList;
	}

	@Override
	public String toString() {
		return "Meeting [id=" + id + ", description=" + description + ", meetingStartDate=" + meetingStartDate + ", "
				+ "meetingEndDate=" + meetingEndDate + ", organiser=" + organiser + ", attendantList=" + attendantList + "]";
	}

	public void addAttendant(Attendant pAttendant) {
		this.attendantList.add(pAttendant);
	}
}
