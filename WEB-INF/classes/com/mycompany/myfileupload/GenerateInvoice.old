package com.mycompany.myfileupload;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.pdmodel.font.*;
import org.apache.pdfbox.pdmodel.edit.*;


import com.mycompany.myfileupload.Properties;

public class GenerateInvoice{
    
    String mailTo = "";
    
    public static void main(String args[]) {
        try {
            // Create a new empty document
            PDDocument document = new PDDocument();
            
            // Create a new blank page and add it to the document
            PDPage blankPage = new PDPage();
            document.addPage( blankPage );
            
            // Save the newly created document
            document.save("BlankPage2.pdf");
            
            // finally make sure that the document is properly
            // closed.
            document.close();
            
            GenerateInvoice thisInvoice = new GenerateInvoice();
            thisInvoice.generateForLetter("36");

        } catch (Exception e) {

        }
    }
    
    public void generateForLetter (String briefID){

        String destinationLastName = "";        

        String firstName = "Jan";
        String lastName = "Blonde";
        String streetName = "Huybrechtsstraat";
        String streetNumber = "76";
        String zipCode = "2140";
        String city = "Borgerhout";
        String company = "BVBA CEEJAY";
        String vat = "BE0865267120";
        
        try {
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c9", Properties.username, Properties.password);
            
            String SQL = "SELECT * from Brieven where id = ?";
            PreparedStatement statement = con.prepareStatement(SQL);
            statement.setString(1,briefID);
            ResultSet rs = statement.executeQuery();
            
            if(rs.next()){
                destinationLastName = rs.getString("destinationLastName");
                String memberID = rs.getString("member_id");
                System.err.println(memberID);
                
                SQL = "SELECT * from Members where id = ?";
                statement = con.prepareStatement(SQL);
                statement.setString(1,memberID);
                ResultSet rs2 = statement.executeQuery();
                
                if(rs2.next()){
                    firstName = rs2.getString("first_name");
                    lastName = rs2.getString("last_name");
                    streetName = rs2.getString("streetname");
                    streetNumber = rs2.getString("streetnumber");
                    zipCode = rs2.getString("zipcode");
                    city = rs2.getString("city");
                    vat = rs2.getString("vat_number");
                    company = rs2.getString("company");
                }
            }
        
            // Create a new empty document
            PDDocument document = new PDDocument();
            
            // Create a new blank page and add it to the document
            PDPage page = new PDPage();
            document.addPage( page );
            
            PDFont font = PDType1Font.HELVETICA_BOLD;
            
            // Start a new content stream which will "hold" the to be created content
            PDPageContentStream contentStream = new PDPageContentStream(document, page);
            
            // Define a text content stream using the selected font, moving the cursor and drawing the text "Hello World"
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 100, 700 );
            contentStream.drawString( "BVBA CEEJAY" );
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 100, 690 );
            contentStream.drawString( "Huybrechtsstraat 76" );
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 100, 680 );
            contentStream.drawString( "2140 Borgerhout" );
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 100, 670 );
            contentStream.drawString( "BTW: BE0865267120" );
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 300, 700 );
            contentStream.drawString(company);
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 300, 690 );
            contentStream.drawString(streetName + " " + streetNumber);
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 300, 680 );
            contentStream.drawString(zipCode + " " + city);
            contentStream.endText();
            
            contentStream.beginText();
            contentStream.setFont( font, 10 );
            contentStream.moveTextPositionByAmount( 300, 670 );
            contentStream.drawString( "BTW: " + vat );
            contentStream.endText();
            
            // Make sure that the content stream is closed:
            contentStream.close();
            
            // Save the results and ensure that the document is properly closed:
            document.save( "HelloWorld2.pdf");
            document.close();
        
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
    public void generateForCredits (String creditLogID) {
        
    }
}