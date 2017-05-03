package sbox.auth;

import lombok.Data;
import sbox.util.IValidable;

@Data
public class AuthPayload implements IValidable {
	String username;
	String password;

	@Override

	public boolean isValid() {
		return username != null && password != null;
	}
}
