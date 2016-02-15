package data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "instructors_subjects")



public class Competency {

	
	
	@Id
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Instructor instructor;
	@Id
	@ManyToOne
	@JoinColumn(name = "subject_id")
	private Subject subject;
	
	
	public Competency () {}


	public Instructor getInstructor() {
		return instructor;
	}


	public Subject getSubject() {
		return subject;
	}


	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}


	public void setSubject(Subject subject) {
		this.subject = subject;
	}


	@Override
	public String toString() {
		return "Competency [instructor=" + instructor + ", subject=" + subject + "]";
	};
	
	
	
	
}
