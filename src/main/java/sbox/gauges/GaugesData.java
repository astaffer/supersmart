package sbox.gauges;

import java.util.Date;

import lombok.Data;
@Data
public class GaugesData {
	int gauge_id;
	String gauge_label;
	String gauge_unit;
	int sort_order;
	int limit_value;
	int init_value;
	int start_green;
	int start_yellow;
	int start_red;
	int sensor_id;
	Date init_date;
	Date mileage_date;
	int value;
	int mileage_value;
}
