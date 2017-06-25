package sbox.user;

import lombok.Data;
import lombok.Value;
import sbox.util.IValidable;

@Data
public class DeleteUserPayload implements IValidable {
	String access_id;
	String username;

	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}	
}
