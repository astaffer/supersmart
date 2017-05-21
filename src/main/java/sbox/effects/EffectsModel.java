package sbox.effects;

import java.util.Date;
import java.util.List;
 

public interface EffectsModel {
	List<EffectsData> getEffects(Date dateFrom, Date dateTo);
	List<EffectsData> getBars();
	EffectsData updateBar(int bar_id);
	String deleteBar(int bar_id);
	EffectsData addBar();
}
