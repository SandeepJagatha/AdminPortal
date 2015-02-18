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
import com.tabner.model.Address;

public class AddressPDFView  extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		document.setPageSize(PageSize.A3.rotate());
		Font font = FontFactory.getFont("Times-Roman", 8);
		
		List<Address> addresses = (List<Address>) model.get("addresses");
		PdfPTable table = new PdfPTable(10);
		
		table.setWidthPercentage(100);
		
		PdfPCell cell = new PdfPCell(new Phrase("Address Report", font));
		cell.setColspan(15);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(5.0f);
		table.addCell(cell);
			
		float[] columnWidths = new float[] {20f, 40f, 60f, 60f, 42f, 30f, 50f, 30f, 40f, 40f};
        table.setWidths(columnWidths);
		
		table.addCell(new PdfPCell(new Phrase("Id", font)));
		table.addCell(new PdfPCell(new Phrase("addr_type", font)));
		table.addCell(new PdfPCell(new Phrase("addr_line1", font)));
		table.addCell(new PdfPCell(new Phrase("addr_line2", font)));
		table.addCell(new PdfPCell(new Phrase("city", font)));
		table.addCell(new PdfPCell(new Phrase("country", font)));
		table.addCell(new PdfPCell(new Phrase("county", font)));
		table.addCell(new PdfPCell(new Phrase("state", font)));
		table.addCell(new PdfPCell(new Phrase("zipcode", font)));
		table.addCell(new PdfPCell(new Phrase("par_row_id", font)));
		
		for (Iterator<Address> iter = addresses.iterator(); iter.hasNext(); ) {	
			Address element = iter.next();
			table.addCell(new PdfPCell(new Phrase(element.getId(), font)));
			
			table.addCell(new PdfPCell(new Phrase(element.getAddr_type(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getAddr_line1(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getAddr_line2(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getCity(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getCountry(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getCounty(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getState(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getZipcode(), font)));
			table.addCell(new PdfPCell(new Phrase(element.getPar_row_id(), font)));
		}		

		document.add(table);

		// to open the PDF in 100% zoom
		writer.setOpenAction(PdfAction.gotoLocalPage(1, new PdfDestination(
				PdfDestination.XYZ, 0, 10000, 1), writer));
		
	}

}
