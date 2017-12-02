package sbox.device;

import java.util.Date;

public interface DeviceModel {
	DeviceData getData();
	DeviceData changeData(int device_id, String device_name, float device_shifts);
	int writeUptime(Date uptime);
}
