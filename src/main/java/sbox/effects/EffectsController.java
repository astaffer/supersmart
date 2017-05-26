package sbox.effects;

import static sbox.Work.sql2o;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import spark.Request;
import spark.Response;
import spark.Route;

public class EffectsController {
	private static final int HTTP_BAD_REQUEST = 400;
	public static Route getEffects = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		EffectsDataPayload effects = mapper.readValue(request.body(), EffectsDataPayload.class);
		if (!effects.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		EffectsModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getEffects(effects.dateFrom,effects.dateTo));
	};
	public static Route getBars = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		BarsDataPayload bars = mapper.readValue(request.body(), BarsDataPayload.class);
		if (!bars.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		EffectsModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getBars());
	};
	public static Route getBar = (Request request, Response response) -> {
		int barId = Integer.parseInt(request.params(":id"));
		ObjectMapper mapper = new ObjectMapper();
		BarsDataPayload bars = mapper.readValue(request.body(), BarsDataPayload.class);
		if (!bars.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		EffectsModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getBar(barId));
	};
	public static Route addBar = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		BarDataPayload bars = mapper.readValue(request.body(), BarDataPayload.class);
		if (!bars.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		EffectsModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.addBar(bars.getBar()));
	};
	public static Route deleteBar = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		DeleteBarDataPayload bars = mapper.readValue(request.body(), DeleteBarDataPayload.class);
		if (!bars.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		EffectsModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.deleteBar(bars.getBar_id()));
	};
	public static Route updateBar = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		BarDataPayload bars = mapper.readValue(request.body(), BarDataPayload.class);
		
		if (!bars.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		EffectsModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.updateBar(bars.getBar()));
	};
}
