package Date;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TestTime {

	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyyMMddhhmmss");
		System.out.println(dateFormat.format(date));

	}
}
