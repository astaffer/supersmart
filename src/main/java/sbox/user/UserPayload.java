package sbox.user;

import java.util.List;

import lombok.Data;
import lombok.Value;
import sbox.util.IValidable;

@Data
public class UserPayload implements IValidable {
	String access_id;
	String username;
	String password;
	String email;
	List<String> roles;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
