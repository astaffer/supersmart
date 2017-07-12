package sbox.hw;


import sbox.device.NetworkData;
import sbox.device.NetworkModel;

public class HWModel implements NetworkModel {
	private final NetworkData network = //new NetworkData(false, null, null, null, null); 
			 new NetworkData(false, "192.168.10.10", "255.255.255.0", "10.0.0.1", "8.8.8.8");

	@Override
	public NetworkData getData() {
		// TODO Auto-generated method stub
		// String[] cmd = new String[]{"/bin/sh", "path/to/script.sh"};
		// Process pr = Runtime.getRuntime().exec(cmd);
		return network;
	}

	@Override
	public NetworkData setData(boolean dhcp, String ip, String mask, String gateway, String dns) {
		// String[] cmd = new String[]{"/bin/sh", "path/to/script.sh"};
		// Process pr = Runtime.getRuntime().exec(cmd);
		network.setDhcp(dhcp);
		network.setIp(ip);
		network.setGateway(gateway);
		network.setMask(mask);
		network.setDns(dns);
		return null;
	}

}
