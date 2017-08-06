package sbox.util;
import lombok.*;
public class PathUrls {
	 // The @Getter methods are needed in order to access
    // the variables from Velocity Templates
    public static class Web {
        @Getter public static final String INDEX = "/index/";
        @Getter public static final String STATUS = "/status/";
        @Getter public static final String LOGOUT = "/logout/";
        @Getter public static final String AUTH = "/auth/";
        @Getter public static final String LIVE = "/live/";
        @Getter public static final String SENSORDATA = "/sensor/:id/data";
        @Getter public static final String SENSORS = "/sensors/";
        @Getter public static final String SENSORUPD = "/sensors/change/";
        /* DEVICE */
        @Getter public static final String DEVICE = "/device/";
        @Getter public static final String DEVICEUPD = "/device/change/";
        @Getter public static final String DEVICENETWORKSET = "/device/network/set/";
        @Getter public static final String DEVICENETWORKGET = "/device/network/";
        /* EFFECTS */
        @Getter public static final String EFFECTS = "/effects/";
        @Getter public static final String BARS = "/bars/";
        @Getter public static final String BAR = "/bar/:id/";
        @Getter public static final String BARUPD = "/bars/change/";
        @Getter public static final String BARDEL = "/bars/delete/";
        @Getter public static final String BARADD = "/bars/add/";
        /* GAUGES */
        @Getter public static final String GAUGES = "/gauges/";
        @Getter public static final String GAUGE = "/gauge/:id/";
        @Getter public static final String GAUGEUPD = "/gauges/change/";
        @Getter public static final String GAUGEDEL = "/gauges/delete/";
        @Getter public static final String GAUGEADD = "/gauges/add/";
        /*USERS*/
        @Getter public static final String USERS = "/users/";
        @Getter public static final String USER = "/user/:username/";
        @Getter public static final String USERGET = "/users/get/";
        @Getter public static final String USERUPD = "/users/change/";
        @Getter public static final String USERDEL = "/users/delete/";
        @Getter public static final String USERADD = "/users/add/";
        @Getter public static final String USERCHANGEPASSWORD = "/users/changepass/";
        @Getter public static final String USERADDROLE = "/users/addrole/";
        @Getter public static final String USERDELETEROLE = "/users/deleterole/";
        @Getter public static final String ROLES = "/roles/";
        @Getter public static final String USERSBYROLE = "/users/byrole/";
		 
    }

    public static class Template {
        public final static String INDEX = "/velocity/index/index.vm";
        public final static String LOGIN = "/velocity/login/login.vm";
        public static final String NOT_FOUND = "/velocity/notFound.vm";
    }
}
