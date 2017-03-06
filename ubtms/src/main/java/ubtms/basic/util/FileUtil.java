package ubtms.basic.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Properties;

/**
 * Created by jinzhany on 2016/12/18.
 */
public class FileUtil {
    //保存文件到指定路径
    public static String saveFile(MultipartFile file,InputStream picurlProperties) {
        String fileName = file.getOriginalFilename();
        // 获取图片的扩展名
        String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 新的图片文件名 = 获取时间戳+"."图片扩展名
        String newFileName = String.valueOf(System.currentTimeMillis()) + "." + extensionName;

        // TODO Auto-generated method stub
        // 根据配置文件获取服务器图片存放路径
        String picDir = "";
        try {
            Properties props = new Properties();
            InputStream in = picurlProperties;
            props.load(in);
            in.close();

            // 读取特定属性
            picDir = props.getProperty("savePicUrl");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        String saveFilePath = picDir;

        /* 构建文件目录 */
        File fileDir = new File(saveFilePath);
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }

        try {
            FileOutputStream out = new FileOutputStream(saveFilePath + "\\" + newFileName);
            // 写入文件
            out.write(file.getBytes());
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        System.out.println("upload success");
        return newFileName;
    }

    //把本地图片上传到服务器
    public static void putPicToTomcat(String picName,InputStream picurlProperties,String tomcatDir) {
        String localDir="";
        try {
            Properties props = new Properties();
            InputStream in = picurlProperties;
            props.load(in);
            in.close();
            localDir = props.getProperty("savePicUrl");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        String getFilePath = localDir+"/"+picName;
        tomcatDir = tomcatDir.replace('\\','/');
        String saveFilePath = tomcatDir+"/"+picName;
        copyFile(new File(getFilePath),new File(saveFilePath));
    }

    //把本地图片上传到服务器
    public static void putPicToTomcat(InputStream picurlProperties,String tomcatDir) {
        String localDir="";
        try {
            Properties props = new Properties();
            InputStream in = picurlProperties;
            props.load(in);
            in.close();
            localDir = props.getProperty("savePicUrl");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        File localFileDir = new File(localDir);
        File tomcatFileDir = new File(tomcatDir);

        String[] files = localFileDir.list();
        for (String cFile : files) {
            File srcFile = new File(localFileDir, cFile);
            File destFile = new File(tomcatFileDir, cFile);
            copyFile(srcFile,destFile);
        }
    }

    public static void copyFile(File file1, File file2){
        FileOutputStream fileOutputStream = null;
        InputStream inputStream = null;
        byte[] bytes = new byte[1024];
        int temp = 0;
        try {
            inputStream = new FileInputStream(file1);
            fileOutputStream = new FileOutputStream(file2);
            while((temp = inputStream.read(bytes)) != -1){
                fileOutputStream.write(bytes, 0, temp);
                fileOutputStream.flush();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }finally{
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    //从配置文件里读取文件路径
    //        String path = WebUtil.getFilePath("logs/Analysis");

//    public static String getFilePath(String file) {
//        String resultPath = "";
//
//        String path = Thread.currentThread().getContextClassLoader().getResource("/").getFile();
//
//        if (path.indexOf("WEB-INF") >= 0) {
//            path = path.substring(0, path.indexOf("WEB-INF"));
//        }
//        else {
//            path = path.replace("target/test-classes", "src/main/webapp");
//        }
//        resultPath = path + file;
//
//        System.out.println("FILE PATH:------------------------------------------------------");
//        System.out.println("FILE PATH:" + resultPath);
//
//        return resultPath;
//    }

}
