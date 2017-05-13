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
}
