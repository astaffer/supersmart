package sbox.sensor;

import java.util.Date;
import java.util.List;

public interface SensorModel {
	List<Sensor> getAllSensors(String filter);
	Sensor getSensor(int sensorId);
	SensorData getSensorData(int sensorId,Date dateFrom,Date dateTo,Detail detail);
	Sensor updateSensor(Sensor sensorData);
	Sensor clearSensor(Sensor sensorData);
}
