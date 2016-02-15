package data;

import java.io.Serializable;

import javax.persistence.IdClass;



public class GradeId implements Serializable{

	private int student;
	private int project;
	
    public GradeId() {};
	
	
	public GradeId(int student, int project) {
		
		this.student = student;
		this.project = project;
		
	}


	public int getStudent() {
		return student;
	}


	public int getProject() {
		return project;
	}


	public void setStudent(int student) {
		this.student = student;
	}


	public void setProject(int project) {
		this.project = project;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + project;
		result = prime * result + student;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GradeId other = (GradeId) obj;
		if (project != other.project)
			return false;
		if (student != other.student)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "GradeId [student=" + student + ", project=" + project + "]";
	}
	
	
	
}
