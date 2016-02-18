package data;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tickets")
public class HelpTicket {
	@Column(name = "ticket_id")
	private int ticketID;

	@Id
	@Column(name = "student_id")
	private int studentID;

	@Column(name = "subject_id")
	private int subjectID;

	@Column(name = "instructor_id")
	private int instructorID;

	@Column(name = "description")
	private String description;

	private String available = "Available";

	public int getTicketID() {
		return ticketID;
	}

	public int getStudentID() {
		return studentID;
	}

	public int getSubjectID() {
		return subjectID;
	}

	public int getInstructorID() {
		return instructorID;
	}

	public String getDescription() {
		return description;
	}

	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public void setSubjectID(int subjectID) {
		this.subjectID = subjectID;
	}

	public void setInstructorID(int instructorID) {
		this.instructorID = instructorID;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public HelpTicket() {
		super();
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}
}
