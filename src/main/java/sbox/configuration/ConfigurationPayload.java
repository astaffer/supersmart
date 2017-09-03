package sbox.configuration;

import lombok.Data;
import sbox.util.IValidable;
 

@Data
public class ConfigurationPayload implements IValidable {
	String access_id;
	int config_id;
	String config_name;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}
}
