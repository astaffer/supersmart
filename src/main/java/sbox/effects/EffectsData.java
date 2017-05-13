package sbox.effects;
import java.util.Date;

import lombok.Data;

@Data
public class EffectsData {
	int bar_id;
	String bar_label;
	String bar_color;
	EffectsType bar_type;
	int sort_order;
	int hours;
}
