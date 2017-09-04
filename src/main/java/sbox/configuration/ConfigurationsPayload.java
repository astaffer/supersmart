package sbox.configuration;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import sbox.util.IValidable;
 

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ConfigurationsPayload implements IValidable {
	String access_id;
	int config_id;
	@Override
	public boolean isValid() {
		// TODO Auto-generated method stub
		return access_id != null;
	}
}
