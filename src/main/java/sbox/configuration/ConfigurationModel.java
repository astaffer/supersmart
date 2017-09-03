package sbox.configuration;

import java.util.List;

public interface ConfigurationModel {
	ConfigurationData saveConfiguration(String configuration_name);

	List<ConfigurationData> getConfigurations();
}
