package sbox.index;

import static sbox.Work.sql2o;

import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import sbox.util.PathUrls;
import sbox.util.ViewUtil;
import spark.*;

public class IndexController {
	public static final String RESPONSE_TYPE = "application/json";
	public static final String AUTH_ERROR = "Unauthorized";
	public static final String AUTH_OK = "OK";
	private static final int HTTP_BAD_REQUEST = 400;
	private static final int HTTP_GOOD_REQUEST = 200;
	public static Route serveIndexPage = (Request request, Response response) -> {
		Map<String, Object> model = new HashMap<>();
		// model.put("users", userDao.getAllUserNames());
		 return ViewUtil.render(request, model, PathUrls.Template.INDEX);
	};
	public static Route serveWebPack = (Request request, Response response) -> {
			response.redirect("/index.html");
		 return null;
	};
	public static Route getStatus = (Request request, Response response) -> {
		response.status(HTTP_GOOD_REQUEST);
		response.type(RESPONSE_TYPE);
		return JsonUtil.dataToJson("online");
	};
	public static Route getMachineData = (Request request, Response response) -> {
		response.status(HTTP_GOOD_REQUEST);
		response.type(RESPONSE_TYPE);
		return JsonUtil.dataToJson("Станок");
	};
	public static Route getPureData = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		IntValuePayload value = mapper.readValue(request.body(), IntValuePayload.class);
 		response.status(HTTP_GOOD_REQUEST);
		response.type("application/json");
		PureDataModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJsonDateExtended(model.getPureData(value.getPageSize(),value.getPageNumber()));
	};
	 
}
