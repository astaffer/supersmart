package sbox.gauges;

import java.util.Date;
import java.util.List;

public interface GaugesModel {
	
		List<GaugesData> getGauges(Date dateTo);
		GaugesData updateGauge(GaugesData gauge);
		String deleteGauge(int gauge_id);
		GaugesData addGauge(GaugesData gauge);
}
