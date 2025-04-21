package cn.xf.util;

import com.swetake.util.Qrcode;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * Created by zf on 2017/6/12.
 */
public class ImgEncoder {

    private int width = 140;//图片宽
    private int height = 140;//图片长
    private String imgPath = "D:\\qrcode.png";//图片保存位置

    public ImgEncoder() {
    }

    public ImgEncoder(int width, int height, String imgPath) {
        this.width = width;
        this.height = height;
        this.imgPath = imgPath;
    }

    public boolean generate(String content) {
        try {
            Qrcode qrcode = new Qrcode();
            // 设置二维码排错率，可选L(7%)、M(15%)、Q(25%)、H(30%)，排错率越高可存储的信息越少，但对二维码清晰度的要求越小
            qrcode.setQrcodeErrorCorrect('Q');
            qrcode.setQrcodeEncodeMode('B');
            // 设置设置二维码尺寸，取值范围1-40，值越大尺寸越大，可存储的信息越大
            qrcode.setQrcodeVersion(7);
            //设置图片尺寸
            BufferedImage bufImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            //绘制二维码图片
            Graphics2D gs=bufImg.createGraphics();
            //设置二维码背景颜色
            gs.setBackground(Color.WHITE);
            //创建一个矩形区域
            gs.clearRect(0, 0, width, height);
            //设置二维码的图片颜色值 黑色
            gs.setColor(Color.BLACK);
            // 获得内容的字节数组，设置编码格式
            byte[] contentBytes = content.getBytes("utf-8");
            // 设置偏移量，不设置可能导致解析出错
            int pixoff = 2;
            //输出二维码
            if (contentBytes.length > 0 && contentBytes.length < 400) {
                boolean[][] codeOut = qrcode.calQrcode(contentBytes);
                for (int i = 0; i < codeOut.length; i++) {
                    for (int j = 0; j < codeOut.length; j++) {
                        if (codeOut[j][i]) {
                            gs.fillRect(j*3+pixoff, i*3+pixoff, 3, 3);
                        }
                    }
                }
            }
            gs.dispose();
            bufImg.flush();
            //生成二维码图片
            File img = new File(imgPath);
            if (img.exists()) {
                img.delete();
            }
            ImageIO.write(bufImg, "png", img);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}