package sbox.index;

import java.util.*;

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
	public static Route getMachineData = (Request request, Response response) -> {
		response.status(HTTP_GOOD_REQUEST);
		response.type(RESPONSE_TYPE);
		return JsonUtil.dataToJson("Станок сушки");
	  
};
	 
}
