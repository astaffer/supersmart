package sbox.device;

import lombok.Data;
import sbox.util.IValidable;
@Data
public class DeviceDataPayload implements IValidable{
	 String access_id;
		@Override
		public boolean isValid() {
			return access_id != null;
		}
}
