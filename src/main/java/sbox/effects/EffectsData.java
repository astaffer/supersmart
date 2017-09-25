package sbox.effects;

import lombok.Data;

@Data
public class EffectsData {
	int bar_id;
	String bar_label;
	String bar_color;
	EffectsType bar_type;
	int sensor_id;
	int sort_order;
	double hours;
}
