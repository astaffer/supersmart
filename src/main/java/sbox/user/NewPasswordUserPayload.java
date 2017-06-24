package sbox.user;

import lombok.Value;
import sbox.util.IValidable;

@Value
public class NewPasswordUserPayload implements IValidable {
	String user_name;
	String password;
	String newPassword;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}	
}
