package ubtms.basic.util;

/**
 * Created by jinzhany on 2016/12/18.
 */
public class ImgUtil {

    public static String getImgParam(int imgX, int imgY, int selectX, int selectY) {
        if (imgX < selectX || imgY < selectY) {
            return "0,0," + selectX + "," + selectY;
        }
        if (imgX <= 600) {
            return imgX + "," + imgY + "," + selectX + "," + selectY;
        }
        if (imgX > 600) {

            return 600 + "," + 0 + "," + (600 * selectX / imgX) + "," + ((600 * selectX / imgX) * selectY / selectX);
        }
        return "";
    }
}
