package leetCode.array;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @Title: distributeCandies
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/20 0020 15:20
 */
public class distributeCandies {
    public int distributeCandie(int[] candies) {

        Set<Integer> s = new HashSet<>();

        Map<Integer,Integer> map = new HashMap<>();

        int size = candies.length;
        //妹妹最多拿size/2
        for (int i :candies){
            if(map.containsKey(i)){
                Integer temp = map.get(i);
                map.put(i,++temp);
            }else {
                map.put(i, 1);
            }
        }
        System.out.println(map.toString());

        int mapSize = map.size();

        if(mapSize>=size/2){
            return size/2;
        }else{
            return mapSize;
        }


    }

    public static void main(String[] args) {
        int[] candies = {1,2,3,4};
    }
}
