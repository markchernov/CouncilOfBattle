package data;

import java.util.Collection;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "students")

@DiscriminatorValue("student")

@NamedQueries({ @NamedQuery(name = "Attendance.getStudentsLastNames", query = "select s.lastname from Student s"),
	@NamedQuery(name = "Student.getStudentsByCohort", query = "select s from Student s where s.cohort = :cohort")})

public class Student extends User {

	@ManyToOne
	@JoinColumn(name = "cohort_id")
	private Cohort cohort;

	@OneToMany(mappedBy = "student")
	private Collection<Attendance> attendances;

	@OneToMany(mappedBy = "student")
	private Collection<Grade> grades;

	@OneToMany(mappedBy = "student")
	private Collection<Ticket> tickets;

	public Collection<Ticket> getTickets() {
		return tickets;
	}

	
	public Student() {
	}
	
	
	public void setTickets(Collection<Ticket> tickets) {
		this.tickets = tickets;
	}

	public Collection<Grade> getGrades() {
		return grades;
	}

	public void setGrades(Collection<Grade> grades) {
		this.grades = grades;
	}

	
	public Cohort getCohort() {
		return cohort;
	}

	public Collection<Attendance> getAttendances() {
		return attendances;
	}

	public void setCohort(Cohort cohort) {
		this.cohort = cohort;
	}

	public void setAttendances(Collection<Attendance> attendances) {
		this.attendances = attendances;
	}

	@Override
	public String toString() {
		return "Student [cohort=" + cohort + ", attendances=" + attendances + ", grades=" + grades + ", tickets="
				+ tickets + ", addresses=" + addresses + ", account=" + account + "]";
	}

}
