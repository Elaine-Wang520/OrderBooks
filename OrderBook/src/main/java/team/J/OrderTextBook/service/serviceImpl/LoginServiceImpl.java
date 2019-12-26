package team.J.OrderTextBook.service.serviceImpl;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.J.OrderTextBook.dao.UserMapper;
import team.J.OrderTextBook.pojo.User;
import team.J.OrderTextBook.service.LoginService;

/**
 * create by linjunli on 2019/6/24 0024 13:14
 */
@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User login(String username, String password) {
        User user= userMapper.selectByUsername(username);
        if (user!=null){
            //判断密码是否正确
            Md5Hash md5Hash = new Md5Hash(password, username, 100);
            if (md5Hash.toString().equals(user.getPassword())){
                return user;
            }
            else
                return null;
        }
        return null;
    }
}
