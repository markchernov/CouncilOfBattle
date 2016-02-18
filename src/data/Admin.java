package data;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "admins")

@DiscriminatorValue("admin")



public class Admin  extends User{

	private String department;

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Admin [department=" + department + ", addresses=" + addresses + ", accounts=" + account + super.toString()+"]";
	}
	
	
	
	
	
}
