package cn.xf.pojo;

public class Device {
    private String dev_id;
    private String dev_kind;
    private String dev_date;

    public Device(){}

    public Device(String dev_id, String dev_kind, String dev_date) {
        this.dev_id = dev_id;
        this.dev_kind = dev_kind;
        this.dev_date = dev_date;
    }

    public String getDev_id() {
        return dev_id;
    }

    public void setDev_id(String dev_id) {
        this.dev_id = dev_id;
    }

    public String getDev_kind() {
        return dev_kind;
    }

    public void setDev_kind(String dev_kind) {
        this.dev_kind = dev_kind;
    }

    public String getDev_date() {
        return dev_date;
    }

    public void setDev_date(String dev_date) {
        this.dev_date = dev_date;
    }

    @Override
    public String toString() {
        return "device{" +
                "dev_id='" + dev_id + '\'' +
                ", dev_kind='" + dev_kind + '\'' +
                ", dev_date='" + dev_date + '\'' +
                '}';
    }
}
