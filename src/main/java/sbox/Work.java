package sbox;

import static spark.Spark.*;

import java.util.logging.Logger;

import org.sql2o.Sql2o;

import com.beust.jcommander.JCommander;


import sbox.auth.AuthController;
import sbox.index.IndexController;
import sbox.sensor.SensorController;
import sbox.user.UserDao;
import sbox.util.*;

 
 

public class Work {
	private static final Logger logger = Logger.getLogger(Work.class.getCanonicalName());
	public static UserDao userDao;
	public static Sql2o sql2o;
	public static void main(String[] args) {
		CommandLineOptions options = new CommandLineOptions();
		new JCommander(options, args);
		logger.finest("Options.debug = " + options.debug);
		logger.finest("Options.database = " + options.database);
		logger.finest("Options.dbHost = " + options.dbHost);
		logger.finest("Options.dbUsername = " + options.dbUsername);
		logger.finest("Options.dbPort = " + options.dbPort);
		logger.finest("Options.servicePort = " + options.servicePort);
		userDao = new UserDao();
		port(options.servicePort);
		staticFiles.location("/public");
		staticFiles.expireTime(600L);
		  sql2o = new Sql2o("jdbc:mysql://" + options.dbHost + ":" + options.dbPort + "/" + options.database,
	            options.dbUsername, options.dbPassword   );

		enableCORS("*", "GET,POST", "Content-Type,Authorization,X-Requested-With,Content-Length,Accept,Origin");
		// Set up routes
		get(Path.Web.INDEX, IndexController.serveWebPack);
		get(Path.Web.AUTH, AuthController.serveAuth);
		post(Path.Web.AUTH, AuthController.serveAuthPost);
		post(Path.Web.SENSORS, SensorController.getSensors);
		post(Path.Web.SENSORDATA, SensorController.getSensorData); 
		
	}
	// Enables CORS on requests. This method is an initialization method and should be called once.
	private static void enableCORS(final String origin, final String methods, final String headers) {

	    options("/*", (request, response) -> {

	        String accessControlRequestHeaders = request.headers("Access-Control-Request-Headers");
	        if (accessControlRequestHeaders != null) {
	            response.header("Access-Control-Allow-Headers", accessControlRequestHeaders);
	        }

	        String accessControlRequestMethod = request.headers("Access-Control-Request-Method");
	        if (accessControlRequestMethod != null) {
	            response.header("Access-Control-Allow-Methods", accessControlRequestMethod);
	        }

	        return "OK";
	    });

	    before((request, response) -> {
	        response.header("Access-Control-Allow-Origin", origin);
	        response.header("Access-Control-Request-Method", methods);
	        response.header("Access-Control-Allow-Headers", headers);
	        // Note: this may or may not be necessary in your particular application
	        //response.type("application/json");
	    });
	}
}
