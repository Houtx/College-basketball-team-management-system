package ubtms.basic.util;

/**
 * Created by jinzhany on 2017/3/30.
 */
public class CastUtil {

    public static Integer getInteger(String num){
        float numF = Float.valueOf(num);
        int numI = (int) numF;
        return numI;
    }
}
