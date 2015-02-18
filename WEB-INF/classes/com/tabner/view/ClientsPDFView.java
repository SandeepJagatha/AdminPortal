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
import com.tabner.model.Clients;

public class ClientsPDFView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request,	HttpServletResponse response) 
			throws Exception {
		document.setPageSize(PageSize.A3.rotate());
		Font font = FontFactory.getFont("Times-Roman", 8);
		
		List<Clients> clients = (List<Clients>) model.get("clients");
		PdfPTable table = new PdfPTable(10);
		
		table.setWidthPercentage(100);
		
		PdfPCell cell = new PdfPCell(new Phrase("Clients Report", font));
		cell.setColspan(15);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(5.0f);
		table.addCell(cell);
			
		float[] columnWidths = new float[] {10f, 60f, 60f, 42f, 42f, 80f, 40f, 40f, 60f, 40f};
        table.setWidths(columnWidths);
		
		table.addCell(new PdfPCell(new Phrase("Id", font)));
		table.addCell(new PdfPCell(new Phrase("Name", font)));
		table.addCell(new PdfPCell(new Phrase("Contact Person", font)));
		table.addCell(new PdfPCell(new Phrase("Phone(Pri.)", font)));
		table.addCell(new PdfPCell(new Phrase("Phone(Sec.)", font)));
		table.addCell(new PdfPCell(new Phrase("Email", font)));
		table.addCell(new PdfPCell(new Phrase("LOB", font)));
		table.addCell(new PdfPCell(new Phrase("Type", font)));
		table.addCell(new PdfPCell(new Phrase("Website", font)));
		table.addCell(new PdfPCell(new Phrase("Payment Term", font)));
		
		for (Iterator<Clients> iter = clients.iterator(); iter.hasNext(); ) {	
			Clients element = iter.next();
			table.addCell(new PdfPCell(new Phrase(element.getId(), font)));
			
			table.addCell(new PdfPCell(new Phrase(element.getClient_name(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getEmp_manager(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPh_num_primary(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPh_num_secondary(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getEmail_addr(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getLob(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getClient_type(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getWebsite(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPayment_term(), font)));
		}		

		document.add(table);

		// to open the PDF in 100% zoom
		writer.setOpenAction(PdfAction.gotoLocalPage(1, new PdfDestination(
				PdfDestination.XYZ, 0, 10000, 1), writer));
		
	}

}
