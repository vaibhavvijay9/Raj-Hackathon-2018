package qrcode;

public class InsertBean 
{        
    public void createQR(String PRN)throws Exception
    {
      QRCodeBean qr=new QRCodeBean();
    	qr.setQrCodeData(PRN);
    	qr.mapping();
    }
}