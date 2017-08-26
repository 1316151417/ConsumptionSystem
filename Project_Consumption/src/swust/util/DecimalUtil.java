package swust.util;

import java.math.BigDecimal;

public class DecimalUtil {
	public static double keepTwoDecimal(double value){
		BigDecimal bd = new BigDecimal(value);
		return bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
}
