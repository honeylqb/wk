
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
	        		System.out.println("---------#�ָ���------------");
	        	}
	        	if(line.equals("")){
	        		System.out.println("�س�;;;;");
	        	}
	            System.out.println(line);  
	        }  

	        in.close();
	        //java�����е�process.waitFor()����ֵΪ0��ʾ���ǵ���python�ű��ɹ���
            //����ֵΪ1��ʾ����python�ű�ʧ�ܣ��������ͨ�������ϼ�����0��1���������෴
	        int re = process.waitFor();  
	        System.out.println(re);
	        if(re == 0){
	        	System.out.println("ִ�гɹ�");
	        }else{
	        	System.out.println("ʧ��");
	        }
	        System.out.println("-------------------------");
        } catch (Exception e) {
            e.printStackTrace();
        }  
	}
	
}
