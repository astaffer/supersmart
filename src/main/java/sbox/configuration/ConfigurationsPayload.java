package sbox.configuration;

import lombok.Data;
import sbox.util.IValidable;
 

@Data
public class ConfigurationsPayload implements IValidable {
	String access_id;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}
}
