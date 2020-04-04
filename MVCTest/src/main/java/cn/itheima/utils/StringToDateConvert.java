package cn.itheima.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 字符串转换成日期
 * @Title: StringToDateConvert
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/14 0014 15:13
 */
public class StringToDateConvert implements Converter<String, Date>  {
    /**
     * String source 传入的值
     * @param source
     * @return
     */
    @Override
    public Date convert(String source) {
        if(source == null) {
            throw new RuntimeException("请您传入数据");
        }
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return df.parse(source);
        } catch (Exception e) {
             throw  new RuntimeException("数据类型转换错误");
        }

    }
}
