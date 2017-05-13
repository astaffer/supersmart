package sbox.effects;

import java.util.Date;

import sbox.sensor.Detail;
import sbox.util.IValidable;
import lombok.*;
@Data
public class EffectsDataPayload implements IValidable{
	 Date dateFrom;
	 Date dateTo;
	 Detail detail;
	 String access_id;
	@Override
	public boolean isValid() {
		return access_id != null;
	}
}
