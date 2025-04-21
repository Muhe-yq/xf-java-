package cn.xf.service;

import cn.xf.dao.LoginDao;
import cn.xf.dao.LoginDaoImpl;
import cn.xf.pojo.User;

public class LoginServiceImpl implements LoginService{
    LoginDao loginDao=new LoginDaoImpl();
    public User logService(User user) {
        return loginDao.LogDao(user);
    }
}
