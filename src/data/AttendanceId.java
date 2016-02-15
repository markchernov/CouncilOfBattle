package data;

import java.io.Serializable;
import java.util.Date;

public class AttendanceId implements Serializable{

	private int student;
	private Date date;
	
	
	public AttendanceId() {};
	
	
	public AttendanceId(Date date, int student) {
		
		this.student = student;
		this.date = date;
		
	}


	public int getId() {
		return student;
	}


	public Date getDate() {
		return date;
	}


	public void setId(int student) {
		this.student = student;
	}


	public void setDate(Date date) {
		this.date = date;
	};
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((date == null) ? 0 : date.hashCode());
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
		AttendanceId other = (AttendanceId) obj;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (student != other.student)
			return false;
		return true;
	}
	
	
	
}
