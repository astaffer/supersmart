package sbox.effects;

import java.util.Date;
import java.util.List;
 

public interface EffectsModel {
	List<EffectsData> getEffects(Date dateFrom, Date dateTo);
	List<EffectsData> getBars();
	EffectsData updateBar(int bar_id, String bar_label,String bar_color,String bar_type,int sensor_id, int sort_order);
	String deleteBar(int bar_id);
	EffectsData addBar(EffectsData bar);
}
