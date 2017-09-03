package sbox.configuration;

import java.util.List;

import lombok.Data;
import sbox.device.DeviceData;
import sbox.effects.EffectsData;
import sbox.gauges.GaugesData;
import sbox.sensor.Sensor;

@Data
public class ConfigurationDataSQL {
	int config_id;
	String config_name;
	String device;
	String sensors;
	String gauges;
	String effects;
}
