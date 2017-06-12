package com.ec3;
import java.io.*;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

import FunctionLibrary.dbconnect;


public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside add servlet");
		String Name = request.getParameter("Name").trim();
		String Selector = request.getParameter("Selector").trim();
		String Value = request.getParameter("Value").trim();
		String Project = request.getParameter("Project").trim();
		
		System.out.println(Name + Selector + Value );
		String Result = null;
		dbconnect db;
		try {
			db = new dbconnect(Project);			
			db.insert_Storehouse(Name, Selector, Value);
			Result = db.get_Storehouse();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(Result);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response){
  }
}

