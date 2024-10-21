package movie_list;

import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.*;
import java.util.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.IOException;

public class Movie_Parser {
	 private String URL;
	    private String item;
	    private String[] elements;

	    // 생성자
	    public Movie_Parser(String URL, String item) {
	        this.URL = URL;
	        this.item = item;
	        // elements 배열을 내부에서 초기화
	        this.elements = new String[] { "rank", "movieNm", "openDt", "audiAcc", "salesAcc", "movieCd" };
	    }

	    // 날짜 계산 메소드 (LocalDate로 최적화)
	    String Day_Result(Boolean op) {
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	        LocalDate date = LocalDate.now().minusDays(op ? 1 : 7);
	        return date.format(formatter);
	    }

	    // XML 파싱 메소드
	    public List<Map<String, String>> XML_p(boolean week_day) throws Exception {
	        List<Map<String, String>> pubList = new ArrayList<>();
	        String URL_1 = URL + Day_Result(week_day);

	        // XML 파서 설정 및 파싱
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        Document document = builder.parse(URL_1);

	        // item 태그 가져오기
	        NodeList items = document.getElementsByTagName(item);

	        for (int i = 0; i < items.getLength(); i++) {
	            Node n = items.item(i);
	            Element e = (Element) n;
	            Map<String, String> pub = new HashMap<>();

	            // 각 요소(elements)에 해당하는 데이터를 추출
	            for (String element : elements) {
	                NodeList elementList = e.getElementsByTagName(element);
	                if (elementList != null && elementList.getLength() > 0) {
	                    Element elementNode = (Element) elementList.item(0);
	                    pub.put(element, elementNode.getTextContent());
	                }
	            }

	            pubList.add(pub);
	        }
	        return pubList;
	    }

}
