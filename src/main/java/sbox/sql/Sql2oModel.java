package sbox.sql;

import java.util.Date;
import java.util.List;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

import sbox.device.DeviceData;
import sbox.device.DeviceModel;
import sbox.effects.EffectsData;
import sbox.effects.EffectsModel;
import sbox.gauges.GaugesData;
import sbox.gauges.GaugesModel;
import sbox.sensor.*;

public class Sql2oModel implements SensorModel, EffectsModel, GaugesModel, DeviceModel {

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
			Integer value = conn
					.createQuery(
							"SELECT SUM(int_value) as value FROM sbox.intdata where sensor_id = :sensorid and int_date>:fromdate and int_date<:todate")
					.addParameter("sensorid", sensorId).addParameter("fromdate", dateFrom)
					.addParameter("todate", dateTo).executeScalar(Integer.class);
			Sensor sensor = conn
					.createQuery(
							"SELECT SUM(int_value) as value FROM sbox.intdata where sensor_id = :sensorid and int_date>:fromdate and int_date<:todate")
					.addParameter("sensorid", sensorId).executeAndFetch(Sensor.class).get(0);
			SensorData data = new SensorData();
			data.setSensor(sensor);
			data.setData(value);
			data.setDetail(detail);
			return data;
		}

	}

	@Override
	public List<EffectsData> getEffects(Date dateFrom, Date dateTo) {
		try (Connection conn = sql2o.open()) {
			List<EffectsData> effects = conn.createQuery("CALL sbox.effects(:dateFrom,:dateTo);")
					.addParameter("dateFrom", dateFrom).addParameter("dateTo", dateTo)
					.executeAndFetch(EffectsData.class);
			return effects;
		}
	}

	@Override
	public List<GaugesData> getGauges(Date dateTo) {
		try (Connection conn = sql2o.open()) {
			List<GaugesData> gauges = conn.createQuery("CALL sbox.gauges(:dateTo);").addParameter("dateTo", dateTo)
					.executeAndFetch(GaugesData.class);
			return gauges;
		}
	}

	@Override
	public DeviceData getData() {
		try (Connection conn = sql2o.open()) {
			DeviceData device = conn.createQuery("SELECT device_id, device_name  FROM sbox.device limit 1")
					.executeAndFetch(DeviceData.class).get(0);
			return device;
		}
	}

}
