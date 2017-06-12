package com.ec3;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.internal.runners.model.EachTestNotifier;
import org.omg.CORBA.TRANSACTION_MODE;

import FunctionLibrary.Test;


public class SenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*public void doGet(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		      // Set response content type
		      response.setContentType("text/html");

		      PrintWriter out = response.getWriter();
		      String title = "Reading All Form Parameters";
				
		      String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " +
		         "transitional//en\">\n";
					
		      out.println(docType + "<html>\n" +
		         "<head><title>" + title + "</title></head>\n" +
		         "<body bgcolor=\"#f0f0f0\">\n" +
		         "<h1 align=\"center\">" + title + "</h1>\n" +
		         "<table width=\"100%\" border=\"1\" align=\"center\">\n" +
		         "<tr bgcolor=\"#949494\">\n" +
		         "<th>Param Name</th><th>Param Value(s)</th>\n"+
		         "</tr>\n");

		      Enumeration paramNames = request.getParameterNames();
		      
		      while(paramNames.hasMoreElements()) {
		         String paramName = (String)paramNames.nextElement();
		         out.print("<tr><td>" + paramName + "</td>\n<td>");
		         String[] paramValues = request.getParameterValues(paramName);
					
		         // Read single valued data
		         if (paramValues.length == 1) {
		            String paramValue = paramValues[0];
		            if (paramValue.length() == 0)
		               out.println("<i>No Value</i>");
		            else
		               out.println(paramValue);
		         } else {
		            // Read multiple valued data
		            out.println("<ul>");
						
		            for(int i=0; i < paramValues.length; i++) {
		               out.println("<li>" + paramValues[i]);
		            }
						
		            out.println("</ul>");
		         }
		      }
				
		      out.println("</tr>\n</table>\n</body></html>");
		   }
			
		   // Method to handle POST method request.
		   public void doPost(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		      doGet(request, response);
		   }
		
    
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id1 = request.getParameter("command").trim();
		System.out.println(id1);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("Msg from Servlet");
		/*String id = request.getParameter("var").trim();
		System.out.print("id is:"+id);
		//request.get
		Test test= new Test();    
		//test.testing(request.getParameter("myField"));
		String[] arrcommands = id.split(";;");
		String[] arrid = null;
		for (int cnt = 0; cnt < arrcommands.length; cnt++) {
			arrid = arrcommands[cnt].split(" ");			
		}	
		
		System.out.println(arrid[1]);
		test.mainflow(arrid[1]);*/
		 //RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
		//RequestDispatcher rs = request.getRequestDispatcher("FirstServlet");
         //rs.include(request, response);
		
        } 

}
