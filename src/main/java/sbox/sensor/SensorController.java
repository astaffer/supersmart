package sbox.sensor;

import static sbox.Work.sql2o;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import spark.Request;
import spark.Response;
import spark.Route;

public class SensorController {
	private static final int HTTP_BAD_REQUEST = 400;
	public static Route getSensors = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		SensorPayload sensor = mapper.readValue(request.body(), SensorPayload.class);
		if (!sensor.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		SensorModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getAllSensors(sensor.filter));
	};
	public static Route getSensorData = (Request request, Response response) -> {
		int sensor = Integer.parseInt(request.params(":id"));
		ObjectMapper mapper = new ObjectMapper();
		SensorPayload sensorData = mapper.readValue(request.body(), SensorDataPayload.class);
		if (!sensorData.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		SensorModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getSensor(sensor));
	};
	public static Route updateSensorName = (Request request, Response response) -> {
		 
		ObjectMapper mapper = new ObjectMapper();
		UpdateSensorDataPayload sensorData = mapper.readValue(request.body(), UpdateSensorDataPayload.class);
		if (!sensorData.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		SensorModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.updateSensor(sensorData.getSensor()));
	};
	public static Route clearSensorData = (Request request, Response response) -> {
		 
		ObjectMapper mapper = new ObjectMapper();
		UpdateSensorDataPayload sensorData = mapper.readValue(request.body(), UpdateSensorDataPayload.class);
		if (!sensorData.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		SensorModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.clearSensor(sensorData.getSensor()));
	};
}
