package data;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "subjects")

/*@NamedQueries({ @NamedQuery(name = "Subject.getSubjectsByStudent", query = "select s from Subject s where  student.id = :id ")})
*/


public class Subject {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "subject_id")
	private int id;

	String name;

	@ManyToMany(mappedBy = "subjects")
	private Collection<Instructor> instructors;

	@ManyToMany(mappedBy = "subjects")
	private Collection<Project> projects;

	@OneToMany(mappedBy = "subject")
	private Collection<Ticket> tickets;

	public Subject() {
	}

	public Collection<Ticket> getTickets() {
		return tickets;
	}

	public void setTickets(Collection<Ticket> tickets) {
		this.tickets = tickets;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Collection<Instructor> getInstructors() {
		return instructors;
	}

	public Collection<Project> getProjects() {
		return projects;
	}

	public void setProjects(Collection<Project> projects) {
		this.projects = projects;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setInstructors(Collection<Instructor> instructors) {
		this.instructors = instructors;
	}

	@Override
	public String toString() {
		return "Subject [id=" + id + ", name=" + name + ", instructors=" + instructors + ", projects=" + projects
				+ ", tickets=" + tickets + "]";
	}

	

}
