package team.J.OrderTextBook.service.serviceImpl;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.AdministerMapper;
import team.J.OrderTextBook.pojo.Administer;
import team.J.OrderTextBook.service.AdminLoginService;


/**
 * Created by "ZH" on 2019/6/23  21:28
 */
@Service
public class AdminLoginServiceImpl implements AdminLoginService {

    @Autowired
    private AdministerMapper administerMapper;
    @Override
    public Administer login(String adminName, String adminPassword) {
        Administer administer = administerMapper.selectByAdminName(adminName);
        if (administer!=null){
            //判断加密 密码是否正确
            Md5Hash md5Hash = new Md5Hash(adminPassword, adminName, 100);
            if (md5Hash.toString().equals(administer.getPassword())){
                return administer;
            }
            else
                return null;
        }
        return null;
    }
}
