package team.J.OrderTextBook.service.serviceImpl;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import team.J.OrderTextBook.dao.UserMapper;
import team.J.OrderTextBook.pojo.User;
import team.J.OrderTextBook.service.UserService;

import java.util.List;

/**
 * create by 王镜 on 2019/6/24 0024 16:50
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> getAllusers() {
        List<User> users = userMapper.selectAll();
        return users;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User getUserByName(String username) {
        User user = userMapper.selectByUsername(username);
        return user;
        // return null;
    }

    @Override
    public List<User> getpage(Integer page, Integer count) {
        List<User> users = userMapper.selectUserByPage(page, count);

        return users;
    }
    /**
     * by ljl
     * 插入新用户
     */
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public int add(User user) {
        List<User> userlist=userMapper.selectAll();
        int flag =0;
        for (User user1 : userlist) {
            if(user1.getUsername().equals(user.getUsername())){
                flag=1;
                break;
            }
        }
        if(flag==0){
            String password=user.getPassword();
            String username=user.getUsername();
            Md5Hash md5Hash = new Md5Hash(password, username, 100);
            user.setPassword(md5Hash.toString());
            userMapper.insert(user);
        }
        return flag;

    }

    /**
     * wj
     * 获取用户信息
     * @param id
     * @return
     */
    @Override
    public User getUserInfoById(Integer id) {
        User user= userMapper.selectByPrimaryKey(id);
        return user;
    }

    /**
     * wj
     * 修改用户基本信息
     * @param user
     * @param id
     */
    @Override
    public void update(User user, Integer id) {
        user.setId(id);
        userMapper.updateByPrimaryKey(user);
    }

    /**
     * 修改用户密码
     * @param user
     * @param password
     */
    @Override
    public void updatepwd(User user, String password) {
        Integer id=user.getId();
        user.setPassword(password);
        userMapper.updateByPrimaryKey(user);
    }
}
