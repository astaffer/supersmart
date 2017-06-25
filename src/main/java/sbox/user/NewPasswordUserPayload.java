package sbox.user;

import lombok.Data;
import lombok.Value;
import sbox.util.IValidable;

@Data
public class NewPasswordUserPayload implements IValidable {
	String username;
	String password;
	String newpassword;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}	
}
