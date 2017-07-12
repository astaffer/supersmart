package sbox.device;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class NetworkData {
	boolean dhcp;
	String ip;
	String mask;
	String gateway;
	String dns;
}
