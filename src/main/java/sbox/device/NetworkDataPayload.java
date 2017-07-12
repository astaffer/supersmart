package sbox.device;
import lombok.Data;
import sbox.util.IValidable;
@Data
public class NetworkDataPayload implements IValidable {
	String access_id;
	NetworkData network;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}

}
