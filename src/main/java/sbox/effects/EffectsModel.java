package sbox.effects;

import java.util.Date;
import java.util.List;

import sbox.sensor.Detail;
 

public interface EffectsModel {
	List<EffectsData> getEffects(Date dateFrom, Date dateTo, Detail detail);
	EffectsData  getBar(int bar_id);
	List<EffectsData> getBars();
	EffectsData updateBar(EffectsData bar);
	String deleteBar(int bar_id);
	EffectsData addBar(EffectsData bar);
}
