package sbox.user;

import java.util.List;

import lombok.Value;
import sbox.util.IValidable;

@Value
public class UserRolesPayload implements IValidable {
	String access_id;
	String username;
	String role;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
