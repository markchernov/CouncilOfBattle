package data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(AddressId.class)
@Table(name = "addresses")


public class Address {

	@Id
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Id
	String addresstype;
	
	String street;
	String city;
	String state;
	String zip;
	
	
	
	
	public Address() {}




	public User getUser() {
		return user;
	}




	public String getAddresstype() {
		return addresstype;
	}




	public String getStreet() {
		return street;
	}




	public String getCity() {
		return city;
	}




	public String getState() {
		return state;
	}




	public String getZip() {
		return zip;
	}




	public void setUser(User user) {
		this.user = user;
	}




	public void setAddresstype(String addresstype) {
		this.addresstype = addresstype;
	}




	public void setStreet(String street) {
		this.street = street;
	}




	public void setCity(String city) {
		this.city = city;
	}




	public void setState(String state) {
		this.state = state;
	}




	public void setZip(String zip) {
		this.zip = zip;
	}




	@Override
	public String toString() {
		return "Address [user=" + user + ", addresstype=" + addresstype + ", street=" + street + ", city=" + city
				+ ", state=" + state + ", zip=" + zip + "]";
	}




	
	
	
	
	
	
}
