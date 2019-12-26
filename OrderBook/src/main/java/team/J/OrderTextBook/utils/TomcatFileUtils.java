package team.J.OrderTextBook.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/*
 * created by LL on 2019/6/27 0027
 */
public class TomcatFileUtils {
        public static String getTomcatUrl(MultipartFile multipartFile, HttpServletRequest request) {
            String proPath="D:/apache-tomcat-9.0.16/webapps/";
            String savePath = "images";
            File file1 = new File(proPath + savePath);
            if (!file1.exists()) {
                file1.mkdirs();
            }
            long l=System.currentTimeMillis();
            String fileName = l+".jpg";
//        String fileName = multipartFile.getOriginalFilename();
            String url = savePath + "/" + fileName;
            FileOutputStream fos1 = null;
            try {
                fos1 = new FileOutputStream(proPath + url, true);
                fos1.write(multipartFile.getBytes());
                fos1.flush();
                return url;
            } catch (Exception e) {
                e.printStackTrace();
                return "";
            } finally {
                try {
                    fos1.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
}
