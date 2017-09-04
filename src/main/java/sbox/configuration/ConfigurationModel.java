package sbox.configuration;

import java.util.List;

public interface ConfigurationModel {
	ConfigurationData saveConfiguration(String configuration_name);

	List<ConfigurationData> getConfigurations(int config_id);

	ConfigurationData applyConfigurations(int config_id);
	String deleteConfiguration(int config_id);
}
