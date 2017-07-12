package sbox.util;
import com.beust.jcommander.Parameter;

public class CommandLineOptions {

    @Parameter(names = "--debug")
	public
    boolean debug = false;

    @Parameter(names = {"--service-port"})
    public Integer servicePort = 8080;

    @Parameter(names = {"--database"})
    public String database = "sbox";

    @Parameter(names = {"--db-host"})
    public String dbHost = "localhost";

    @Parameter(names = {"--db-username"})
    public String dbUsername = "sparkuser";

    @Parameter(names = {"--db-password"})
    public String dbPassword = "123123";

    @Parameter(names = {"--db-port"})
    public Integer dbPort = 3306;
    @Parameter(names = {"--updelay"})
    public Integer updelay = 10;
}