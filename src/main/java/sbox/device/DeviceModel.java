package sbox.device;

public interface DeviceModel {
	DeviceData getData();
	DeviceData changeData(int device_id, String device_name);
}
