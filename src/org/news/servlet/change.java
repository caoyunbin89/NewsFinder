package org.news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class change
 */
public class change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String lei=(String)request.getParameter("lei");
		String l=(String)session.getAttribute("titles");
		System.out.println(l);
		String gai=null;
		if(lei.equals("0")){
			gai="Hematology";
		}
		else if(lei.equals("1")){gai="MedicalMicrobiology";}
		else if(lei.equals("2")){gai="Immunology";}
		else if(lei.equals("3")){gai="Cytology";}
		else if(lei.equals("4")){gai="Histopathology";}
		else if(lei.equals("5")){gai="Bloodtransfusion";}
		else if(lei.equals("6")){gai="ClinicalChemistry";}
		else if(lei.equals("7")){gai="Biomedicine";}
		PrintWriter out=response.getWriter();
		out.print("l:"+l+"\n"+"gai:"+gai);
		hh h=new hh();
		h.save(gai,l);
		//response.sendRedirect("NewsFinderadmin.html");
		request.getRequestDispatcher("NewsFinderadmin.jsp").forward(request, response);
		
	}

}
