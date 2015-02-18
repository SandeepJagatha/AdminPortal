package com.tabner.controllers.generatepdf;

import java.awt.Color;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfAction;
import com.lowagie.text.pdf.PdfDestination;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.tabner.model.Employee;

public class RichStudentPDFView  extends AbstractPdfView {
	
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request,	HttpServletResponse response) 
			throws Exception {

		List<Employee> employee = (List<Employee>) model.get("emp");
		
		System.out.println(employee);
		for (Iterator<Employee> iter = employee.iterator(); iter.hasNext(); ) {
			Employee element = iter.next();
			System.out.println(element.getLast_name());
		}
		
		
		PdfPTable table = new PdfPTable(5);
		//table.getDefaultCell().setBorder(0);
		
		
		PdfPCell cellOne = new PdfPCell(new Phrase("First Name"));
		PdfPCell cellTwo = new PdfPCell(new Phrase("Middle Name"));
		PdfPCell cellThree = new PdfPCell(new Phrase("Last Name"));
		PdfPCell cellFour = new PdfPCell(new Phrase("Emp ID"));
		PdfPCell cellFive = new PdfPCell(new Phrase("Job Title"));

/*		cellOne.setBorder(Rectangle.NO_BORDER);
		cellOne.setBackgroundColor(new Color(255,255,45));

		cellTwo.setBorder(Rectangle.BOX);*/
		
		table.addCell(cellOne);
		table.addCell(cellTwo);
		table.addCell(cellThree);
		table.addCell(cellFour);
		table.addCell(cellFive);
	
		
		
		
		
		/*Table table = new Table(5);
		table.addCell("First Name");
		table.addCell("Middle Name");
		table.addCell("Last Name");
		table.addCell("Emp ID");
		table.addCell("Job Title");*/
		
		for (Iterator<Employee> iter = employee.iterator(); iter.hasNext(); ) {
			Employee element = iter.next();
			table.addCell(element.getFirst_name());
			table.addCell(element.getMiddle_name());
			table.addCell(element.getLast_name());
			table.addCell(element.getEid());
			table.addCell(element.getJob_title());
			//System.out.println(element.getLast_name());
		}		

		document.add(table);

		// to open the PDF in 100% zoom
		writer.setOpenAction(PdfAction.gotoLocalPage(1, new PdfDestination(
				PdfDestination.XYZ, 0, 10000, 1), writer));
	}

}
