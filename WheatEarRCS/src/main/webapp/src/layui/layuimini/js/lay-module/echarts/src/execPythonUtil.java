import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

public class execPythonUtil {
	public static void main(String[] args) {
	
		docmd();
}

	static void docmd() {
		String[] command = { "cmd", };
		Process p = null;
		try {
			p = Runtime.getRuntime().exec(command);
			new Thread(new SyncPipe(p.getErrorStream(), System.err)).start();
			new Thread(new SyncPipe(p.getInputStream(), System.out)).start();
			PrintWriter stdin = new PrintWriter(p.getOutputStream());
//            /** 以下可以输入自己想输入的cmd命令 */
			stdin.println("python "+" E:/LqbUser/eclipseWorkSpace/Test/src/py/testhello.py "+" liuqingbin"+" 121");//此处自行填写，切记有空格，跟cmd的执行语句一致。
			
			stdin.close();
		} catch (Exception e) {
			throw new RuntimeException("编译出现错误：" + e.getMessage());
		}
	}
}

class SyncPipe implements Runnable {
	private final OutputStream ostrm_;

	private final InputStream istrm_;
 public SyncPipe(InputStream istrm, OutputStream ostrm) {
	 istrm_ = istrm;
	 ostrm_ = ostrm;
 }

 public void run() {
	 try {
		 final byte[] buffer = new byte[1024];
		 for (int length = 0; (length = istrm_.read(buffer)) != -1;) {
			 ostrm_.write(buffer, 0, length);
		 }
	 } catch (Exception e) {
		 throw new RuntimeException("处理命令出现错误：" + e.getMessage());
	 }
 }
}
