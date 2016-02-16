package data;

import java.io.Serializable;
import java.util.Date;

public class AddressId implements Serializable{

	private int user;
	private String addresstype;
	
	
	public AddressId() {};
	
	
	public AddressId(String addresstype, int user) {
		
		this.user = user;
		this.addresstype = addresstype;
		
	}


	public int getId() {
		return user;
	}

    String getType() {
		return addresstype;
	}


	public void setId(int user) {
		this.user = user;
	}


	public void setType(String addresstype) {
		this.addresstype = addresstype;
	};
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((addresstype == null) ? 0 : addresstype.hashCode());
		result = prime * result + user;
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
		AddressId other = (AddressId) obj;
		if (addresstype == null) {
			if (other.addresstype != null)
				return false;
		} else if (!addresstype.equals(other.addresstype))
			return false;
		if (user != other.user)
			return false;
		return true;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
