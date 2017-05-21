package sbox.device;
import lombok.Data;
import sbox.util.IValidable;
@Data
public class DeviceDataChangePayload implements IValidable {
	String access_id;
	String device_name;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}

}
