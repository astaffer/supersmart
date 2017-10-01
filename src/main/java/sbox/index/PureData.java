package sbox.index;
import java.util.Date;
import java.util.List;


import lombok.Data;

@Data
public class PureData {
	List<IntValue> data;
	long total;
	int page;
	int size;
}
