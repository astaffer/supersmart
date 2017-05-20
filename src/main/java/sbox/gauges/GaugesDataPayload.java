package sbox.gauges;

import java.util.Date;

import lombok.Data;
import sbox.util.IValidable;

@Data
public class GaugesDataPayload implements IValidable {
	Date dateTo;
	String access_id;

	@Override
	public boolean isValid() {
		return access_id != null;
	}
}
