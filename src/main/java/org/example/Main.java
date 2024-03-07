package org.example;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import net.sf.saxon.TransformerFactoryImpl;


public class Main {
    public static void main(String[] args) throws TransformerException {
        TransformerFactory transformerFactory = new TransformerFactoryImpl();

        Source xsltFile = new StreamSource("src/main/resources/transform.xsl");

        Transformer transformer = transformerFactory.newTransformer(xsltFile);

        Source xmlInput = new StreamSource("src/main/resources/input.xml");

        Result xmlOutput = new StreamResult("src/main/resources/output.xml");

        transformer.transform(xmlInput, xmlOutput);

        System.out.println("Transformation complete!");
    }
}