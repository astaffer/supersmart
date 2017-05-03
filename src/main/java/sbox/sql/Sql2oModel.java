package sbox.sql;

import java.util.Date;
import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import sbox.sensor.*;
 

public class Sql2oModel implements SensorModel {

	private Sql2o sql2o;

	public Sql2oModel(Sql2o sql2o) {
		this.sql2o = sql2o;

	}

	@Override
	public List<Sensor> getAllSensors() {
		 try (Connection conn = sql2o.open()) {
	            List<Sensor> sensors = conn.createQuery("SELECT sensor_id,sensor_name,sensor_type FROM sensor")
	                    .executeAndFetch(Sensor.class);
	            return sensors;
	        }
	}

	@Override
	public SensorData getSensorData(int sensorId, Date dateFrom, Date dateTo, Detail detail) {
		try (Connection conn = sql2o.open()) {
			Integer value = conn.createQuery("SELECT SUM(int_value) as value FROM sbox.intdata where sensor_id = :sensorid and int_date>:fromdate and int_date<:todate")
					.addParameter("sensorid",  sensorId)
					.addParameter("fromdate",  dateFrom)
					.addParameter("todate",  dateTo).executeScalar(Integer.class);
			Sensor sensor =	conn.createQuery("SELECT SUM(int_value) as value FROM sbox.intdata where sensor_id = :sensorid and int_date>:fromdate and int_date<:todate")
					.addParameter("sensorid",  sensorId)
					.executeAndFetch(Sensor.class).get(0);
			SensorData data = new SensorData();
			data.setSensor(sensor);
			data.setData(value);
			data.setDetail(detail);
			return data;
		}
		
	}

}
