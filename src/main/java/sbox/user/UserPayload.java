package sbox.user;

import java.util.List;

import lombok.Value;
import sbox.util.IValidable;

@Value
public class UserPayload implements IValidable {
	String access_id;
	String user_name;
	String password;
	String email;
	List<String> roles;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
