package sbox.user;

import lombok.Value;
import sbox.util.IValidable;

@Value
public class DeleteUserPayload implements IValidable {
	String access_id;
	String user_name;

	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}	
}
