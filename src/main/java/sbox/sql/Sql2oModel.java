package sbox.sql;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sql2o.Connection;
import org.sql2o.Query;
import org.sql2o.Sql2o;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.jdbc.Util;

import sbox.configuration.ConfigurationData;
import sbox.configuration.ConfigurationDataSQL;
import sbox.configuration.ConfigurationModel;
import sbox.device.DeviceData;
import sbox.device.DeviceModel;
import sbox.effects.EffectsData;
import sbox.effects.EffectsModel;
import sbox.gauges.GaugesData;
import sbox.gauges.GaugesModel;
import sbox.index.IntValue;
import sbox.index.PureData;
import sbox.index.PureDataModel;
import sbox.sensor.*;
import sbox.user.User;
import sbox.user.UserModel;
import sbox.user.UserPayload;
import sbox.util.JsonUtil;

public class Sql2oModel implements SensorModel, EffectsModel, GaugesModel, DeviceModel, UserModel, ConfigurationModel, PureDataModel {

	private Sql2o sql2o;
	public static final String DELETEOK = "OK";
	public static final String DELETEERROR = "ERROR";
	private static final String defaultColor="{\"hsl\":{\"h\":278.8235294117647,\"s\":0.5000000000000001,\"l\":0.2,\"a\":0.2},\"hex\":\"#3B194D\",\"rgba\":{\"r\":59,\"g\":25,\"b\":77,\"a\":0.2},\"hsv\":{\"h\":278.8235294117647,\"s\":0.6666666666666667,\"v\":0.30000000000000004,\"a\":0.2},\"oldHue\":278.8235294117647,\"source\":\"rgba\",\"a\":0.2}";
	public Sql2oModel(Sql2o sql2o) {
		this.sql2o = sql2o;

	}

	@Override
	public List<Sensor> getAllSensors(String filter) {
		try (Connection conn = sql2o.open()) {
			String whereclause="";
			if (filter != "")
			{
				whereclause ="where "+filter;
			}
			List<Sensor> sensors = conn.createQuery("SELECT sensor_id, sensor_name, sensor_type, sensor_hide FROM sensor "+whereclause)
					.executeAndFetch(Sensor.class);
			return sensors;
		}
	}
	public Sensor addSensor(Sensor sensor) {
		long sensr_id = sensor.getSensor_id();
		try (Connection conn = sql2o.open()) {
			 conn
					.createQuery("INSERT INTO `sensor` (`sensor_id`,`sensor_name`,`sensor_type`,`sensor_hide`)"
							+ "VALUES(:sensorid,:sensorname,:sensortype,:sensorhide)")
					.addParameter("sensorid", sensor.getSensor_id())
					.addParameter("sensorname", sensor.getSensor_name())
					.addParameter("sensortype", sensor.getSensor_type())
					.addParameter("sensorhide",  sensor.getSensor_hide())
					.executeUpdate();
		}
		return getSensor((int)sensr_id);
	}
	public Sensor getSensor(int id) {
		try (Connection conn = sql2o.open()) {
			Sensor sensor = conn.createQuery("SELECT sensor_id,sensor_name,sensor_type, sensor_hide FROM sensor where sensor_id=:id")
					.addParameter("id", id).executeAndFetch(Sensor.class).get(0);
			return sensor;
		}
	}

	@Override
	public SensorData getSensorData(int sensorId, Date dateFrom, Date dateTo, Detail detail) {
		try (Connection conn = sql2o.open()) {
			Integer value = conn
					.createQuery(
							"SELECT SUM(delta_date) as value FROM int_data where sensor_id = :sensorid and start_date>:fromdate and stop_date<:todate")
					.addParameter("sensorid", sensorId).addParameter("fromdate", dateFrom)
					.addParameter("todate", dateTo).executeScalar(Integer.class);
			Sensor sensor = conn.createQuery("SELECT sensor_id,sensor_name,sensor_type, sensor_hide FROM sensor where sensor_id=:id")
					.addParameter("id", sensorId).executeAndFetch(Sensor.class).get(0);
			SensorData data = new SensorData();
			data.setSensor(sensor);
			data.setData(value/detail.getValue());
			data.setDetail(detail);
			return data;
		}

	}

	@Override
	public List<EffectsData> getEffects(Date dateFrom, Date dateTo,Detail detail) {
		try (Connection conn = sql2o.open()) {
			List<EffectsData> effects = conn.createQuery("CALL effects(:dateFrom,:dateTo);")
					.addParameter("dateFrom", dateFrom).addParameter("dateTo", dateTo)
					.executeAndFetch(EffectsData.class);
			
			for (EffectsData effectsData : effects) {
				effectsData.setHours(effectsData.getHours()/detail.getValue());
			}
			return effects;
		}
	}

	@Override
	public List<GaugesData> getGauges(Date dateTo) {
		try (Connection conn = sql2o.open()) {
			List<GaugesData> gauges = conn.createQuery("CALL gauges(:dateTo);").addParameter("dateTo", dateTo)
					.executeAndFetch(GaugesData.class);
			for (GaugesData gaugesData : gauges) {
				gaugesData.setValue(gaugesData.getValue()/gaugesData.getDetail().getValue());
			}
			return gauges;
		}
	}

	@Override
	public DeviceData getData() {
		try (Connection conn = sql2o.open()) {
			DeviceData device = conn.createQuery("SELECT device_id, device_name, device_shifts, device_uptime  FROM device limit 1")
					.executeAndFetch(DeviceData.class).get(0);
			return device;
		}
	}

	@Override
	public DeviceData changeData(int device_id, String device_name, float device_shifts ) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("UPDATE device SET device_name=:devicename, device_shifts=:shifts where device_id=:id")
					.addParameter("devicename", device_name).addParameter("id", device_id).addParameter("shifts", device_shifts).executeUpdate();
		}
		return getData();
	}

	@Override
	public List<EffectsData> getBars() {
		try (Connection conn = sql2o.open()) {
			List<EffectsData> effects = conn
					.createQuery("SELECT bar_id,bar_label,bar_color,bar_type,sensor_id,sort_order,bar_colors FROM effectsbar;")
					.executeAndFetch(EffectsData.class);
			return effects;
		}
	}

	@Override
	public EffectsData getBar(int bar_id) {
		try (Connection conn = sql2o.open()) {
			List<EffectsData> bars = conn
					.createQuery(
							"SELECT bar_id,bar_label,bar_color,bar_type,sensor_id,sort_order,bar_colors  FROM effectsbar WHERE bar_id=:bar_id limit 1")
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
		if (bar.getBar_colors() != null && !bar.getBar_colors().isEmpty()) {
			sql.append("bar_colors = :bar_colors,");
			params.put("bar_colors", bar.getBar_colors());
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
		long bar_id = 0;
		try (Connection conn = sql2o.open()) {
			bar_id =  (long) conn
					.createQuery("INSERT INTO effectsbar (`bar_label`,`bar_color`,`bar_type`,`sensor_id`,`sort_order`,`bar_colors`)"
							+ "VALUES(:bar_label,:bar_color,:bar_type,:sensor_id,:sort_order,:bar_colors)")
					.addParameter("bar_label", bar.getBar_label() == null ? "bar" : bar.getBar_label())
					.addParameter("bar_color", bar.getBar_color() == null ? "128, 128, 128" : bar.getBar_color())
					.addParameter("bar_colors", bar.getBar_colors() == null ?defaultColor:bar.getBar_colors())
					.addParameter("bar_type", bar.getBar_type() == null ? "Plan" : bar.getBar_type().toString())
					.addParameter("sensor_id", bar.getSensor_id() == 0 ? "0" : bar.getSensor_id())
					.addParameter("sort_order", bar.getSort_order() == 0 ? "0" : bar.getSort_order()).executeUpdate()
					.getKey();
		}
		return getBar((int)bar_id);
	}

	@Override
	public GaugesData getGauge(int gauge_id) {
		try (Connection conn = sql2o.open()) {
			List<GaugesData> gauges = conn
					.createQuery(
							"SELECT  `gauge_id`,`gauge_label`, `gauge_unit`,`sort_order`,`init_value`, `limit_value`,`start_green`, `start_yellow`,`start_red`, `sensor_id`,`init_date`,`mileage_date`, `detail`"
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
		if (gauge.getDetail() != null) {
			sql.append("detail = :detail,");
			params.put("detail", gauge.getDetail());
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
							"INSERT INTO servicegauge (`gauge_label`,`gauge_unit`,`sort_order`,`init_value`,`limit_value`,`start_green`,`start_yellow`,`start_red`,`sensor_id`,`init_date`,`mileage_date`,`detail`)"
									+ "VALUES(:gauge_label,:gauge_unit,:sort_order,:init_value,:limit_value,:start_green,:start_yellow,:start_red,:sensor_id,:init_date,:mileage_date,:detail)")
					.addParameter("gauge_label", gauge.getGauge_label() == null ? "bar" : gauge.getGauge_label())
					.addParameter("gauge_unit", gauge.getGauge_unit() == null ? "" : gauge.getGauge_unit())
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
					.addParameter("detail", gauge.getDetail())
					.executeUpdate().getKey();
		}
		return getGauge((int) gauge_id);
	}

	@Override
	public User getUserByUsername(String username) {
		try (Connection conn = sql2o.open()) {
			List<User> users = conn
					.createQuery(
							"SELECT user_id, user_name, user_email, access_id, salt FROM users where user_name=:id")
					.addParameter("id", username).executeAndFetch(User.class);
			User user = null;
			if (!users.isEmpty()) {
				user = users.get(0);
				user.setRoles(getRolesFor(conn, user.getUser_id()));
			}
			return user;
		}
	}

	@Override
	public User getUserByAccessId(String access_id) {
		try (Connection conn = sql2o.open()) {
			List<User>  users = conn
					.createQuery(
							"SELECT user_id, user_name, user_email, access_id, salt FROM users where access_id=:id")
					.addParameter("id", access_id).executeAndFetch(User.class);
			User user = null;
			if (!users.isEmpty()) {
				user = users.get(0);
				user.setRoles(getRolesFor(conn, user.getUser_id()));
			}
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
		 
		try (Connection conn = sql2o.open()) {
			 conn
					.createQuery("INSERT INTO users (`user_name`,`user_email`,`access_id`,`salt`)"
							+ "VALUES(:username,:useremail,:accessid,:salt)")
					.addParameter("username", username == null ? "newuser" : username)
					.addParameter("useremail", email == null ? "" : email)
					.addParameter("accessid", newHashedPassword == null ? "" : newHashedPassword)
					.addParameter("salt", newSalt == null ? "" : newSalt).executeUpdate();
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
		Map<String, Object> params = new HashMap<>();
		StringBuilder sql = new StringBuilder("update users set ");
		if (user.getEmail() != null && !user.getEmail().isEmpty()) {
			sql.append("user_email = :user_email,");
			params.put("user_email", user.getEmail());
		}
		sql.deleteCharAt(sql.length() - 1);

		sql.append(" where user_name = :id");
		if (!params.isEmpty()) {
			try (Connection conn = sql2o.open()) {
				Query query = conn.createQuery(sql.toString());

				for (String key : params.keySet()) {
					query.addParameter(key, params.get(key));
				}

				query.addParameter("id", user.getUsername()).executeUpdate();
			}
		}
		return getUserByUsername(user.getUsername());
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
							"SELECT users.user_id, user_name, user_email, access_id FROM users join userrole on users.user_id = userrole.user_id join role on role.role_id=userrole.role_id WHERE role.role_name=:rolename")
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
 
		User user = getUserByUsername(username);
		try (Connection conn = sql2o.open()) {
			
			String roleidstr =  conn.createQuery("select role_id from  role where role.role_name =:rolename")
					.addParameter("rolename", role)
					.executeAndFetch(String.class).get(0);
			int roleid = Integer.parseInt(roleidstr);
			 conn.createQuery("INSERT INTO userrole (`user_id`,`role_id`)"
							+ "VALUES(:userid,:roleid)")
					.addParameter("userid", user.getUser_id())
					.addParameter("roleid", roleid)
					.executeUpdate();
		}
		return getUserByUsername(username);
	}

	@Override
	public User deleteUserRole(String username, String role) {
		User user = getUserByUsername(username);
		try (Connection conn = sql2o.open()) {
			
			String roleidstr =  conn.createQuery("select role_id from  role where role.role_name =:rolename")
					.addParameter("rolename", role)
					.executeAndFetch(String.class).get(0);
			int roleid = Integer.parseInt(roleidstr);
			 conn.createQuery("DELETE FROM userrole WHERE user_id=:userid and role_id=:roleid")
					.addParameter("userid", user.getUser_id())
					.addParameter("roleid", roleid)
					.executeUpdate();
		}
		return getUserByUsername(username);
	}

	@Override
	public Sensor updateSensor(Sensor sensorData) {
		Map<String, Object> params = new HashMap<>();
		StringBuilder sql = new StringBuilder("update sensor set ");
		if (sensorData.getSensor_name()!= null && !sensorData.getSensor_name().isEmpty()) {
			sql.append("sensor_name = :sensor_name,");
			params.put("sensor_name", sensorData.getSensor_name());
		}
		if (sensorData.getSensor_type()!= null) {
			sql.append("sensor_type = :sensor_type,");
			params.put("sensor_type", sensorData.getSensor_type());
		}
		if (sensorData.getSensor_hide()!= null) {
			sql.append("sensor_hide = :sensor_hide,");
			params.put("sensor_hide", sensorData.getSensor_hide());
		}
		sql.deleteCharAt(sql.length() - 1);

		sql.append(" where sensor_id = :id");
		if (!params.isEmpty()) {
			try (Connection conn = sql2o.open()) {
				Query query = conn.createQuery(sql.toString());

				for (String key : params.keySet()) {
					query.addParameter(key, params.get(key));
				}

				query.addParameter("id", sensorData.getSensor_id()).executeUpdate();
			}
		}
		return getSensor(sensorData.getSensor_id());
	}

	@Override
	public Sensor clearSensor(Sensor sensorData) {
		try (Connection conn = sql2o.open()) {
			final Calendar cal = Calendar.getInstance();
		    //cal.add(Calendar.DATE, -1);
			if(!sensorData.getSensor_type())
			{
				conn.createQuery("DELETE FROM int_data WHERE sensor_id=:sensorid")
				.addParameter("sensorid", sensorData.getSensor_id())
				.executeUpdate();
				
				conn.createQuery("INSERT INTO int_data (`int_id`,`sensor_id`,`prev_stop_date`,`stop_date`,`start_date`,"
						+ "`delta_date`,`complete`) VALUES(:intid,:sensorid,:prevdate,:stopdate,:startdate,:deltadate,:complete)")
				.addParameter("intid", sensorData.getSensor_id())
				.addParameter("sensorid", sensorData.getSensor_id())
				.addParameter("prevdate",cal.getTime())
				.addParameter("stopdate",cal.getTime())
				.addParameter("startdate",cal.getTime())
				.addParameter("deltadate",0)
				.addParameter("complete", 1)
				.executeUpdate();
			}
		}
		return getSensor(sensorData.getSensor_id());
	}

	@Override
	public ConfigurationData saveConfiguration(String configuration_name) {
		long config_id = 0;
		ConfigurationData configurationData = new ConfigurationData();
		configurationData.setConfig_name(configuration_name);
		configurationData.setSensors(getAllSensors(""));
		configurationData.setEffects(getBars());
		configurationData.setGauges(getGauges(new Date()));
		configurationData.setDevice(getData());
		
		try (Connection conn = sql2o.open()) {
			
			config_id =  (long) conn
					.createQuery("INSERT INTO `configuration`(`config_name`,`effects`,`sensors`,`device`,`gauges`)"
							+ "VALUES(:config_name,:effects,:sensors,:device,:gauges)")
					.addParameter("config_name", configurationData.getConfig_name() == null ? "conf" : configurationData.getConfig_name())
					.addParameter("effects", JsonUtil.dataToJson(configurationData.getEffects()) == null ? "" :  JsonUtil.dataToJson(configurationData.getEffects()))
					.addParameter("sensors", JsonUtil.dataToJson(configurationData.getSensors()) == null ? "" :  JsonUtil.dataToJson(configurationData.getSensors()))
					.addParameter("device", JsonUtil.dataToJson(configurationData.getDevice()) == null ? "" :  JsonUtil.dataToJson(configurationData.getDevice()))
					.addParameter("gauges", JsonUtil.dataToJson(configurationData.getGauges()) == null ? "" :  JsonUtil.dataToJson(configurationData.getGauges()))
					.executeUpdate()
					.getKey();
			configurationData.setConfig_id((int)config_id);
		}
		 return configurationData;
 
	}

	@Override
	public List<ConfigurationData> getConfigurations(int config_id) {
		List<ConfigurationData> configs =  new ArrayList<ConfigurationData>();
		try (Connection conn = sql2o.open()) {
			
			ObjectMapper mapper = new ObjectMapper();
			SimpleDateFormat myDateFormat = new SimpleDateFormat("dd.MM.yyyy");
			mapper.setDateFormat(myDateFormat);
			Query query = conn.createQuery("SELECT `config_id`, `config_name`, `effects`,`sensors`,`device`,`gauges` FROM  `configuration`");
			if (config_id > 0) {
				query = conn.createQuery("SELECT `config_id`, `config_name`, `effects`,`sensors`,`device`,`gauges` FROM  `configuration` WHERE `config_id` = :configid")
						.addParameter("configid", config_id);
			}
			List<ConfigurationDataSQL> configsSql = query
					.executeAndFetch(ConfigurationDataSQL.class);
			
			for (ConfigurationDataSQL cs : configsSql) {
				ConfigurationData data = new ConfigurationData();
				data.setConfig_id(cs.getConfig_id());
				data.setConfig_name(cs.getConfig_name());
				data.setDevice(mapper.readValue(cs.getDevice(),DeviceData.class));
				data.setEffects(Arrays.asList(mapper.readValue(cs.getEffects(),EffectsData[].class)));
				data.setGauges(Arrays.asList(mapper.readValue(cs.getGauges(),GaugesData[].class)));
				data.setSensors(Arrays.asList(mapper.readValue(cs.getSensors(),Sensor[].class)));
				configs.add(data);
			}
			
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return configs;
	}

	@Override
	public ConfigurationData applyConfigurations(int config_id) {
		ConfigurationData config = getConfigurations(config_id).get(0);
		try (Connection conn = sql2o.open()) {
			conn.createQuery("DELETE FROM sensor").executeUpdate();
			conn.createQuery("DELETE FROM servicegauge").executeUpdate();
			conn.createQuery("DELETE FROM effectsbar").executeUpdate();
		}
		DeviceData device = config.getDevice();
		changeData(device.getDevice_id(),device.getDevice_name(),device.getDevice_shifts());
		for (Sensor sensor : config.getSensors()) {
			addSensor(sensor);
		}
		for (EffectsData bar : config.getEffects()) {
			addBar(bar);
		}
		for (GaugesData gauge : config.getGauges()) {
			addGauge(gauge);
		}
		return config;
	}

	@Override
	public String deleteConfiguration(int config_id) {
		try (Connection conn = sql2o.open()) {
			conn.createQuery("DELETE FROM configuration WHERE config_id=:configid").addParameter("configid", config_id)
					.executeUpdate();
		}
		return getConfigurations(config_id).isEmpty() ? DELETEOK : DELETEERROR;
	}

	@Override
	public PureData getPureData(int pagesize, int pagenumber) {
		PureData data = new PureData();
		data.setSize(pagesize);
		data.setPage(pagenumber);
		try (Connection conn = sql2o.open()) {
			List<IntValue> values = conn.createQuery("SELECT sensor_id,start_date,stop_date,delta_date FROM  int_data order by start_date desc,  sensor_id limit :offset,:size")
					.addParameter("offset", (pagenumber-1)*pagesize)
					.addParameter("size", pagesize)
					.executeAndFetch(IntValue.class);
			long count = conn.createQuery("SELECT COUNT(*) FROM int_data").executeScalar(Long.class);
			data.setTotal(count);
			data.setData(values);
			return data;
		}
	}

	@Override
	public int writeUptime(Date uptime) {
		int ok=0;
		try (Connection conn = sql2o.open()) {
			conn.createQuery("UPDATE device SET device_uptime=:deviceuptime")
					.addParameter("deviceuptime", uptime).executeUpdate();
			ok=1;
		}
		
		return ok;
	}
}
