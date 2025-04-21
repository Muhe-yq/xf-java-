package cn.xf.pojo;

public class Task {
    private String taskId;
    private String taskUserId;
    private String taskUserName;
    private String deadline;
    private String task;
    private boolean isRead;
    private boolean isCompleted;


    public Task(){}

    public Task(String taskId, String taskUserId, String taskUserName, String deadline, String task, boolean isRead, boolean isCompleted) {
        this.taskId = taskId;
        this.taskUserId = taskUserId;
        this.taskUserName = taskUserName;
        this.deadline = deadline;
        this.task = task;
        this.isRead = isRead;
        this.isCompleted = isCompleted;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskUserId() {
        return taskUserId;
    }

    public void setTaskUserId(String taskUserId) {
        this.taskUserId = taskUserId;
    }

    public String getTaskUserName() {
        return taskUserName;
    }

    public void setTaskUserName(String taskUserName) {
        this.taskUserName = taskUserName;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId='" + taskId + '\'' +
                ", taskUserId='" + taskUserId + '\'' +
                ", taskUserName='" + taskUserName + '\'' +
                ", deadline='" + deadline + '\'' +
                ", task='" + task + '\'' +
                ", isRead=" + isRead +
                ", isCompleted=" + isCompleted +
                '}';
    }
}
