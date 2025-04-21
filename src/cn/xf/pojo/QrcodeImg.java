package cn.xf.pojo;

import jp.sourceforge.qrcode.data.QRCodeImage;

import java.awt.image.BufferedImage;

public class QrcodeImg implements QRCodeImage {

    private BufferedImage bufImg = null;

    public QrcodeImg(BufferedImage bufImg) {
        this.bufImg = bufImg;
    }

    public int getWidth() {
        return bufImg.getWidth();
    }

    public int getHeight() {
        return bufImg.getHeight();
    }

    public int getPixel(int i, int i1) {
        return bufImg.getRGB(i, i1);
    }
}
