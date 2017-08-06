package sbox;

import static spark.Spark.*;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalDateTime;
import java.util.logging.Logger;

import javax.swing.Timer;

import org.sql2o.Sql2o;

import com.beust.jcommander.JCommander;

import sbox.auth.AuthController;
import sbox.device.DeviceController;
import sbox.effects.EffectsController;
import sbox.gauges.GaugesController;
import sbox.hw.HWModel;
import sbox.index.IndexController;
import sbox.sensor.SensorController;
import sbox.user.UserController;
import sbox.util.*;

public class Work {
	private static final Logger logger = Logger.getLogger(Work.class.getCanonicalName());
	public static Sql2o sql2o;
	public static HWModel hwm;

	public static void main(String[] args) {
		CommandLineOptions options = new CommandLineOptions();
		new JCommander(options, args);
		logger.finest("Options.debug = " + options.debug);
		logger.finest("Options.database = " + options.database);
		logger.finest("Options.dbHost = " + options.dbHost);
		logger.finest("Options.dbUsername = " + options.dbUsername);
		logger.finest("Options.dbPort = " + options.dbPort);
		logger.finest("Options.servicePort = " + options.servicePort);
		logger.finest("Options.updelay = " + options.updelay);
		port(options.servicePort);
		staticFiles.location("/public");
		staticFiles.expireTime(600L);
		String encoding = "?useUnicode=yes&characterEncoding=UTF-8";
		sql2o = new Sql2o("jdbc:mysql://" + options.dbHost + ":" + options.dbPort + "/" + options.database + encoding,
				options.dbUsername, options.dbPassword);

		enableCORS("*", "GET,POST", "Content-Type,Authorization,X-Requested-With,Content-Length,Accept,Origin");
		// Set up routes
		get(PathUrls.Web.INDEX, IndexController.serveWebPack);
		get(PathUrls.Web.STATUS, IndexController.getStatus);
		get(PathUrls.Web.AUTH, AuthController.serveAuth);
		post(PathUrls.Web.AUTH, AuthController.serveAuthPost);

		post(PathUrls.Web.DEVICE, DeviceController.getDevice);
		post(PathUrls.Web.DEVICEUPD, DeviceController.updateDevice);
		post(PathUrls.Web.SENSORS, SensorController.getSensors);
		post(PathUrls.Web.SENSORDATA, SensorController.getSensorData);
		post(PathUrls.Web.SENSORUPD, SensorController.updateSensorName);

		post(PathUrls.Web.EFFECTS, EffectsController.getEffects);
		post(PathUrls.Web.BARS, EffectsController.getBars);
		post(PathUrls.Web.BAR, EffectsController.getBar);
		post(PathUrls.Web.BARADD, EffectsController.addBar);
		post(PathUrls.Web.BARDEL, EffectsController.deleteBar);
		post(PathUrls.Web.BARUPD, EffectsController.updateBar);

		post(PathUrls.Web.GAUGES, GaugesController.getGauges);
		post(PathUrls.Web.GAUGE, GaugesController.getGauge);
		post(PathUrls.Web.GAUGEADD, GaugesController.addGauge);
		post(PathUrls.Web.GAUGEDEL, GaugesController.deleteGauge);
		post(PathUrls.Web.GAUGEUPD, GaugesController.updateGauge);

		post(PathUrls.Web.USERS, UserController.getAllUsers);
		post(PathUrls.Web.USER, UserController.getUser);
		post(PathUrls.Web.USERGET, UserController.getUserByAccessId);
		post(PathUrls.Web.USERADD, UserController.createUser);
		post(PathUrls.Web.USERDEL, UserController.deleteUser);
		post(PathUrls.Web.USERUPD, UserController.changeUser);
		post(PathUrls.Web.USERCHANGEPASSWORD, UserController.changePassword);

		post(PathUrls.Web.USERSBYROLE, UserController.getUsersByRole);
		post(PathUrls.Web.ROLES, UserController.getRoles);
		post(PathUrls.Web.USERADDROLE, UserController.addUserRole);
		post(PathUrls.Web.USERDELETEROLE, UserController.deleteUserRole);

		post(PathUrls.Web.DEVICENETWORKSET, DeviceController.setNetworkSettings);
		post(PathUrls.Web.DEVICENETWORKGET, DeviceController.getNetworkSettings);
		writeUptime(options.updelay);
	}

	private static void writeUptime(int delay) {
		String fileName = System.getProperty("user.dir") + File.separator + "uptime.txt";
		Timer timer = new Timer(1000 * delay, new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				Path path = Paths.get(fileName);
				try (BufferedWriter writer = Files.newBufferedWriter(path, StandardCharsets.UTF_8,
						StandardOpenOption.CREATE)) {
					writer.write(LocalDateTime.now().toString());

				} catch (IOException e) {
					// handle the exception
					// basic handling
					System.out.println(e.getMessage());

				}
			}
		});
		timer.start();
	}

	// Enables CORS on requests. This method is an initialization method and
	// should be called once.
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
			// Note: this may or may not be necessary in your particular
			// application
			// response.type("application/json");
		});
	}
}
