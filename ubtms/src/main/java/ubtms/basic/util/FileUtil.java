package ubtms.basic.util;

/**
 * Created by jinzhany on 2016/12/18.
 */
public class FileUtil {

    public  static String getFileSuffix(String fileName){
        String[] strArray = fileName.split(".");
        return strArray[strArray.length-1];
    }
}
