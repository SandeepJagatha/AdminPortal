package com.tabner.view;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfAction;
import com.lowagie.text.pdf.PdfDestination;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.tabner.model.Contact;

public class ContactsPDFView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request,	HttpServletResponse response) 
			throws Exception {
		
		document.setPageSize(PageSize.A3.rotate());
		 Font font = FontFactory.getFont("Times-Roman", 8);
		 //document.add(new Paragraph("Times-Roman", font));
		
		List<Contact> contact = (List<Contact>) model.get("contacts");
		
		PdfPTable table = new PdfPTable(11);
		
		table.setWidthPercentage(100);
/*        table.setSpacingBefore(0f);
        table.setSpacingAfter(0f);*/
        
		// first row
        PdfPCell cell = new PdfPCell(new Phrase("Contacts Report", font));
        cell.setColspan(15);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setPadding(5.0f);
        //cell.setBackgroundColor(new BaseColor(140, 221, 8));
        table.addCell(cell);
		//table.getDefaultCell().setBorder(0);
		//table.setWidths(new int[]{200,50});
		
		float[] columnWidths = new float[] {20f, 60f, 60f, 60f, 60f, 60f, 60f, 60f, 60f, 60f, 60f};
        table.setWidths(columnWidths);
		
		table.addCell(new PdfPCell(new Phrase("Id", font)));
		table.addCell(new PdfPCell(new Phrase("First Name", font)));
		table.addCell(new PdfPCell(new Phrase("Middle Name", font)));
		table.addCell(new PdfPCell(new Phrase("Last Name", font)));
		table.addCell(new PdfPCell(new Phrase("Jop Title", font)));
		table.addCell(new PdfPCell(new Phrase("Organization", font)));
		table.addCell(new PdfPCell(new Phrase("Email(Work)", font)));
		table.addCell(new PdfPCell(new Phrase("Email(Personal)", font)));
		table.addCell(new PdfPCell(new Phrase("Phone(Work)", font)));
		table.addCell(new PdfPCell(new Phrase("Mobile", font)));
		table.addCell(new PdfPCell(new Phrase("Parent RoW Id", font)));

/*		table.addCell(new PdfPCell(new Phrase("Created On")));
		table.addCell(new PdfPCell(new Phrase("Created By")));
		table.addCell(new PdfPCell(new Phrase("Last Updated")));
		table.addCell(new PdfPCell(new Phrase("Last Updated By")));*/
		
		for (Iterator<Contact> iter = contact.iterator(); iter.hasNext(); ) {
			Contact element = iter.next();
			table.addCell(new PdfPCell(new Phrase(element.getId(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getFirst_name(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getMiddle_name(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getLast_name(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getJob_title(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getOrg_name(), font)));

			table.addCell(new PdfPCell(new Phrase(element.getEmail_work(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getEmail_personal(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getWork_ph_num(), font)));

			table.addCell(new PdfPCell(new Phrase(element.getCell_ph_num(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPar_row_id(), font)));
/*			table.addCell(element.getCreated());
			table.addCell(element.getCreated_by());
			table.addCell(element.getLast_updated());
			table.addCell(element.getLast_updated_by());*/
		}		

		document.add(table);

		// to open the PDF in 100% zoom
		writer.setOpenAction(PdfAction.gotoLocalPage(1, new PdfDestination(
				PdfDestination.XYZ, 0, 10000, 1), writer));
		
	}

}
