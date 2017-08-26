package sbox.device;

import static sbox.Work.sql2o;
import static sbox.Work.hwm;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.hw.HWModel;
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
		DeviceData dev =device.getDevice();
		DeviceModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.changeData(dev.device_id, dev.device_name,dev.device_shifts));
	};
	public static Route getNetworkSettings = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		DeviceDataPayload device = mapper.readValue(request.body(), DeviceDataPayload.class);
		if (!device.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		NetworkModel model =  new HWModel();
		return JsonUtil.dataToJson(model.getData());
	};
	public static Route setNetworkSettings = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		NetworkDataPayload device = mapper.readValue(request.body(), NetworkDataPayload.class);
		if (!device.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		NetworkModel model =  new HWModel();
		NetworkData networkData = device.getNetwork();
		return JsonUtil.dataToJson(model.setData(networkData.isDhcp(),  networkData.getIp(), networkData.getMask(), networkData.getGateway(),networkData.getDns()));
	};
}
