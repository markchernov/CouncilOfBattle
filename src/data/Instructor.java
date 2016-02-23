package data;

import java.util.Collection;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "instructors")

@DiscriminatorValue("instructor")

public class Instructor extends User {

	private String level;

	@ManyToMany
	@JoinTable(name = "instructors_subjects", joinColumns = @JoinColumn(name = "user_id") , inverseJoinColumns = @JoinColumn(name = "subject_id") )

	private Collection<Subject> subjects;

	@OneToMany(mappedBy = "instructor")
	private Collection<Competency> competencies;

	@OneToMany(mappedBy = "instructor")
	private Collection<Ticket> tickets;

	public Instructor() {
	}

	public Collection<Ticket> getTickets() {
		return tickets;
	}

	public void setTickets(Collection<Ticket> tickets) {
		this.tickets = tickets;
	}

	public String getLevel() {
		return level;
	}

	public Collection<Subject> getSubjects() {
		return subjects;
	}

	public Collection<Competency> getCompetencies() {
		return competencies;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public void setSubjects(Collection<Subject> subjects) {
		this.subjects = subjects;
	}

	public void setCompetencies(Collection<Competency> competencies) {
		this.competencies = competencies;
	}

	/*@Override
	public String toString() {
		return "Instructor [level=" + level + ", subjects=" + subjects + ", competencies=" + competencies + ", tickets="
				+ tickets + ", addresses=" + addresses + ", account=" + account + "]";
	}
*/
}
