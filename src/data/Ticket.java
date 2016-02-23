package data;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "tickets")


@NamedQueries({
	/*
	 * @NamedQuery(name="Attendance.getAttendancebyId", query=
	 * "select s.attendance from Student s where s.student.id = :id"),
	 */
	@NamedQuery(name = "Ticket.getAllTickets", query = "select t from Ticket t "),
	@NamedQuery(name = "Ticket.getTicketsByStudent", query = "select t from Ticket t where t.student = :student"),})


public class Ticket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ticket_id")
	private int id;

	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;

	@ManyToOne
	@JoinColumn(name = "subject_id")
	private Subject subject;

	@ManyToOne
	@JoinColumn(name = "instructor_id")
	private Instructor instructor;

	private String description;
	
	private String available;
	
	@Column(name = "status_open")
	public String statusOpen;

	
	
	public String getStatusOpen() {
		return statusOpen;
	}

	public void setStatusOpen(String statusOpen) {
		this.statusOpen = statusOpen;
	}

	private Date date;
	@Column(name = "submit_time")
	private String submitTime;
	@Column(name = "close_time")
	private String closeTime;

	public int getId() {
		return id;
	}

	public Date getDate() {
		return date;
	}

	public String getSubmitTime() {
		return submitTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public Student getStudent() {
		return student;
	}

	public Subject getSubject() {
		return subject;
	}

	public Instructor getInstructor() {
		return instructor;
	}

	public String getDescription() {
		return description;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	/*@Override
	public String toString() {
		return "Ticket [id=" + id + ", student=" + student + ", subject=" + subject + ", instructor=" + instructor
				+ ", description=" + description  + ", submitTime=" + submitTime + ", closeTime="
				+ closeTime + "]";
	}*/

	

}
