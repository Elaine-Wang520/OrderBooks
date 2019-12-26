package team.J.OrderTextBook.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 */
public class UpFileUtils {

    public static String getUrl(MultipartFile multipartFile, HttpServletRequest request) {
        String proPath="D:/zh/qianfengTraining/workspace/OrderBook/src/main/webapp/";
        String savePath = "images";
        File file1 = new File(proPath + savePath);
        if (!file1.exists()) {
            file1.mkdirs();
        }

        long l=System.currentTimeMillis();
        String fileName = l+".jpg";

        String url = savePath + "/" + fileName;
        FileOutputStream fos1 = null;
        try {
            fos1 = new FileOutputStream(proPath + url, true);
            fos1.write(multipartFile.getBytes());
            fos1.flush();
            return url;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "";
        } finally {
            try {

                fos1.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

}
