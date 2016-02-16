package data;

import java.io.Serializable;

public class CompetencyId implements Serializable{

	
	private int instructor;
	private int subject;
	
	
	public CompetencyId () {};
	
	
	
	public CompetencyId(int instructor, int subject)
	{
		this.instructor = instructor;
		this.subject = subject;
		
		
	}



	public int getInstructor() {
		return instructor;
	}



	public int getSubject() {
		return subject;
	}



	public void setInstructor(int instructor) {
		this.instructor = instructor;
	}



	public void setSubject(int subject) {
		this.subject = subject;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + instructor;
		result = prime * result + subject;
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
		CompetencyId other = (CompetencyId) obj;
		if (instructor != other.instructor)
			return false;
		if (subject != other.subject)
			return false;
		return true;
	}
	
	
	
	
	
	
}
