package sbox.index;
import java.util.Date;
import java.util.List;


import lombok.Data;

@Data
public class IntValue {
	int sensor_id;
	Date start_date;
	Date stop_date;
	int delta_date;
}
