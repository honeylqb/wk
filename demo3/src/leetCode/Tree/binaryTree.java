package leetCode.Tree;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * @Title: binaryTree
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/20 0020 14:40
 */
public class binaryTree {

    public List<Double> averageOfLevels(TreeNode root) {
        List<Double> resultList = new ArrayList<>();
        if(root==null){
            return  resultList;
        }

        Queue<TreeNode> queue = new LinkedList<>();

        queue.add(root);

        while (!queue.isEmpty()){
            int length = queue.size();
            double sum = 0;
            for(int i = 0 ; i<length;i++){
                TreeNode cur = queue.poll();
                sum +=cur.val;
                if(cur.left!=null){
                    queue.add(cur.left);
                }

                if(cur.right!=null){
                    queue.add(cur.right);
                }
            }
            resultList.add(sum/length);

        }
        return  resultList;

    }
}
