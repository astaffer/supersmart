package sbox.auth;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.user.User;
import sbox.user.UserController;
import sbox.util.JsonUtil;
import sbox.util.Path;
import sbox.util.ViewUtil;
import spark.Request;
import spark.Response;
import spark.Route;

public class AuthController {
	public static final String RESPONSE_TYPE = "application/json";
	public static final String AUTH_ERROR = "Unauthorized";
	public static final String AUTH_OK = "OK";
	private static final int HTTP_BAD_REQUEST = 400;
	private static final int HTTP_GOOD_REQUEST = 200;
	public static Route serveAuth = (Request request, Response response) -> {
		response.status(HTTP_GOOD_REQUEST);
		Map<String, Object> model = new HashMap<>();
		// model.put("users", userDao.getAllUserNames());
		return ViewUtil.render(request, model, Path.Template.LOGIN);
	};
	public static Route serveAuthPost = (Request request, Response response) -> {
		Auth auth = new Auth();
		ObjectMapper mapper = new ObjectMapper();
		AuthPayload user = mapper.readValue(request.body(), AuthPayload.class);
		if (!user.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}

		if (UserController.authenticate(user.username, user.password)) {
			User userp = UserController.getUser(user.username);
			auth.access_id = userp.getAccess_id();
			auth.message = AUTH_OK;
		} else {
			auth.access_id = "";
			auth.message = AUTH_ERROR;
		}
		response.status(HTTP_GOOD_REQUEST);
		response.type(RESPONSE_TYPE);
		return JsonUtil.dataToJson(auth);
	};

	public static boolean authAccess(String access_id) {
		boolean access = false;
		User user = UserController.getUserByAccessId(access_id);
		if (user != null) {
			access = access_id.equals(user.getAccess_id());
		}
		return access;
	}
}
