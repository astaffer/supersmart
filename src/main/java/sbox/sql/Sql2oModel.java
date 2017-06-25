package sbox.sql;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sql2o.Connection;
import org.sql2o.Query;
import org.sql2o.Sql2o;

import sbox.device.DeviceData;
import sbox.device.DeviceModel;
import sbox.effects.EffectsData;
import sbox.effects.EffectsModel;
import sbox.gauges.GaugesData;
import sbox.gauges.GaugesModel;
import sbox.sensor.*;
import sbox.user.User;
import sbox.user.UserModel;
import sbox.user.UserPayload;

public class Sql2oModel implements SensorModel, EffectsModel, GaugesModel, DeviceModel, UserModel {

	private Sql2o sql2o;
	public static final String DELETEOK = "OK";
	public static final String DELETEERROR = "ERROR";

	public Sql2oModel(Sql2o sql2o) {
		this.sql2o = sql2o;

	}

	@Override
	public List<Sensor> getAllSensors() {
		try (Connection conn = sql2o.open()) {
			List<Sensor> sensors = conn.createQuery("SELECT sensor_id, sensor_name, sensor_type FROM sensor")
					.executeAndFetch(Sensor.class);
			return sensors;
		}
	}

	public Sensor getSensor(int id) {
		try (Connection conn = sql2o.open()) {
			Sensor sensor = conn.createQuery("SELECT sensor_id,sensor_name,sensor_type FROM sensor where sensor_id=:id")
					.addParameter("id", id).executeAndFetch(Sensor.class).get(0);
			return sensor;
		}
	}

	@Override
	public SensorData getSensorData(int sensorId, Date dateFrom, Date dateTo, Detail detail) {
		try (Connection conn = sql2o.open()) {
			Integer value = conn
					.createQuery(
							"SELECT SUM(int_value) as value FROM intdata where sensor_id = :sensorid and int_date>:fromdate and int_date<:todate")
					.addParameter("sensorid", sensorId).addParameter("fromdate", dateFrom)
					.addParameter("todate", dateTo).executeScalar(Integer.class);
			Sensor sensor = conn
					.createQuery(
							"SELECT SUM(int_value) as value FROM intdata where sensor_id = :sensorid and int_date>:fromdate and int_date<:todate")
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
			List<EffectsData> effects = conn.createQuery("CALL effects(:dateFrom,:dateTo);")
					.addParameter("dateFrom", dateFrom).addParameter("dateTo", dateTo)
					.executeAndFetch(EffectsData.class);
			return effects;
		}
	}

	@Override
	public List<GaugesData> getGauges(Date dateTo) {
		try (Connection conn = sql2o.open()) {
			List<GaugesData> gauges = conn.createQuery("CALL gauges(:dateTo);").addParameter("dateTo", dateTo)
					.executeAndFetch(GaugesData.class);
			return gauges;
		}
	}

	@Override
	public DeviceData getData() {
		try (Connection conn = sql2o.open()) {
			DeviceData device = conn.createQuery("SELECT device_id, device_name  FROM device limit 1")
					.executeAndFetch(DeviceData.class).get(0);
			return device;
		}
	}

	@Override
	public DeviceData changeData(int device_id, String device_name) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("UPDATE device SET device_name=:devicename where device_id=:id")
					.addParameter("devicename", device_name).addParameter("id", device_id).executeUpdate();
		}
		return getData();
	}

	@Override
	public List<EffectsData> getBars() {
		try (Connection conn = sql2o.open()) {
			List<EffectsData> effects = conn
					.createQuery("SELECT bar_id,bar_label,bar_color,bar_type,sensor_id,sort_order FROM effectsbar;")
					.executeAndFetch(EffectsData.class);
			return effects;
		}
	}

	@Override
	public EffectsData getBar(int bar_id) {
		try (Connection conn = sql2o.open()) {
			List<EffectsData> bars = conn
					.createQuery(
							"SELECT bar_id,bar_label,bar_color,bar_type,sensor_id,sort_order  FROM effectsbar WHERE bar_id=:bar_id limit 1")
					.addParameter("bar_id", bar_id).executeAndFetch(EffectsData.class);
			EffectsData bar = null;
			if (!bars.isEmpty()) {
				bar = bars.get(0);
			}
			return bar;
		}
	}

	@Override
	public EffectsData updateBar(EffectsData bar) {
		Map<String, Object> params = new HashMap<>();
		StringBuilder sql = new StringBuilder("update effectsbar set ");
		if (bar.getBar_label() != null && !bar.getBar_label().isEmpty()) {
			sql.append("bar_label = :bar_label,");
			params.put("bar_label", bar.getBar_label());
		}
		if (bar.getBar_color() != null && !bar.getBar_color().isEmpty()) {
			sql.append("bar_color = :bar_color,");
			params.put("bar_color", bar.getBar_color());
		}
		if (bar.getBar_type() != null) {
			sql.append("bar_type = :bar_type,");
			params.put("bar_type", bar.getBar_type().toString());
		}
		if (bar.getSensor_id() >= 0) {
			sql.append("sensor_id = :sensor_id,");
			params.put("sensor_id", bar.getSensor_id());
		}
		if (bar.getSort_order() >= 0) {
			sql.append("sort_order = :sort_order,");
			params.put("sort_order", bar.getSort_order());
		}
		// remove last comma.
		sql.deleteCharAt(sql.length() - 1);

		sql.append(" where bar_id = :id");
		if (!params.isEmpty()) {
			try (Connection conn = sql2o.open()) {
				Query query = conn.createQuery(sql.toString());

				for (String key : params.keySet()) {
					query.addParameter(key, params.get(key));
				}

				query.addParameter("id", bar.getBar_id()).executeUpdate();
			}
		}
		return getBar(bar.getBar_id());
	}

	@Override
	public String deleteBar(int bar_id) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("DELETE FROM effectsbar WHERE bar_id=:bar_id").addParameter("bar_id", bar_id)
					.executeUpdate();
		}
		return getBar(bar_id) == null ? DELETEOK : DELETEERROR;
	}

	@Override
	public EffectsData addBar(EffectsData bar) {
		int bar_id = 0;
		try (Connection conn = sql2o.open()) {
			bar_id = (int) conn
					.createQuery("INSERT INTO effectsbar (`bar_label`,`bar_color`,`bar_type`,`sensor_id`,`sort_order`)"
							+ "VALUES(:bar_label,:bar_color,:bar_type,:sensor_id,:sort_order)")
					.addParameter("bar_label", bar.getBar_label() == null ? "bar" : bar.getBar_label())
					.addParameter("bar_color", bar.getBar_color() == null ? "255, 255, 255" : bar.getBar_color())
					.addParameter("bar_type", bar.getBar_type() == null ? "Plan" : bar.getBar_type().toString())
					.addParameter("sensor_id", bar.getSensor_id() == 0 ? "0" : bar.getSensor_id())
					.addParameter("sort_order", bar.getSort_order() == 0 ? "0" : bar.getSort_order()).executeUpdate()
					.getKey();
		}
		return getBar(bar_id);
	}

	@Override
	public GaugesData getGauge(int gauge_id) {
		try (Connection conn = sql2o.open()) {
			List<GaugesData> gauges = conn
					.createQuery(
							"SELECT  `gauge_id`,`gauge_label`, `gauge_unit`,`sort_order`,`init_value`, `limit_value`,`start_green`, `start_yellow`,`start_red`, `sensor_id`,`init_date`,`mileage_date`"
									+ "FROM `servicegauge` WHERE gauge_id=:gauge_id limit 1")
					.addParameter("gauge_id", gauge_id).executeAndFetch(GaugesData.class);
			GaugesData gauge = null;
			if (!gauges.isEmpty()) {
				gauge = gauges.get(0);
			}
			return gauge;
		}
	}

	@Override
	public GaugesData updateGauge(GaugesData gauge) {
		Map<String, Object> params = new HashMap<>();
		StringBuilder sql = new StringBuilder("update servicegauge set ");
		if (gauge.getGauge_label() != null && !gauge.getGauge_label().isEmpty()) {
			sql.append("gauge_label = :gauge_label,");
			params.put("gauge_label", gauge.getGauge_label());
		}
		if (gauge.getGauge_unit() != null && !gauge.getGauge_unit().isEmpty()) {
			sql.append("gauge_unit = :gauge_unit,");
			params.put("gauge_unit", gauge.getGauge_unit());
		}
		if (gauge.getInit_date() != null) {
			sql.append("init_date = :init_date,");
			params.put("init_date", gauge.getInit_date());
		}
		if (gauge.getMileage_date() != null) {
			sql.append("mileage_date = :mileage_date,");
			params.put("mileage_date", gauge.getMileage_date());
		}
		if (gauge.getInit_value() >= 0) {
			sql.append("init_value = :init_value,");
			params.put("init_value", gauge.getInit_value());
		}
		if (gauge.getLimit_value() >= 0) {
			sql.append("limit_value = :limit_value,");
			params.put("limit_value", gauge.getLimit_value());
		}
		if (gauge.getStart_red() >= 0) {
			sql.append("start_red = :start_red,");
			params.put("start_red", gauge.getStart_red());
		}
		if (gauge.getStart_green() >= 0) {
			sql.append("start_green = :start_green,");
			params.put("start_green", gauge.getStart_green());
		}
		if (gauge.getStart_yellow() >= 0) {
			sql.append("start_yellow = :start_yellow,");
			params.put("start_yellow", gauge.getStart_yellow());
		}
		if (gauge.getSensor_id() >= 0) {
			sql.append("sensor_id = :sensor_id,");
			params.put("sensor_id", gauge.getSensor_id());
		}
		if (gauge.getSort_order() >= 0) {
			sql.append("sort_order = :sort_order,");
			params.put("sort_order", gauge.getSort_order());
		}
		// remove last comma.
		sql.deleteCharAt(sql.length() - 1);

		sql.append(" where gauge_id = :id");
		if (!params.isEmpty()) {
			try (Connection conn = sql2o.open()) {
				Query query = conn.createQuery(sql.toString());

				for (String key : params.keySet()) {
					query.addParameter(key, params.get(key));
				}

				query.addParameter("id", gauge.getGauge_id()).executeUpdate();
			}
		}
		return getGauge(gauge.getGauge_id());
	}

	@Override
	public String deleteGauge(int gauge_id) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("DELETE FROM servicegauge WHERE gauge_id=:gauge_id").addParameter("gauge_id", gauge_id)
					.executeUpdate();
		}
		return getGauge(gauge_id) == null ? DELETEOK : DELETEERROR;

	}

	@Override
	public GaugesData addGauge(GaugesData gauge) {
		long gauge_id = 0;
		try (Connection conn = sql2o.open()) {
			gauge_id = (long) conn
					.createQuery(
							"INSERT INTO servicegauge (`gauge_label`,`gauge_unit`,`sort_order`,`init_value`,`limit_value`,`start_green`,`start_yellow`,`start_red`,`sensor_id`,`init_date`,`mileage_date`)"
									+ "VALUES(:gauge_label,:gauge_unit,:sort_order,:init_value,:limit_value,:start_green,:start_yellow,:start_red,:sensor_id,:init_date,:mileage_date)")
					.addParameter("gauge_label", gauge.getGauge_label() == null ? "bar" : gauge.getGauge_label())
					.addParameter("gauge_unit", gauge.getGauge_unit() == null ? "часов" : gauge.getGauge_unit())
					.addParameter("init_value", gauge.getInit_value() == 0 ? 0 : gauge.getInit_value())
					.addParameter("limit_value", gauge.getLimit_value() == 0 ? 0 : gauge.getLimit_value())
					.addParameter("start_green", gauge.getStart_green() == 0 ? 0 : gauge.getStart_green())
					.addParameter("start_yellow", gauge.getStart_yellow() == 0 ? 0 : gauge.getStart_yellow())
					.addParameter("start_red", gauge.getStart_red() == 0 ? 0 : gauge.getStart_red())
					.addParameter("init_date", gauge.getInit_date() == null ? new Date() : gauge.getInit_date())
					.addParameter("mileage_date",
							gauge.getMileage_date() == null ? new Date() : gauge.getMileage_date())
					.addParameter("sensor_id", gauge.getSensor_id() == 0 ? "0" : gauge.getSensor_id())
					.addParameter("sort_order", gauge.getSort_order() == 0 ? "0" : gauge.getSort_order())
					.executeUpdate().getKey();
		}
		return getGauge((int) gauge_id);
	}

	@Override
	public User getUserByUsername(String username) {
		try (Connection conn = sql2o.open()) {
			User user = conn
					.createQuery(
							"SELECT user_id, user_name, user_email, access_id, salt FROM users where user_name=:id")
					.addParameter("id", username).executeAndFetch(User.class).get(0);
			user.setRoles(getRolesFor(conn, user.getUser_id()));
			return user;
		}
	}

	@Override
	public User getUserByAccessId(String access_id) {
		try (Connection conn = sql2o.open()) {
			User user = conn
					.createQuery(
							"SELECT user_id, user_name, user_email, access_id, salt FROM users where access_id=:id")
					.addParameter("id", access_id).executeAndFetch(User.class).get(0);
			user.setRoles(getRolesFor(conn, user.getUser_id()));
			return user;
		}
	}

	private List<String> getRolesFor(Connection conn, int user_id) {
		return conn
				.createQuery(
						"select role_name from  role join userrole on role.role_id = userrole.role_id where user_id=:user_id")
				.addParameter("user_id", user_id).executeAndFetch(String.class);
	}

	@Override
	public User createUser(String username, String newSalt, String newHashedPassword, String email) {
		long user_id = 0;
		try (Connection conn = sql2o.open()) {
			user_id = (long) conn
					.createQuery("INSERT INTO users (`user_name`,`user_email`,`access_id`,`salt`)"
							+ "VALUES(:username,:useremail,:accessid,:salt)")
					.addParameter("username", username == null ? "newuser" : username)
					.addParameter("useremail", email == null ? "" : email)
					.addParameter("accessid", newHashedPassword == null ? "" : newHashedPassword)
					.addParameter("salt", newSalt == null ? "" : newSalt).executeUpdate().getKey();
		}
		return getUserByUsername(username);
	}

	@Override
	public String deleteUser(String username) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("DELETE FROM users WHERE user_name=:username").addParameter("username", username)
					.executeUpdate();
		}
		return getUserByUsername(username) == null ? DELETEOK : DELETEERROR;

	}

	@Override
	public User changePassword(String username, String newSalt, String newHashedPassword) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("UPDATE users SET users.salt=:salt, users.access_id=:pass WHERE user_name=:username")
					.addParameter("username", username).addParameter("salt", newSalt)
					.addParameter("pass", newHashedPassword).executeUpdate();
		}
		return getUserByUsername(username);
	}

	@Override
	public User updateUser(UserPayload user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getAllUsers() {
		try (Connection conn = sql2o.open()) {
			List<User> users = conn.createQuery("SELECT user_id, user_name, user_email, access_id FROM users")
					.executeAndFetch(User.class);
			users.forEach((user) -> user.setRoles(getRolesFor(conn, user.getUser_id())));
			return users;
		}

	}

	@Override
	public List<User> getUsersByRole(String rolename) {
		try (Connection conn = sql2o.open()) {
			List<User> users = conn
					.createQuery(
							"SELECT user_id, user_name, user_email, access_id FROM users join userrole on user.user_id = userrole.user_id join role on role.role_id=userrole.role_id WHERE role.role_name=:rolename")
					.addParameter("rolename", rolename).executeAndFetch(User.class);
			users.forEach((user) -> user.setRoles(getRolesFor(conn, user.getUser_id())));
			return users;
		}
	}

	@Override
	public List<String> getRoles() {
		try (Connection conn = sql2o.open()) {
			List<String> roles = conn.createQuery("select role_name from  role").executeAndFetch(String.class);
			return roles;
		}

	}

	@Override
	public User addUserRole(String username, String role) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteUserRole(String username, String role) {
		// TODO Auto-generated method stub
		return null;
	}
}
