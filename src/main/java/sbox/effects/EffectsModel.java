package sbox.effects;

import java.util.Date;
import java.util.List;
 

public interface EffectsModel {
	List<EffectsData> getEffects(Date dateFrom, Date dateTo);
}
