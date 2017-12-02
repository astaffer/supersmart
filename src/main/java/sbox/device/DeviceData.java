package sbox.device;

import lombok.Data;
import java.util.Date;
@Data
public class DeviceData {
	int device_id;
	String device_name;
	float device_shifts;
	Date device_uptime;
}
