package sbox.sensor;
import lombok.Data;
import java.util.Date;
@Data
public class SensorDataPayload extends SensorPayload {
	 Date dateFrom;
	 Date dateTo;
	 Detail detail;
}
