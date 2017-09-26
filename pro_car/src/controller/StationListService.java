package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import car.dto.StationVO;

@WebServlet("/stationlist")
public class StationListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		System.out.println("servlet call success ");	// @@@
		ArrayList<StationVO> list = new ArrayList<>();
		
		String s = System.getProperty("user.dir");		// @@@

	    System.out.println("현재 디렉토리는 " + s + " 입니다");  	// @@@

		FileInputStream fis = new FileInputStream("url.properties");

		Properties prop = new Properties();
		prop.load(fis);
		String svcUrl = (String)prop.get("urlstationlist");
		String servicekey = (String)prop.get("servicekey");
		
		StringBuilder urlBuilder = new StringBuilder(svcUrl);
		
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + servicekey);
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("600", "UTF-8")); /*페이지당 건수*/
//	    urlBuilder.append("&" + URLEncoder.encode("curPage","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*현재 페이지*/
	
	    URL url = new URL(urlBuilder.toString());
	    
	    System.out.println(url); 		// @@@
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");
		
	    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	    DocumentBuilder builder;
	    
	    try {
			builder = factory.newDocumentBuilder();
			Document document = builder.parse(conn.getInputStream());
			Element root = document.getDocumentElement();
			NodeList nodeList = root.getElementsByTagName("item");	  
			
			Node node = null;
			Element e = null;
			for (int i = 0; i < nodeList.getLength(); i++) {
				node = nodeList.item(i);
				if(node.getNodeType() == Node.ELEMENT_NODE){
					e = (Element) node;
					if(e.getElementsByTagName("csId").item(0).getChildNodes().getLength() <= 0
							|| e.getElementsByTagName("csId").item(0).getFirstChild().getTextContent().length() == 0 
							|| e.getElementsByTagName("csId").item(0).getFirstChild().getTextContent() == null 
							|| e.getElementsByTagName("csId").item(0).getFirstChild().getTextContent().equals("")){
						continue;
					} else {
						int id = Integer.parseInt(e.getElementsByTagName("csId").item(0).getFirstChild().getTextContent());
						String csnm = e.getElementsByTagName("csNm").item(0).getFirstChild().getTextContent();
						String addr = e.getElementsByTagName("addr").item(0).getFirstChild().getTextContent();
						String cpnm = e.getElementsByTagName("cpNm").item(0).getFirstChild().getTextContent();
						String lat = e.getElementsByTagName("lat").item(0).getFirstChild().getTextContent();
						String longi = e.getElementsByTagName("longi").item(0).getFirstChild().getTextContent();
						list.add(new StationVO(id, csnm, addr, cpnm, lat, longi ));
					}	
				}
			}
			
//			for(StationVO st : list) System.out.println(st);		// @@@
			for(StationVO st : list) {
				System.out.print(st.getId() + "; ");
				System.out.print(st.getCsnm() + "; ");
				System.out.print(st.getAddr() + "; ");
				System.out.print(st.getCpnm() + "; ");
				System.out.print(st.getLat() + "; ");
				System.out.println(st.getLongi() + "; ");
			}
			
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
	    
	} // end of service()

} // end of class
