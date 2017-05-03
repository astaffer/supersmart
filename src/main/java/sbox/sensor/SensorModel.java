package sbox.sensor;

import java.util.Date;
import java.util.List;

public interface SensorModel {
	List<Sensor> getAllSensors();
	SensorData getSensorData(int sensorId,Date dateFrom,Date dateTo,Detail detail);
}
