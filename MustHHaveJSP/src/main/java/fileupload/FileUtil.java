package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil
{
	public static String uploadFile(HttpServletRequest req, 
			String sDirectory)
			throws ServletException, IOException
	{
		Part part = req.getPart("ofile");
		
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader="+ partHeader);
		
		String[] phArr = partHeader.split("filename=");
		String originalFileName = phArr[1].trim().replace("\"", "");
		
		if (!originalFileName.isEmpty())
		{
			part.write(sDirectory+ File.separator + originalFileName);
		}
		return originalFileName;
	}
	
	public static String renameFile(String sDirectory, String fileNmae)
	{
		String ext = fileNmae.substring(fileNmae.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now + ext;
		
		File oldFile = new File(sDirectory + File.separator + fileNmae);
		File newFile = new File(sDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
}
