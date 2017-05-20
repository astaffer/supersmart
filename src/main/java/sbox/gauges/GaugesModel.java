package sbox.gauges;

import java.util.Date;
import java.util.List;

public interface GaugesModel {
	
		List<GaugesData> getGauges(Date dateTo);

}
