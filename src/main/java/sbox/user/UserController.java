package sbox.user;

import static sbox.Work.sql2o;

import org.mindrot.jbcrypt.BCrypt;

import com.fasterxml.jackson.databind.ObjectMapper;

import sbox.gauges.GaugesModel;
import sbox.sql.Sql2oModel;
import sbox.util.JsonUtil;
import spark.Request;
import spark.Response;
import spark.Route;

public class UserController {

	private static final int HTTP_BAD_REQUEST = 400;

	// Authenticate the user by hashing the inputted password using the stored
	// salt,
	// then comparing the generated hashed password to the stored hashed
	// password
	public static boolean authenticate(String username, String password) {
		if (username.isEmpty() || password.isEmpty()) {
			return false;
		}
		UserModel model = new Sql2oModel(sql2o);
		User user = model.getUserByUsername(username);
		if (user == null) {
			return false;
		}
		String hashedPassword = BCrypt.hashpw(password, user.getSalt());
		return hashedPassword.equals(user.getAccess_id());
	}

	public static User getUser(String username) {
		UserModel model = new Sql2oModel(sql2o);
		return model.getUserByUsername(username);
	}
	public static User getUserByAccessId(String access_id) {
		UserModel model = new Sql2oModel(sql2o);
		return model.getUserByAccessId(access_id);
	}
	public static Route createUser = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		UserPayload user = mapper.readValue(request.body(), UserPayload.class);
		if (!user.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		
		String newSalt = BCrypt.gensalt();
		String newHashedPassword = BCrypt.hashpw(newSalt, user.getPassword());
		UserModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.createUser(user.getUser_name(), newSalt, newHashedPassword, user.getEmail()));
	};
	public static Route deleteUser = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		DeleteUserPayload deleteuser = mapper.readValue(request.body(), DeleteUserPayload.class);
		if (!deleteuser.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		 
		UserModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.deleteUser(deleteuser.getUser_name()));
	};
	public static Route changePassword = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		NewPasswordUserPayload user = mapper.readValue(request.body(), NewPasswordUserPayload.class);
		if (!user.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		if (!authenticate(user.getUser_name(), user.getPassword())) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		String newSalt = BCrypt.gensalt();
		String newHashedPassword = BCrypt.hashpw(newSalt, user.getNewPassword());
		UserModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.changePassword(user.getUser_name(), newSalt, newHashedPassword));
	};
	public static Route changeUser = (Request request, Response response) -> {
		ObjectMapper mapper = new ObjectMapper();
		UserPayload user = mapper.readValue(request.body(),  UserPayload.class);
		if (!user.isValid()) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		if (!authenticate(user.getUser_name(), user.getPassword())) {
			response.status(HTTP_BAD_REQUEST);
			return "";
		}
		response.status(200);
		response.type("application/json");
		UserModel model = new Sql2oModel(sql2o);
		return JsonUtil.dataToJson(model.updateUser(user));
	};
	public static Route addUserRole = (Request request, Response response) ->{ return "";};
	public static Route deleteUserRole = (Request request, Response response) ->{ return "";};
	public static Route getUser= (Request request, Response response) ->{ return "";};
	public static Route getAllUsers= (Request request, Response response) ->{ return "";};
	public static Route getRoles= (Request request, Response response) ->{ return "";};
	public static Route getUsersByRole= (Request request, Response response) ->{ return "";};
}
