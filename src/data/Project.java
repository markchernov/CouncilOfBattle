package data;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "projects")



public class Project {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "project_id")
	private int id;
	
	
	@OneToMany(mappedBy = "project")
	private Collection<Grade> grades;
	
	
	@ManyToMany
	@JoinTable(name = "projects_subjects", joinColumns = @JoinColumn (name = "project_id"), inverseJoinColumns = @JoinColumn(name = "subject_id"))
	
	private Collection <Subject> subjects;
	
	
	Date startdate;
	
	Date enddate;
	
	
	public Project () {}


	public int getId() {
		return id;
	}


	public Collection<Grade> getGrades() {
		return grades;
	}


	public Collection<Subject> getSubjects() {
		return subjects;
	}


	public Date getStartdate() {
		return startdate;
	}


	public Date getEnddate() {
		return enddate;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setGrades(Collection<Grade> grades) {
		this.grades = grades;
	}


	public void setSubjects(Collection<Subject> subjects) {
		this.subjects = subjects;
	}


	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}


	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}


	@Override
	public String toString() {
		return "Project [id=" + id + ", grades=" + grades + ", subjects=" + subjects + ", startdate=" + startdate
				+ ", enddate=" + enddate + "]";
	};
	
	
	
	
}
