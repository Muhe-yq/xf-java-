package cn.xf.dao;

import cn.xf.pojo.User;
import cn.xf.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDaoImpl implements LoginDao{
    @Override
    public User LogDao(User user) {

        String id=user.getUid();
        String pwd=user.getPwd();

        Connection connection = ConnectionFactory.getConnection();
        PreparedStatement pre = null;
        ResultSet res=null;
        User u = null;
        try{
            String sql="select * from user where u_id='"+id+"' and u_pwd='"+pwd+"'";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while(res.next()){
                    u= new User();
                    u.setUid(res.getString("u_id"));
                    u.setName(res.getString("u_name"));
                    u.setSex(res.getString("u_sex"));
                    u.setIdcard(res.getString("u_idcard"));
                    u.setPwd(res.getString("u_pwd"));
                    u.setRole(res.getInt("u_role"));
                    u.setState(res.getInt("u_state"));
                }



            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return u;
    }
}
