package cn.xf.dao;

import cn.xf.pojo.*;
import cn.xf.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class FileDaoImpl implements FileDao {
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
    Connection connection = ConnectionFactory.getConnection();
    PreparedStatement pre = null;
    ResultSet res = null;
    User u = null;

    //通用数据库操作
    private void deal(String sql) {
        try {
            pre = connection.prepareStatement(sql);
            pre.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //用户数据库操作
    @Override
    public List<User> getAllUser() {
        List<User> arr = new ArrayList<User>();
        try {
            String sql = "select * from user where u_id!=0";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    User u = new User();
                    u.setUid(res.getString("u_id"));
                    u.setName(res.getString("u_name"));
                    u.setSex(res.getString("u_sex"));
                    u.setIdcard(res.getString("u_idcard"));
                    u.setPwd(res.getString("u_pwd"));
                    u.setRole(res.getInt("u_role"));
                    u.setState(res.getInt("u_state"));
                    arr.add(u);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public User getUsrByidOrName(String admId) {
        try {
            String sql = "SELECT * FROM `user` WHERE u_id='" + admId + "' OR u_name LIKE '%" + admId + "%'";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    u = new User();
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

    @Override
    public List<User> getOrdinaryUsers() {
        List<User> arr = new ArrayList<User>();
        try {
            String sql = "select * from user where u_role=0";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    User u = new User();
                    u.setUid(res.getString("u_id"));
                    u.setName(res.getString("u_name"));
                    u.setSex(res.getString("u_sex"));
                    u.setIdcard(res.getString("u_idcard"));
                    u.setPwd(res.getString("u_pwd"));
                    u.setRole(res.getInt("u_role"));
                    u.setState(res.getInt("u_state"));
                    arr.add(u);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public void upPwd(String uid, String pwd) {
        String sql = "UPDATE USER SET u_pwd = '" + pwd + "' WHERE u_id = '" + uid + "'";
        deal(sql);
    }

    @Override
    public void deleteUser(String userid) {
        String sql = "DELETE FROM USER WHERE u_id='" + userid + "'";
        deal(sql);
    }

    @Override
    public void upToAdm(String userid) {
        String sql = "UPDATE USER SET u_role = 1 WHERE u_id = '" + userid + "'";
        deal(sql);
    }

    @Override
    public void upToUser(String userid) {
        String sql = "UPDATE USER SET u_role = 0 WHERE u_id = '" + userid + "'";
        deal(sql);
    }

    @Override
    public void Register(User user) {
        String sql = "INSERT INTO USER VALUES('" + user.getUid() + "','" + user.getName() + "','" + user.getSex() + "','" + user.getIdcard() + "','" + user.getPwd() + "',0,1)";
        deal(sql);
    }

    //消防设备数据库操作
    @Override
    public List<Device> getAllDevice() {
        List<Device> arr = new ArrayList<Device>();
        try {
            String sql = "select * from device";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    Device d = new Device();
                    d.setDev_id(res.getString("dev_id"));
                    d.setDev_kind(res.getString("dev_kind"));
                    d.setDev_date(res.getString("dev_date"));
                    arr.add(d);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public List<Device> getDeviceByNameOrId(String goalFile) {
        List<Device> arr = new ArrayList<Device>();
        try {
            String sql = "SELECT * FROM device WHERE dev_id='" + goalFile + "' OR dev_kind LIKE '%" + goalFile + "%'";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    Device d = new Device();
                    d.setDev_id(res.getString("dev_id"));
                    d.setDev_kind(res.getString("dev_kind"));
                    d.setDev_date(res.getString("dev_date"));
                    arr.add(d);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public void upDevice(String deviceId, String name, String date2) {
        String sql = "UPDATE device SET dev_kind = '" + name + "',dev_date = '" + date2 + "' WHERE dev_id = '" + deviceId + "'";
        deal(sql);
        String bid = "b" + sdf.format(date);
        if (getKindById(name) == null) {
            String sql1 = "INSERT INTO kind VALUES('" + bid + "','" + name + "')";
            deal(sql1);
        }
    }


    @Override
    public void addDevice(String a, String b, String c) {

        String bid = "b" + sdf.format(date);

        String sql = "INSERT INTO device VALUES('" + a + "','" + b + "','" + c + "')";
        deal(sql);

        if (getKindById(b) == null) {
            String sql1 = "INSERT INTO kind VALUES('" + bid + "','" + b + "')";
            deal(sql1);
        }
    }

    @Override
    public void deleteDevice(String deviceId) {
        String sql = "DELETE FROM device WHERE dev_id='" + deviceId + "'";
        deal(sql);
    }

    //巡检数据库操作
    @Override
    public List<xjRecord> getCheckFile(String admId) {
        List<xjRecord> arr = new ArrayList<xjRecord>();
        try {
            String sql;
            if (admId == "null") {
                sql = "SELECT xj_id a,xj_staff b,xj_date c, IF(xj_result=0,'正常','异常') d,xj_des e FROM xjrecord,`user` WHERE xj_staff=u_name";
            } else {
                sql = "SELECT xj_id a,xj_staff b,xj_date c, IF(xj_result=0,'正常','异常') d,xj_des e FROM xjrecord,`user` WHERE xj_staff=u_name AND u_id = '" + admId + "'";
            }
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    xjRecord d = new xjRecord();
                    d.setXj_id(res.getString("a"));
                    d.setXj_staff(res.getString("b"));
                    d.setXj_date(res.getString("c"));
                    d.setXj_result(res.getString("d"));
                    d.setXj_des(res.getString("e"));
                    arr.add(d);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public void addCheck(String a, String b, String c, String d, String e, String f, String g) {
        int i = 0;
        if (d.equals("异常")) {
            i = 1;
        }
        String sql = "INSERT INTO xjrecord VALUES('" + a + "','" + b + "','" + c + "'," + i + ",'" + e + "','" + f + "','" + g + "')";
        deal(sql);
    }

    //设备类别数据库操作
    @Override
    public List<deviceKind> getAllKind() {
        List<deviceKind> arr = new ArrayList<deviceKind>();
        try {
            String sql = "select * from kind";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    deviceKind d = new deviceKind();
                    d.setKindId(res.getString("kind_id"));
                    d.setKindName(res.getString("kind_name"));
                    arr.add(d);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }

    @Override
    public deviceKind getKindById(String kindId) {
        deviceKind u = null;
        try {
            String sql = "SELECT * FROM kind WHERE kind_id='" + kindId + "'OR kind_name = '" + kindId + "'";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    u = new deviceKind();
                    u.setKindId(res.getString("kind_id"));
                    u.setKindName(res.getString("kind_name"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public void upKind(String kindId, String name, String kindName) {
        String sql = "UPDATE kind SET kind_name ='" + name + "' WHERE kind_id='" + kindId + "'";
        String sql1 = "UPDATE device SET dev_kind = '" + name + "' WHERE dev_kind = '" + kindName + "'";
        deal(sql);
        deal(sql1);
    }

    //任务数据库操作
    @Override
    public List<Task> getAllTask() {
        List<Task> taskArr = new ArrayList<Task>();
        try {
            String sql = "select * from task";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    Task task = new Task();
                    task.setTaskId(res.getString("taskId"));
                    task.setTaskUserId(res.getString("taskUserId"));
                    task.setTaskUserName(res.getString("taskUserName"));
                    task.setDeadline(res.getString("deadline"));
                    task.setTask(res.getString("task"));
                    task.setRead(res.getBoolean("isRead"));
                    task.setCompleted(res.getBoolean("isCompleted"));
                    taskArr.add(task);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return taskArr;
    }

    @Override
    public void addTask(String taskUserId, String taskUserName, String deadline, String task) {
        String sql =
                "INSERT INTO task(taskUserId, taskUserName,deadline, task,isRead, isCompleted) VALUES('" + taskUserId + "','" + taskUserName + "','" + deadline + "','" + task + "',0, 0)";
        deal(sql);
    }

    @Override
    public List<Task> getTaskByUserId(String uid) {
        List<Task> taskArr= new ArrayList<Task>();
        try {
            String sql = "SELECT * FROM task WHERE taskUserId='" + uid + "'";
            try {
                pre = connection.prepareStatement(sql);
                res = pre.executeQuery();
                while (res.next()) {
                    Task task = new Task();
                    task.setTaskId(res.getString("taskId"));
                    task.setTaskUserId(res.getString("taskUserId"));
                    task.setTaskUserName(res.getString("taskUserName"));
                    task.setDeadline(res.getString("deadline"));
                    task.setTask(res.getString("task"));
                    task.setRead(res.getBoolean("isRead"));
                    task.setCompleted(res.getBoolean("isCompleted"));
                    taskArr.add(task);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return taskArr;
    }

    @Override
    public void upTaskReadOrCompleted(String taskId, String upType) {
        String sql = null;
        if (Objects.equals(upType, "isRead")) {
            sql = "UPDATE task SET isRead =" + 1 + " WHERE taskId='" + taskId + "'";
        } else if (Objects.equals(upType, "isCompleted")) {
            sql = "UPDATE task SET isCompleted =" + 1 + " WHERE taskId='" + taskId + "'";
        }
        deal(sql);
    }

}
