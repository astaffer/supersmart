package sbox.user;

import java.util.List;

import lombok.Data;
import lombok.Value;
import sbox.util.IValidable;

@Data
public class GetRolesPayload implements IValidable {
	String access_id;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return true;
	}
	
}
