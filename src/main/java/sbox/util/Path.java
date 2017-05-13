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
        @Getter public static final String SENSORS = "/sensors/";
        @Getter public static final String EFFECTS = "/effects/";
        @Getter public static final String MACHINEDATA = "/machine/";
        @Getter public static final String SENSORDATA = "/sensors/:id/data";
    }

    public static class Template {
        public final static String INDEX = "/velocity/index/index.vm";
        public final static String LOGIN = "/velocity/login/login.vm";
        public static final String NOT_FOUND = "/velocity/notFound.vm";
    }
}
