package cn.xf.util;

import cn.xf.pojo.QrcodeImg;
import jp.sourceforge.qrcode.QRCodeDecoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;

/**
 * Created by zf on 2017/6/12.
 */
public class ImgDecoder {
    public static String decode(String imgPath) {
        String content = "error";
        try {
            File img = new File(imgPath);
            BufferedImage bufImg = ImageIO.read(img);
            QRCodeDecoder qrCodeDecoder = new QRCodeDecoder();
            content = new String(qrCodeDecoder.decode(new QrcodeImg(bufImg)), "utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }
}