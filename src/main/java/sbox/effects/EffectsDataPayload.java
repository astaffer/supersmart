package sbox.effects;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalUnit;
import java.util.Date;

import sbox.sensor.Detail;
import sbox.util.IValidable;
import lombok.*;
@Data
public class EffectsDataPayload implements IValidable{
	 Date dateFrom;
	 Date dateTo;
	 Detail detail;
	 String access_id;
	 Period period;
	@Override
	public boolean isValid() {
		return access_id != null;
	}
	public Date getPeriodDateFrom(){
		LocalDateTime localDateTime = LocalDateTime.now();
		switch(period){
			case today:
				localDateTime = localDateTime.truncatedTo(ChronoUnit.DAYS);
			break;
			case yesterday:
				localDateTime = localDateTime.minusDays(1).truncatedTo(ChronoUnit.DAYS);
			break;
			case week:
				localDateTime =localDateTime.minusWeeks(1);
			 break;
			case month:
				localDateTime =localDateTime.minusMonths(1);
			break;
			case quarter:
				localDateTime =localDateTime.minusMonths(3);
			break;
			case year:
				localDateTime =localDateTime.minusYears(1);
			break;
		}
		Instant instant = localDateTime.atZone(ZoneId.systemDefault()).toInstant();
		Date date = Date.from(instant);
		return date;
	}
	public Date getPeriodDateTo(){
		Date date = new Date();
		Instant instant =null;
		switch(period){
			
			case yesterday:
				 instant = LocalDateTime.now().truncatedTo(ChronoUnit.DAYS).atZone(ZoneId.systemDefault()).toInstant();
				date = Date.from(instant);
			break;
			default:
				 instant = LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant();
				 date = Date.from(instant);
			break;
		}
		return date;
	}
}
