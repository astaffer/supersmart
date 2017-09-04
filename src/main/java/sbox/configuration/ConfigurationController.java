package sbox.configuration;
import static sbox.Work.sql2o;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import spark.Request;
import spark.Response;
import spark.Route;

public class ConfigurationController {
	private static final int HTTP_BAD_REQUEST = 400;
	public static Route saveConfiguration = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		ConfigurationPayload config = mapper.readValue(request.body(), ConfigurationPayload.class);
		if (!config.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		
		response.status(200);
		response.type("application/json");
		ConfigurationModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.saveConfiguration(config.config_name));
	};
	public static Route getConfigurations = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		ConfigurationsPayload config = mapper.readValue(request.body(), ConfigurationsPayload.class);
		if (!config.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		
		response.status(200);
		response.type("application/json");
		ConfigurationModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.getConfigurations(0));
	};
	public static Route applyConfiguration = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		ConfigurationsPayload config = mapper.readValue(request.body(), ConfigurationsPayload.class);
		if (!config.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		
		response.status(200);
		response.type("application/json");
		ConfigurationModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.applyConfigurations(config.getConfig_id()));
	};
	public static Route removeConfiguration = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		ConfigurationsPayload config = mapper.readValue(request.body(), ConfigurationsPayload.class);
		if (!config.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		
		response.status(200);
		response.type("application/json");
		ConfigurationModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.deleteConfiguration(config.getConfig_id()));
	};
}
