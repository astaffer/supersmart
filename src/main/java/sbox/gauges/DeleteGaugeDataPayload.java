package sbox.gauges;

import java.util.Date;

import lombok.Data;
import sbox.util.IValidable;

@Data
public class DeleteGaugeDataPayload implements IValidable {
	int gauge_id;
	String access_id;
	@Override
	public boolean isValid() {
		return access_id != null;
	}
}
