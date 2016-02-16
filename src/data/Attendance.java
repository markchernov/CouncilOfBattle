package data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@IdClass(AttendanceId.class)
@Table(name = "daily_attendance")


@NamedQueries({
	@NamedQuery(name="Attendance.getAttendancebyUsername", query="select a from Account a where a.username = :username"),
	@NamedQuery(name="Attendance.getAttendancebyDates", query="select a from Attendance a where a.date between  ?1 and ?2 and a.student.id = ?3"),
	@NamedQuery(name="Attendance.getAttendancebyCohort", query="select a from Attendance a inner join a.student s.cohort where s.cohort = :cohort"),
	@NamedQuery(name="Attendance.getAttendancebyDatesAndLastName", query="select a from Attendance a where a.date between  ?1 and ?2 and a.student.lastname = ?3"),
			
			
})
	

public class Attendance {

	@Id
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Student student;
	
	@Id
	Date date;
	
	int present;
	int late;
	int excused;
	
	Date checkin;
	Date checkout;
	
	
	
	
	public Attendance () {}




	public Student getStudent() {
		return student;
	}




	public Date getDate() {
		return date;
	}




	public int getPresent() {
		return present;
	}




	public int getLate() {
		return late;
	}




	public int getExcused() {
		return excused;
	}




	public Date getCheckin() {
		return checkin;
	}




	public Date getCheckout() {
		return checkout;
	}




	public void setStudent(Student student) {
		this.student = student;
	}




	public void setDate(Date date) {
		this.date = date;
	}




	public void setPresent(int present) {
		this.present = present;
	}




	public void setLate(int late) {
		this.late = late;
	}




	public void setExcused(int excused) {
		this.excused = excused;
	}




	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}




	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}




	@Override
	public String toString() {
		return "Attendance [student=" + student + ", date=" + date + ", present=" + present + ", late=" + late
				+ ", excused=" + excused + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}




	
	
	
	
	
}
