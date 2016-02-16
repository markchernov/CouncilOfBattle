package data;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "students")


@DiscriminatorValue("student")

@NamedQueries({
	@NamedQuery(name="Attendance.getStudentsLastNames", query="select s.lastname from Student s")})

public class Student extends User{

	
	/*@Id
	
	@Column(name = "user_id")
	private int id;
	*/
	
	
	@ManyToOne
	@JoinColumn(name = "cohort_id")
	private Cohort cohort;
	
	/*
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;*/
	
	
	@OneToMany(mappedBy = "student")
	private Collection<Attendance> attendances;
	
	
	
	@OneToMany(mappedBy = "student")
	private Collection<Grade> grades;
	
	
	
	
	public Collection<Grade> getGrades() {
		return grades;
	}



	public void setGrades(Collection<Grade> grades) {
		this.grades = grades;
	}



	public Student () {}



	public Cohort getCohort() {
		return cohort;
	}



	/*public User getUser() {
		return user;
	}*/



	public Collection<Attendance> getAttendances() {
		return attendances;
	}



	public void setCohort(Cohort cohort) {
		this.cohort = cohort;
	}



	/*public void setUser(User user) {
		this.user = user;
	}*/



	public void setAttendances(Collection<Attendance> attendances) {
		this.attendances = attendances;
	}



	@Override
	public String toString() {
		return "Student [cohort=" + cohort + ", attendances=" + attendances + ", grades=" + grades + ", addresses="
				+ addresses + ", accounts=" + accounts + ", toString()=" + super.toString() + "]";
	}






	



	
	
	
	
}
