package org.news.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.*;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.sun.xml.internal.txw2.Document;

public class insert {
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException{
		hh h=new hh();
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		org.w3c.dom.Document doc = builder.parse("D:/news.xml");
		doc.normalize();
		NodeList news = doc.getElementsByTagName("article");
		ArrayList<String []> entrys = new ArrayList<String[]>();
		String a[]=new String[news.getLength()];
		String b[]=new String[news.getLength()];
		String c[]=new String[news.getLength()];
		String d[]=new String[news.getLength()];
		String e[]=new String[news.getLength()];
		String f[]=new String[news.getLength()];
		String g[]=new String[news.getLength()];
		for(int i=0;i<news.getLength();i++)
		{
			Element article =(Element) news.item(i);
			a[i]=article.getElementsByTagName("guid").item(0).getFirstChild().getNodeValue();
			b[i]=article.getElementsByTagName("pubdate").item(0).getFirstChild().getNodeValue();
			c[i]=article.getElementsByTagName("title").item(0).getFirstChild().getNodeValue();
			d[i]=article.getElementsByTagName("summary").item(0).getFirstChild().getNodeValue();
			e[i]=article.getElementsByTagName("url").item(0).getFirstChild().getNodeValue();
			f[i]=article.getElementsByTagName("content").item(0).getFirstChild().getNodeValue();
			g[i]=article.getElementsByTagName("topics").item(0).getFirstChild().getNodeValue();
			h.save(a[i], b[i], c[i], d[i], e[i], f[i], g[i]);
			System.out.println(a[i]);
			entrys.add(a);
			System.out.println(entrys);
		}
		
	}

}
