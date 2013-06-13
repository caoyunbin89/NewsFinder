package org.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class input
 */
public class input extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public input() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String query = (String)session.getAttribute("keyword");
		//得到用户希望显示的pageNow
		String s_pageNow = request.getParameter("pageNow");
		//int pageNow = Integer.parseInt(s_pageNow);
		hh jobsbean = new hh();
    	ArrayList<String[]> entrys = new ArrayList<String[]>();
    	System.out.println("query:"+ query);
    	//ArrayList<String> LuUrls = new ArrayList<String>()
    	int len = -1;
		System.out.println("start get entrys");
		/*有bug*/
		entrys = jobsbean.getdata(query);
		System.out.println("返回结果个数:" + entrys.size());
		
		len = entrys.size() ;
		System.out.println(len);
		String[] urls = new String[len];
		String[] titles = new String[len];
		String[] contents = new String[len];
		String[] summarys=new String[len];
		String[] guids=new String[len];
		String[] topics=new String[len];
		String[] pubdate=new String[len];
		for(int i=0; i<len; i++){
			urls[i] = entrys.get(i)[0];
			titles[i] = entrys.get(i)[1];
			contents[i] = entrys.get(i)[2];
			summarys[i]=entrys.get(i)[3];
			guids[i]=entrys.get(i)[4];
			topics[i]=entrys.get(i)[5];
			pubdate[i]=entrys.get(i)[6];
			System.out.println(" guid:" + guids[i] );
			System.out.println(" topics:" + topics[i] );
			System.out.println("url:" + urls[i] );
			System.out.println(" id:" + titles[i] );
			System.out.println( " text:" + summarys[i]);
			System.out.println(" summary:" + contents[i] );
		}
		
		
		String length = String.valueOf(len);
		
		
		request.setAttribute("length", length);
		request.setAttribute("url", urls);
		request.setAttribute("title", titles);
		//session.setAttribute("titles",titles);
		request.setAttribute("content", contents);
		request.setAttribute("summary", summarys);
		request.setAttribute("guid", guids);
		request.setAttribute("topic", topics);
		request.setAttribute("pubdate", pubdate);
		request.setAttribute("s_pageNow", s_pageNow);
		request.getRequestDispatcher("first.jsp").forward(request, response);
	}

}
