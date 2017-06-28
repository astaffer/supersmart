package sbox.sensor;

import lombok.Data;
import sbox.util.IValidable;

@Data
public class UpdateSensorDataPayload implements IValidable   {
	String access_id;
	Sensor sensor;
	@Override
	public boolean isValid() {
		 
		return true;
	}
}
