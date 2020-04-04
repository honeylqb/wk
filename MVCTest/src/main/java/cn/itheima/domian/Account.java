package cn.itheima.domian;

import java.io.Serializable;

/**
 * @Title: Account
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/14 0014 14:47
 */
public class Account implements Serializable {
    private User user;
    private int money;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Account{" +
                "user=" + user +
                ", money=" + money +
                '}';
    }
}
