package cn.xf.pojo;

public class User {
    private String uid;
    private String name;
    private String sex;
    private String idcard;
    private String pwd;
    private int role;
    private int state;

    public User(){}

    public User(String uid, String name, String sex, String idcard, String pwd, int role, int state) {
        this.uid = uid;
        this.name = name;
        this.sex = sex;
        this.idcard = idcard;
        this.pwd = pwd;
        this.role = role;
        this.state = state;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", idcard='" + idcard + '\'' +
                ", pwd='" + pwd + '\'' +
                ", role=" + role +
                ", state=" + state +
                '}';
    }
}
