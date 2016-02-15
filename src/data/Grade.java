package data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "grades")

@IdClass(GradeId.class)
public class Grade {

	@Id
	@ManyToOne
	@JoinColumn (name = "user_id")
	private Student student;
	
	@Id
	@ManyToOne
	@JoinColumn (name = "project_id")
	private Project project;
	
	int grade;
	
	
	public Grade () {}


	public Student getStudent() {
		return student;
	}


	public Project getProject() {
		return project;
	}


	public int getGrade() {
		return grade;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	public void setProject(Project project) {
		this.project = project;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	@Override
	public String toString() {
		return "Grade [student=" + student + ", project=" + project + ", grade=" + grade + "]";
	};
	
	
	
	
	
	
}