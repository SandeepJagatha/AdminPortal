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
import com.tabner.model.Vendor;

public class VendorsPDFView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request,	HttpServletResponse response) 
			throws Exception {
		
		document.setPageSize(PageSize.A3.rotate());
		 Font font = FontFactory.getFont("Times-Roman", 8);
		 //document.add(new Paragraph("Times-Roman", font));
		
		List<Vendor> vendors = (List<Vendor>) model.get("vendors");
		
		PdfPTable table = new PdfPTable(8);
		
		table.setWidthPercentage(100);
		
		PdfPCell cell = new PdfPCell(new Phrase("Vendors Report", font));
		cell.setColspan(15);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(5.0f);
		table.addCell(cell);
			
		float[] columnWidths = new float[] {10f, 60f, 60f, 42f, 42f, 80f, 60f, 40f};
        table.setWidths(columnWidths);
		
		table.addCell(new PdfPCell(new Phrase("Id", font)));
		table.addCell(new PdfPCell(new Phrase("Name", font)));
		table.addCell(new PdfPCell(new Phrase("Contact Person", font)));
		table.addCell(new PdfPCell(new Phrase("Phone(Primary)", font)));
		table.addCell(new PdfPCell(new Phrase("Phone(Secondary)", font)));
		table.addCell(new PdfPCell(new Phrase("Email", font)));
		table.addCell(new PdfPCell(new Phrase("Website", font)));
		table.addCell(new PdfPCell(new Phrase("Payment Term", font)));
		
		for (Iterator<Vendor> iter = vendors.iterator(); iter.hasNext(); ) {	
			Vendor element = iter.next();
			table.addCell(new PdfPCell(new Phrase(element.getId(), font)));
			
			table.addCell(new PdfPCell(new Phrase(element.getVname(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getContact_person(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPh_num_primary(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPh_num_secondary(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getEmail_addr(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getWebsite(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPayment_term(), font)));
		}		

		document.add(table);

		// to open the PDF in 100% zoom
		writer.setOpenAction(PdfAction.gotoLocalPage(1, new PdfDestination(
				PdfDestination.XYZ, 0, 10000, 1), writer));
		
	}

}
