package cn.xf.servlet;

import cn.xf.pojo.*;
import cn.xf.service.FileService;
import cn.xf.service.FileServiceImpl;
import cn.xf.util.ImgEncoder;
import sun.nio.cs.ArrayEncoder;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/fileServlet")
public class FileServlet extends HttpServlet {

    /*
     * window.location.href = "fileServlet?action=search&admId="+ admId +"&goalFile="+goalFile;
     * */

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        Date date1 = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");

        String deal = req.getParameter("action");
        FileService fs = new FileServiceImpl();

        String admId = req.getParameter("admId");
        User user = fs.getAdmineUser(admId);

        if (deal.equals("search")) {
            String goalFile = req.getParameter("goalFile");
            User goalUserFile = fs.getGoalUserFile(goalFile);
            List<User> list = new ArrayList<User>();
            list.add(goalUserFile);
            req.setAttribute("user", user);

            if (goalUserFile != null) {
                req.setAttribute("arr", list);
            }

            req.setAttribute("mainRight", "userFile.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goUserShow") || deal.equals("myData")) {
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "manage.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("devicesearch")) {
            //window.location.href = "fileServlet?action=devicesearch&admId="+ admId +"&goalFile="+goalFile;
            //访问图书
            String goalFile = req.getParameter("goalFile");
            List<Device> arr = fs.getDeviceByNameOrId(goalFile);

            req.setAttribute("arr", arr);
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "device.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("upDevice")) {
            //window.location.href = "fileServlet?action=upDevice&admId=${user.getUid()}&deviceId=${device.getDev_id()}&name="+devName+"&date="+devDate;
            //deviceId=${device.getDev_id()}&name="+devName+"&date="+devDate;
            String deviceId = req.getParameter("deviceId");
            String name = req.getParameter("name");
            String date2 = req.getParameter("date");
            fs.upDevice(deviceId, name, date2);

            List<Device> arr = fs.getAllDevice();

            req.setAttribute("arr", arr);
            req.setAttribute("user", user);

            req.setAttribute("mainRight", "device.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("toUpDevice")) {
            //window.location.href = "fileServlet?action=toUpDevice&admId=${user.getUid()}&deviceId="+m;
            String m = req.getParameter("deviceId");
            Device device = fs.getDeviceByNameOrId(m).get(0);

            req.setAttribute("device", device);
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "upDevice.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goDeviceManage")) {
            //window.location.href = "fileServlet?action=goDeviceManage&admId="+${user.getUid()};
            List<Device> arr = fs.getAllDevice();

            req.setAttribute("arr", arr);
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "device.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goHead")) {
            //window.location.href = "fileServlet?action=goHead&admId="+${user.getUid()};
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goDeviceAdd")) {
            //window.location.href = "fileServlet?action=goDeviceAdd&admId="+${user.getUid()};
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "AddDevice.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("sureAdd")) {
            //window.location.href = "fileServlet?action=sureAdd&admId=${user.getUid()}&a="+dev_id+"&b="+dev_kind+"&c="+dev_date;
            String a = "a" + sdf.format(date1);
            String b = req.getParameter("b");
            String c = req.getParameter("c");
            req.setAttribute("user", user);
            fs.addDevice(a, b, c);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goCheck") || deal.equals("allCheck")) {
            //window.location.href = "fileServlet?action=goCheck&admId="+${user.getUid()};
            List<xjRecord> arr = fs.getCheckFile("null");
            req.setAttribute("user", user);
            req.setAttribute("arr", arr);
            req.setAttribute("mainRight", "check.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("checkMine")) {
            List<xjRecord> arr = fs.getCheckFile(admId);
            req.setAttribute("user", user);
            req.setAttribute("arr", arr);
            req.setAttribute("mainRight", "check.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goNewCheck")) {
            String dev_id = req.getParameter("dev_id");
            String dev_name = req.getParameter("dev_name");
            req.setAttribute("user", user);
            req.setAttribute("dev_id", dev_id);
            req.setAttribute("dev_name", dev_name);
            //req.setAttribute("mainRight", "addCheck.jsp");
            //req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
            req.getRequestDispatcher("addCheck.jsp").forward(req, res);
        } else if (deal.equals("sureAddCheck")) {
            //action=suerAddCheck&admId=${user.getUid()}&a="+xj_id+"&b="+xj_staff+"&c="+xj_date+"&d="+xj_result+"&e="+xj_des;
            String a = "c" + sdf.format(date1);
            String b = req.getParameter("b");
            String c = req.getParameter("c");
            String d = req.getParameter("d");
            String e = req.getParameter("e");
            String f = req.getParameter("f");
            String g = req.getParameter("g");
            req.setAttribute("user", user);
            fs.addCheck(a, b, c, d, e, f, g);
            req.getRequestDispatcher("index.jsp").forward(req, res);
        } else if (deal.equals("deleteDevice")) {
            //window.location.href = "fileServlet?action=deleteDevice&admId=${user.getUid()}&deviceId="+n;
            String deviceId = req.getParameter("deviceId");
            req.setAttribute("user", user);
            fs.deleteDevice(deviceId);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("exitSystem")) {
            //window.location.href = "fileServlet?action=exitSystem&admId="+${user.getUid()};
            req.getRequestDispatcher("index.jsp").forward(req, res);
        } else if (deal.equals("goMyShow")) {
            //window.location.href = "fileServlet?action=goMyShow&admId="+${user.getUid()};
            req.getParameter("admId");
//            User user = fs.get

            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goManageShow")) {
            //window.location.href = "fileServlet?action=goManageShow&admId=${user.getUid()}";
            List<User> arr = fs.getAllUser();
            req.setAttribute("arr", arr);
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "userFile.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goChangePwd")) {
            // window.location.href = "fileServlet?action=goGhangePwd&admId=${user.getUid()}";
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "changePwd.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("sureChange")) {
            //window.location.href = "fileServlet?action=sureChange&admId=${user.getUid()}&pwd="+m;
            String pwd = req.getParameter("pwd");
            String uid = user.getUid();
            fs.upPwd(uid, pwd);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("deleteUser")) {
            //window.location.href = "fileServlet?action=deleteUser&admId=${user.getUid()}&userid="+m;
            String userid = req.getParameter("userid");
            req.setAttribute("user", user);
            fs.deleteUser(userid);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("upToAdm")) {
            //window.location.href = "fileServlet?action=upToAdm&admId=${user.getUid()}&userid="+n;
            String userid = req.getParameter("userid");
            req.setAttribute("user", user);
            fs.upToAdm(userid);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("upToUser")) {
            //window.location.href = "fileServlet?action=upToAdm&admId=${user.getUid()}&userid="+n;
            String userid = req.getParameter("userid");
            req.setAttribute("user", user);
            fs.upToUser(userid);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("kind")) {
            //window.location.href = "fileServlet?action=kind&admId="+${user.getUid()};
            req.setAttribute("user", user);
            List<deviceKind> arr = fs.getAllKind();
            req.setAttribute("arr", arr);
            req.setAttribute("mainRight", "kind.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("toUpKind")) {
            //window.location.href = "fileServlet?action=toUpKind&admId=${user.getUid()}&kindId="+m;
            String kindId = req.getParameter("kindId");
            deviceKind kind = fs.getKindById(kindId);
            req.setAttribute("kind", kind);
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "upKind.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("upKind")) {
            //window.location.href = "fileServlet?action=upKind&admId=${user.getUid()}&kindId=${kind.getKindId()}&name="+kindName;
            String kindId = req.getParameter("kindId");
            String kindName = req.getParameter("kindName");
            String name = req.getParameter("name");
            fs.upKind(kindId, name, kindName);
            req.setAttribute("user", user);
            List<deviceKind> arr = fs.getAllKind();
            req.setAttribute("arr", arr);
            req.setAttribute("mainRight", "kind.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("goImgEncoder")) {
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "ImgEncode.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        } else if (deal.equals("sureEncode")) {
            String b = req.getParameter("b");
            String c = req.getParameter("c");
            req.setAttribute("user", user);
            res.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            req.setAttribute("dev_id", b);
            req.setAttribute("dev_name", c);
            //req.setAttribute("mainRight", "code.jsp");
            req.getRequestDispatcher("code.jsp").forward(req, res);
            //req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }else if (deal.equals("goManageTask")) {
            List<User> arr = fs.getOrdinaryUsers();
            req.setAttribute("user", user);
            req.setAttribute("arr", arr);
            req.setAttribute("mainRight", "xjTask.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }else if (deal.equals("goUserTask")) {
            List<Task> TaskArr = fs.getTaskByUserId(user.getUid());
            req.setAttribute("user", user);
            req.setAttribute("TaskArr", TaskArr);
            req.setAttribute("mainRight", "UserTask.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }else if (deal.equals("distTask")) {
            String TaskUserId = req.getParameter("userid");
            User TaskUser = fs.getAdmineUser(TaskUserId);
            req.setAttribute("user", user);
            req.setAttribute("TaskUser", TaskUser);
            req.setAttribute("mainRight", "addTask.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }else if (deal.equals("sureAddTask")) {
            String TaskUserId = req.getParameter("TaskUserId");
            String TaskUserName = req.getParameter("TaskUserName");
            String deadline = req.getParameter("deadline");
            String task = req.getParameter("task");
            fs.addTask(TaskUserId, TaskUserName, deadline, task);
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "show.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }else if (deal.equals("readTask")  || deal.equals("completeTask")) {
            String taskId = req.getParameter("taskId");
            if(deal.equals("readTask")){
                fs.upTaskReadOrCompleted(taskId,"isRead");
            } else {
                fs.upTaskReadOrCompleted(taskId,"isCompleted");
            }
            req.setAttribute("user", user);
            req.setAttribute("mainRight", "UserTask.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }else if (deal.equals("allTask")) {
            List<Task> taskArr = fs.getAllTask();
            req.setAttribute("user", user);
            req.setAttribute("taskArr", taskArr);
            req.setAttribute("mainRight", "allTask.jsp");
            req.getRequestDispatcher("AdmMainPage.jsp").forward(req, res);
        }
    }
}
