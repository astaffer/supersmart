package sbox.effects;

import lombok.Data;
import sbox.util.IValidable;

@Data
public class BarDataPayload implements IValidable {
	String access_id;
	EffectsData bar;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}

}
