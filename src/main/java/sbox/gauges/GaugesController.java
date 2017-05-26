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
		int gaugeId = Integer.parseInt(request.params(":id"));
		ObjectMapper mapper = new ObjectMapper();
		GaugesDataPayload gauges = mapper.readValue(request.body(), GaugesDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getGauge(gaugeId));
	};
	public static Route addGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugeDataPayload gauges = mapper.readValue(request.body(), GaugeDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.addGauge(gauges.getGauge()));
	};
	public static Route updateGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		GaugeDataPayload gauges = mapper.readValue(request.body(), GaugeDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.updateGauge(gauges.getGauge()));
	};
	public static Route deleteGauge = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		DeleteGaugeDataPayload gauges = mapper.readValue(request.body(), DeleteGaugeDataPayload.class);
		if (!gauges.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		GaugesModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.deleteGauge(gauges.getGauge_id()));
	};
}
