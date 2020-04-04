import java.io.BufferedReader;
import java.io.InputStreamReader;
 
public class HelloPython {
	/**
	 * 
	 * 无输入
	 * @param args
	 */
	public static void main(String[] args) {//E:\LqbUser\eclipseWorkSpace\Test\src\py\holle.py
		
		String[] arguments = new String[] {"python", "E:/LqbUser/eclipseWorkSpace/Test/src/py/holle.py"};
        System.out.println("----------1--------------");
		try {
            Process process = Runtime.getRuntime().exec(arguments);
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream(),"utf-8"));
            String line = null;
	        System.out.println("--------2----------------");
	        while ((line = in.readLine()) != null) {  
	            System.out.println(line);  
	        }  
	        in.close();
	        System.out.println("--------3----------------");
	        //java代码中的process.waitFor()返回值为0表示我们调用python脚本成功，
            //返回值为1表示调用python脚本失败，这和我们通常意义上见到的0与1定义正好相反
	        int re = process.waitFor();  
	        System.out.println(re);
        } catch (Exception e) {
            e.printStackTrace();
        }  
	}
}

