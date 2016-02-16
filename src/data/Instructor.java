package data;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "instructors")

@DiscriminatorValue("instructor")



public class Instructor extends User{

    /*@Id
	
	@Column(name = "user_id")
	private int id;*/
	
	
	/*@OneToOne
	@JoinColumn(name = "user_id")
	private User user;*/
    
    
    
    private String level;
    
    
	
    @ManyToMany
	@JoinTable(name = "instructors_subjects", joinColumns = @JoinColumn (name = "user_id"), inverseJoinColumns = @JoinColumn(name = "subject_id"))
	
	private Collection <Subject> subjects;
	
	
	
	
	@OneToMany(mappedBy = "instructor")
	private Collection<Competency> competencies;
	
	
	
	public Instructor () {}



	/*public User getUser() {
		return user;
	}*/



	public String getLevel() {
		return level;
	}



	public Collection<Subject> getSubjects() {
		return subjects;
	}



	public Collection<Competency> getCompetencies() {
		return competencies;
	}



	/*public void setUser(User user) {
		this.user = user;
	}*/



	public void setLevel(String level) {
		this.level = level;
	}



	public void setSubjects(Collection<Subject> subjects) {
		this.subjects = subjects;
	}



	public void setCompetencies(Collection<Competency> competencies) {
		this.competencies = competencies;
	}



	@Override
	public String toString() {
		return "Instructor [level=" + level + ", subjects=" + subjects + ", competencies=" + competencies
				+ ", addresses=" + addresses + ", accounts=" + accounts + super.toString() + "]";
	}



	
	
	
	
	
	
}
