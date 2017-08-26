package sbox.sensor;
import lombok.Data;
import sbox.util.IValidable;
@Data
public class SensorPayload implements IValidable{
	String access_id;
	String filter;
	@Override
	public boolean isValid() {
		return access_id != null;
	}
}
