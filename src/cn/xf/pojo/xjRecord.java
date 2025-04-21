package cn.xf.pojo;

public class xjRecord {
    private String xj_id;
    private String xj_staff;
    private String xj_date;
    private String xj_result;
    private String xj_des;

    public xjRecord(){}

    public xjRecord(String xj_id, String xj_staff, String xj_date, String xj_result, String xj_des) {
        this.xj_id = xj_id;
        this.xj_staff = xj_staff;
        this.xj_date = xj_date;
        this.xj_result = xj_result;
        this.xj_des = xj_des;
    }

    public String getXj_id() {
        return xj_id;
    }

    public String getXj_staff() {
        return xj_staff;
    }

    public String getXj_date() {
        return xj_date;
    }

    public String getXj_result() {
        return xj_result;
    }

    public String getXj_des() {
        return xj_des;
    }

    public void setXj_id(String xj_id) {
        this.xj_id = xj_id;
    }

    public void setXj_staff(String xj_staff) {
        this.xj_staff = xj_staff;
    }

    public void setXj_date(String xj_date) {
        this.xj_date = xj_date;
    }

    public void setXj_result(String xj_result) {
        this.xj_result = xj_result;
    }

    public void setXj_des(String xj_des) {
        this.xj_des = xj_des;
    }

    @Override
    public String toString() {
        return "xjRecord{" +
                "xj_id='" + xj_id + '\'' +
                ", xj_staff='" + xj_staff + '\'' +
                ", xj_date='" + xj_date + '\'' +
                ", xj_result=" + xj_result +
                ", xj_des='" + xj_des + '\'' +
                '}';
    }
}
