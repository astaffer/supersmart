package sbox.util;
import lombok.*;
public class Path {
	 // The @Getter methods are needed in order to access
    // the variables from Velocity Templates
    public static class Web {
        @Getter public static final String INDEX = "/index/";
        @Getter public static final String LOGOUT = "/logout/";
        @Getter public static final String AUTH = "/auth/";
        @Getter public static final String LIVE = "/live/";
        @Getter public static final String SENSORDATA = "/sensors/:id/data";
        @Getter public static final String SENSORS = "/sensors/";
        /* DEVICE */
        @Getter public static final String DEVICE = "/device/";
        @Getter public static final String DEVICEUPD = "/device/change/";
        /* EFFECTS */
        @Getter public static final String EFFECTS = "/effects/";
        @Getter public static final String BARS = "/bars/";
        @Getter public static final String BAR = "/bars/:id/";
        @Getter public static final String BARUPD = "/bars/:id/change/";
        @Getter public static final String BARDEL = "/bars/:id/delete/";
        @Getter public static final String BARADD = "/bars/add/";
        /* GAUGES */
        @Getter public static final String GAUGES = "/gauges/";
        @Getter public static final String GAUGE = "/gauges/:id/";
        @Getter public static final String GAUGEUPD = "/gauges/:id/change/";
        @Getter public static final String GAUGEDEL = "/gauges/:id/delete/";
        @Getter public static final String GAUGEADD = "/gauges/add/";
        
        
    }

    public static class Template {
        public final static String INDEX = "/velocity/index/index.vm";
        public final static String LOGIN = "/velocity/login/login.vm";
        public static final String NOT_FOUND = "/velocity/notFound.vm";
    }
}
