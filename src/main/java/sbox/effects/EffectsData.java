package sbox.effects;

import lombok.Data;

@Data
public class EffectsData {
	int bar_id;
	String bar_label;
	String bar_color;
	String bar_colors;
	EffectsType bar_type;
	int sensor_id;
	int sort_order;
	double hours;
}
