package sbox.effects;

import lombok.Data;
import sbox.util.IValidable;

@Data
public class DeleteBarDataPayload implements IValidable {
	String access_id;
	int bar_id;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}

}
