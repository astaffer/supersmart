package sbox.user;

import java.util.List;

import lombok.Value;
import sbox.util.IValidable;

@Value
public class GetUserPayload implements IValidable {
	String access_id;
	String user_name;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
