package leetCode.LinkList;

import java.util.ArrayList;
import java.util.List;

/**
 * @Title: getDecimalValue
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/22 0022 9:41
 */
public class getDecimalValue {
    public static  int getDecimalValue(ListNode head) {

        ListNode cur = head;
        List<Integer> list = new ArrayList<>();
        while (cur!=null){

            list.add(cur.val);
            cur = cur.next;
        }
        System.out.println(list.toString());

        int len = list.size();
        int j = 1;
        int sum = 0;
        for(int i :list){
            if(i==1){
                sum+=Math.pow(2, len-j);
            }
            j++;
        }
        return sum;
    }

    public static void main(String[] args) {


    }

}
