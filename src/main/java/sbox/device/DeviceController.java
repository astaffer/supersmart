package sbox.device;

import static sbox.Work.sql2o;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import spark.Request;
import spark.Response;
import spark.Route;

public class DeviceController {
	private static final int HTTP_BAD_REQUEST = 400;
	public static Route getDevice = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		DeviceDataPayload device = mapper.readValue(request.body(), DeviceDataPayload.class);
		if (!device.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		DeviceModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getData());
	};
	public static Route updateDevice = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		DeviceDataChangePayload device = mapper.readValue(request.body(), DeviceDataChangePayload.class);
		if (!device.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		DeviceModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.changeData(device.device_id,device.device_name));
	};
}
