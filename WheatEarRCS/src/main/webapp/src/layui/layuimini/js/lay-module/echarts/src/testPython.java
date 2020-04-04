
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
 
public class testPython {
	
	public static void main(String[] args) {
		String exec = "python";
		String url = "E:/LqbUser/eclipseWorkSpace/Test/src/py/testhello.py";
		String name = "liuqingbin";
		String age = "21";
		String[] cmd = new String[] {exec, url,name,age};
        try {
        	String cmd2 = "";
            Process process = Runtime.getRuntime().exec(cmd);
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream(),"utf-8"));
            String line = null;
	        while ((line = in.readLine()) != null) {  
	        	if(line.equals("#")){
	        		System.out.println("---------#分隔符------------");
	        	}
	        	if(line.equals("")){
	        		System.out.println("回车;;;;");
	        	}
	            System.out.println(line);  
	        }  

	        in.close();
	        //java代码中的process.waitFor()返回值为0表示我们调用python脚本成功，
            //返回值为1表示调用python脚本失败，这和我们通常意义上见到的0与1定义正好相反
	        int re = process.waitFor();  
	        System.out.println(re);
	        if(re == 0){
	        	System.out.println("执行成功");
	        }else{
	        	System.out.println("失败");
	        }
	        System.out.println("-------------------------");
        } catch (Exception e) {
            e.printStackTrace();
        }  
	}
	
}
