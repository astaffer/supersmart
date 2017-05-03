package sbox.index;

import java.util.*;

import sbox.util.Path;
import sbox.util.ViewUtil;
import spark.*;

public class IndexController {
	public static Route serveIndexPage = (Request request, Response response) -> {
		Map<String, Object> model = new HashMap<>();
		// model.put("users", userDao.getAllUserNames());
		 return ViewUtil.render(request, model, Path.Template.INDEX);
	};
	public static Route serveWebPack = (Request request, Response response) -> {
			response.redirect("/index.html");
		 return null;
	};
	 
}
