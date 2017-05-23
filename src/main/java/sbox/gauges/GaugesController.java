package sbox.gauges;

import static sbox.Work.sql2o;

import com.fasterxml.jackson.databind.ObjectMapper;
import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import spark.Request;
import spark.Response;
import spark.Route;
public class GaugesController {
	private static final int HTTP_BAD_REQUEST = 400;
	public static Route getGauges = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugesDataPayload gauges = mapper.readValue(request.body(), GaugesDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getGauges(gauges.dateTo));
	};
	public static Route getGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugesDataPayload gauges = mapper.readValue(request.body(), GaugesDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getGauges(gauges.dateTo));
	};
	public static Route addGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugesDataPayload gauges = mapper.readValue(request.body(), GaugesDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getGauges(gauges.dateTo));
	};
	public static Route updateGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugesDataPayload gauges = mapper.readValue(request.body(), GaugesDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getGauges(gauges.dateTo));
	};
	public static Route deleteGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugesDataPayload gauges = mapper.readValue(request.body(), GaugesDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getGauges(gauges.dateTo));
	};
}
