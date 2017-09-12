package sbox.index;
import java.util.Date;
import java.util.List;


import lombok.Data;

@Data
public class IntValue {
	int sensor_id;
	Date date_start;
	Date date_end;
	int int_value;
}
