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
	/*@NamedQuery(name="Attendance.getAttendancebyId", query="select s.attendance from Student s where s.student.id = :id"),*/
	@NamedQuery(name="Attendance.getAttendancebyStudent", query="select a from Attendance a where a.student = :sessionUser"),
	@NamedQuery(name="Attendance.getAttendancebyUsername", query="select a from Account a where a.username = :username"),
	@NamedQuery(name="Attendance.getAttendancebyDates", query="select a from Attendance a where a.date between  ?1 and ?2 and a.student.id = ?3"),
	@NamedQuery(name="Attendance.getAttendancebyCohort", query="select a from Attendance a inner join a.student s inner join s.cohort c where c.name = :cohortname"),
	@NamedQuery(name="Attendance.getAttendancebyDatesAndLastName", query="select a from Attendance a where a.date between  ?1 and ?2 and a.student.lastname = ?3"),
			
			
})
	

public class Attendance {

	@Id
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Student student;
	
	@Id
	Date date;
	
	String present;
	String late;
	String excused;
	
	Date checkin;
	Date checkout;
	
	
	
	
	public Attendance () {}


	
	


	public Student getStudent() {
		return student;
	}




	public Date getDate() {
		return date;
	}




	public String getPresent() {
		return present;
	}




	public String getLate() {
		return late;
	}




	public String getExcused() {
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




	public void setPresent(String present) {
		this.present = present;
	}




	public void setLate(String late) {
		this.late = late;
	}




	public void setExcused(String excused) {
		this.excused = excused;
	}




	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}




	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}




//	@Override
//	public String toString() {
//		return "Attendance [student=" + student + ", date=" + date + ", present=" + present + ", late=" + late
//				+ ", excused=" + excused + ", checkin=" + checkin + ", checkout=" + checkout + "]";
//	}




	
	
	
	
	
}
