package qrcode;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;


public class QRCodeBean
{
	private String qrCodeData=null;
	
	public void setQrCodeData(String qrCodeData) 
	{
		this.qrCodeData =qrCodeData ;
	}

	public void mapping() throws WriterException, IOException, NotFoundException
	{
		String filePath="F:\\Eclipse neon\\rajmap\\WebContent\\images\\qrcode.png";
		String charset="UTF-8";// or "ISO-8859-1"
		Map hintMap = new HashMap();
	    hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

	   createQRCode(qrCodeData, filePath, charset, hintMap, 200, 200);
	   System.out.println("QR Code image created successfully!");
	}

    public static void createQRCode(String qrCodeData, String filePath,String charset, Map hintMap, int qrCodeheight, int qrCodewidth)throws WriterException, IOException 
    {
	        BitMatrix matrix = new MultiFormatWriter().encode(
			new String(qrCodeData.getBytes(charset), charset),
			BarcodeFormat.QR_CODE, qrCodewidth, qrCodeheight, hintMap);
	        MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
		.lastIndexOf('.') + 1), new File(filePath));
     }
}