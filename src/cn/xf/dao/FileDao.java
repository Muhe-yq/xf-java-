package cn.xf.dao;

import cn.xf.pojo.*;

import java.util.List;

public interface FileDao {
    public List<User> getAllUser();

    User getUsrByidOrName(String admId);

    List<Device> getAllDevice();

    List<Device> getDeviceByNameOrId(String goalFile);

    void upDevice(String deviceId, String name, String date);

    void addDevice(String a, String b, String c);

    List<xjRecord> getCheckFile(String admId);

    void deleteDevice(String deviceId);

    void upPwd(String uid, String pwd);

    void deleteUser(String userid);

    void upToAdm(String userid);

    void upToUser(String userid);

    void Register(User user);

    List<deviceKind> getAllKind();

    deviceKind getKindById(String kindId);

    void upKind(String kindId, String name, String kindName);

    void addCheck(String a, String b, String c, String d, String e, String f, String g);

    List<User> getOrdinaryUsers();

    void addTask(String taskUserId, String taskUserName, String deadline, String task);

    List<Task> getTaskByUserId(String uid);

    void upTaskReadOrCompleted(String taskId, String upType);

    List<Task> getAllTask();
}
