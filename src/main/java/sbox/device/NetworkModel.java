package sbox.device;

public interface NetworkModel {
	NetworkData getData();
	NetworkData setData(boolean dhcp, String ip, String mask,String gateway,String dns);
}
