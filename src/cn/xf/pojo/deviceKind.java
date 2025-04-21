package cn.xf.pojo;

public class deviceKind {
    private String kindId;
    private String kindName;

    public deviceKind(){}

    public deviceKind(String kindId, String kindName) {
        this.kindId = kindId;
        this.kindName = kindName;
    }

    public String getKindId() {
        return kindId;
    }

    public void setKindId(String kindId) {
        this.kindId = kindId;
    }

    public String getKindName() {
        return kindName;
    }

    public void setKindName(String kindName) {
        this.kindName = kindName;
    }

    @Override
    public String toString() {
        return "deviceKind{" +
                "kindId='" + kindId + '\'' +
                ", kindName='" + kindName + '\'' +
                '}';
    }
}
