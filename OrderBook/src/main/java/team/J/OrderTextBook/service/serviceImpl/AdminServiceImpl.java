package team.J.OrderTextBook.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import team.J.OrderTextBook.dao.AdministerMapper;
import team.J.OrderTextBook.pojo.Administer;
import team.J.OrderTextBook.service.AdminService;

import java.util.List;

/**
 * Created by "ZH" on 2019/6/24  17:04
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdministerMapper administerMapper;
    @Override
    public List<Administer> getAlladmin() {
        return administerMapper.selectAll();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void deleteAdmin(Integer id) {
        administerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void add(Administer administer) {
        administerMapper.insert(administer);
    }

}
