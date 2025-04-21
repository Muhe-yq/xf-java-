package cn.xf.service;

import cn.xf.dao.FileDao;
import cn.xf.dao.FileDaoImpl;
import cn.xf.pojo.*;

import java.util.List;

public class FileServiceImpl implements FileService {
    FileDao fd = new FileDaoImpl();

    @Override
    public List<User> getAllUser() {
        return fd.getAllUser();
    }

    @Override
    public User getAdmineUser(String admId) {
        return fd.getUsrByidOrName(admId);
    }

    @Override
    public User getGoalUserFile(String goalFile) {
        if (goalFile.equals("") || goalFile.trim() == null) {
            return null;
        } else {
            return fd.getUsrByidOrName(goalFile);
        }
    }

    @Override
    public List<Device> getAllDevice() {
        return fd.getAllDevice();
    }

    @Override
    public List<Device> getDeviceByNameOrId(String goalFile) {
        return fd.getDeviceByNameOrId(goalFile);
    }

    @Override
    public void upDevice(String deviceId, String name, String date2) {
        fd.upDevice(deviceId, name, date2);
    }

    @Override
    public void addDevice(String a, String b, String c) {
        fd.addDevice(a, b, c);
    }

    @Override
    public List<xjRecord> getCheckFile(String admId) {
        return fd.getCheckFile(admId);
    }

    @Override
    public void addCheck(String a, String b, String c, String d, String e, String f, String g) {
        fd.addCheck(a, b, c, d, e, f, g);
    }

    @Override
    public void deleteDevice(String deviceId) {
        fd.deleteDevice(deviceId);
    }

    @Override
    public void upPwd(String uid, String pwd) {
        fd.upPwd(uid, pwd);
    }

    @Override
    public void deleteUser(String userid) {
        fd.deleteUser(userid);
    }

    @Override
    public void upToAdm(String userid) {
        fd.upToAdm(userid);
    }

    @Override
    public void upToUser(String userid) {
        fd.upToUser(userid);
    }

    @Override
    public void Register(User user) {
        fd.Register(user);
    }

    @Override
    public List<deviceKind> getAllKind() {
        return fd.getAllKind();
    }

    @Override
    public deviceKind getKindById(String kindId) {
        return fd.getKindById(kindId);
    }

    @Override
    public void upKind(String kindId, String name, String kindName) {
        fd.upKind(kindId,name,kindName);
    }

    @Override
    public List<User> getOrdinaryUsers() {
        return fd.getOrdinaryUsers();
    }

    @Override
    public void addTask(String taskUserId, String taskUserName, String deadline, String task) {
        fd.addTask(taskUserId, taskUserName, deadline, task);
    }

    @Override
    public List<Task> getTaskByUserId(String uid) {
        return fd.getTaskByUserId(uid);
    }

    @Override
    public void upTaskReadOrCompleted(String taskId, String upType) {
        fd.upTaskReadOrCompleted(taskId, upType);
    }

    @Override
    public List<Task> getAllTask() {
        return fd.getAllTask();
    }
}


