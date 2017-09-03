package sbox.configuration;

import java.util.List;

import lombok.Data;
import sbox.device.DeviceData;
import sbox.effects.EffectsData;
import sbox.gauges.GaugesData;
import sbox.sensor.Sensor;

@Data
public class ConfigurationData {
	int config_id;
	String config_name;
	DeviceData device;
	List<Sensor> sensors;
	List<GaugesData> gauges;
	List<EffectsData> effects;
}
