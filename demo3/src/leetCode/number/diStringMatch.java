package leetCode.number;

/**
 * @Title: diStringMatch
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/21 0021 9:54
 */
public class diStringMatch {
    public static int[] diStringMatch(String S) {
        int len = S.length();
        int[] result = new int[len+1];
        int left = 0;
        int right = len;
        for(int i=0;i<len;i++){
            if(S.charAt(i) == 'I'){
                result[i]=left++;
            }
            if (S.charAt(i) =='D'){
                result[i]=right--;
            }
        }
        result[len] = right;
        for (int i :result){
            System.out.println(i);
        }
        return result;
    }

    public static void main(String[] args) {
        String str = "DDI";
        System.out.println(diStringMatch(str).toString());
    }
}
