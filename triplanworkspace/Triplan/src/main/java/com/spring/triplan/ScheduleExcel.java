package com.spring.triplan;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component("ScheduleExcel")
public class ScheduleExcel extends AbstractView {

    /** The content type for an Excel response */
    private static final String CONTENT_TYPE = "application/vnd.ms-excel";

    public ScheduleExcel() {
        setContentType(CONTENT_TYPE);
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) throws Exception {
        try {
        	
        	
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void write(Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	try {
        	
    		String sc_path = req.getSession().getServletContext().getRealPath("/Schedule/")+map.get("sc_idx")+"/schedule.xlsx";
        	
        	FileOutputStream fo = new FileOutputStream(sc_path);
        	
            Workbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = (XSSFSheet) workbook.createSheet();

            List<String> sc_list = (List<String>)map.get("sc_list");
            int sc_days = Integer.parseInt((String)map.get("sc_days"));
            
            for(int i=0; i<sc_list.size()/sc_days; i++)
            {
            	XSSFRow row = sheet.createRow(i);
            	for(int j=0; j< sc_days; j++)
            	{
            		row.createCell(j).setCellValue(sc_list.get((i*sc_days)+j));
            	}
            }
            
            workbook.write(fo);

            
        } catch (Exception e) {
            throw e;
        }
    }
    
    public HashMap<String, Object> read(Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) throws Exception {
    	try {
        	
    		File file = new File(req.getSession().getServletContext().getRealPath("/Schedule/")+map.get("sc_idx")+"/schedule.xlsx");
    		
  		   FileInputStream fi = new FileInputStream(file);
  		   
  		   Workbook workbook = new XSSFWorkbook(fi);
  		   
  		   XSSFSheet sheet = (XSSFSheet)workbook.getSheet("Sheet0");
  		   
  		   int collen = sheet.getRow(0).getLastCellNum();
  		   int rowlen = sheet.getLastRowNum()+1;
  		   
  		   int arrc = 0;
  		   
  		   String arr[] = new String[(collen*rowlen)];
  		   
  		   for(int i=0; i < rowlen; i++)
  		   {
  			   for(int j=0; j < collen; j++)
  			   {
  				   arr[arrc++] = sheet.getRow(i).getCell(j).toString();
  			   }
  		   }
  		   
  		   
  		   HashMap<String, Object> hashmap = new HashMap<String, Object>();

  		   hashmap.put("StringArr", arr);
  		   hashmap.put("collen", collen);
  		   
  		   
  		   
         return hashmap;
  		 
        } catch (Exception e) {
            throw e;
        }
    }
    
	
}