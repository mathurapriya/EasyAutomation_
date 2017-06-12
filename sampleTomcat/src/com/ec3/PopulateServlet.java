package com.ec3;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PopulateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/whoami").forward(request, response);
		
        try {
        } catch (Exception e) {
        	response.getWriter().println("Cannot load the credentials from the credential profiles file. " +
                    "Please make sure that your AwsCredentials.properties file is at the correct " +
                    "location (src folder), and is in valid format: " + e.getMessage());
        	return;
        }
        String message = request.getParameter("message");
        if(message == null){
        		response.getWriter().println("Please pass a parameter 'message'<br/>");
        		response.getWriter().println("Enter http://<server>/<appname>/send?message=<your message><br/>");
        		return;
        }
        try {
        }
        catch (Exception ex) {
        		response.getWriter().println("Error sending message to the Queue <br/>");
        		response.getWriter().println("Reason: " + ex.getMessage());
        } 
	}
}
