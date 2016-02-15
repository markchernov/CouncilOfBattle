package data;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;



@Entity
@Table(name = "subjects")



public class Subject {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "subject_id")
	private int id;
	
	String name;
	
	@ManyToMany(mappedBy = "subjects")
	private Collection<Instructor> instructors;
	
	
	public Subject () {}


	public int getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public Collection<Instructor> getInstructors() {
		return instructors;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setInstructors(Collection<Instructor> instructors) {
		this.instructors = instructors;
	}


	@Override
	public String toString() {
		return "Subject [id=" + id + ", name=" + name + ", instructors=" + instructors + "]";
	};
	
	
	
}
