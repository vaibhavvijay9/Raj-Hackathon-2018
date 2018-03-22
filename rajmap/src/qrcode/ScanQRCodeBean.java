package qrcode;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class ScanQRCodeBean 
{
	String filePath="D:\\NetBeans\\DemoProject\\web\\QR\\qrcode.png";
	static String finalResult123=null;
	static String finalResult=null;
	String charset="UTF-8";// or "ISO-8859-1"
	public void mapped()throws WriterException, IOException, NotFoundException
	{
	   Map hintMap = new HashMap();
	   hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
	   
	   System.out.println("Data read from QR Code: "+ readQRCode(filePath, charset, hintMap));
	   finalResult = finalResult123;
	} 
	public static String readQRCode(String filePath, String charset, Map hintMap)
				throws FileNotFoundException, IOException, NotFoundException 
	{
			BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(
					new BufferedImageLuminanceSource(
							ImageIO.read(new FileInputStream(filePath)))));
			Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap,
					hintMap);
			finalResult123=qrCodeResult.getText();
			return finalResult123;
		}
	  
	 public String getfinalResult()
	 {
		 return finalResult;
	 }
}
