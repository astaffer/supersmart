package sbox.sensor;

public enum Detail {
	second(1),
	minute(60),
	hour(3600),
	day(24*3600),
	week(7*24*3600),
	month(30*24*3600),
	quarter(3*30*24*3600),
	year(12*30*24*3600);
	private final int value;
	private Detail(int _value) {
		value=_value;
	}
	 public int getValue() {
	        return value;
	    }
}
