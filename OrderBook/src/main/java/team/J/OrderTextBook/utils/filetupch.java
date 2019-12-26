package team.J.OrderTextBook.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
/**
 * create by linjunli on 2019/6/27 0027 13:41
 */
public class filetupch {
    public static String getUrl(MultipartFile multipartFile, String name, HttpServletRequest request) {
        String path="D:/apache-tomcat-8.5.37/webapps/";
        String proPath = "D:/qf/OrderBook/src/main/webapp/";
       // String savepath1 = request.getServletContext().getRealPath("static/user_img");
        String savePath = "img";
        File file1 = new File(proPath + savePath);
        File file2 = new File(path + savePath);
        if (!file1.exists()) {
            file1.mkdirs();
        }
        if (!file2.exists()) {
            file2.mkdirs();
        }
        Date date = new Date();
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
//        String dateString = formatter.format(date);
        long l = System.currentTimeMillis();
        String fileName = l+name;
        String url = savePath + "/" + fileName;
       // System.out.println(url+"9999999999999999");
        FileOutputStream fos1 = null;
        FileOutputStream fos2 = null;
        try {
            fos2 = new FileOutputStream(path + url, true);
            fos2.write(multipartFile.getBytes());
            fos2.flush();
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
                fos2.close();
                fos1.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
