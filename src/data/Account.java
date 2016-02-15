package data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_accounts")

public class Account {

	@Column(name = "access_level")
	String accessLevel;

	String password;
	
	String username;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	
	
	public Account() {}



	public String getAccessLevel() {
		return accessLevel;
	}



	public String getPassword() {
		return password;
	}



	public String getUsername() {
		return username;
	}



	public User getUser() {
		return user;
	}



	public void setAccessLevel(String accessLevel) {
		this.accessLevel = accessLevel;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public void setUser(User user) {
		this.user = user;
	}



	@Override
	public String toString() {
		return "Account [accessLevel=" + accessLevel + ", password=" + password + ", username=" + username + ", user="
				+ user + "]";
	};
	
	
	
	
	
	
	
}
